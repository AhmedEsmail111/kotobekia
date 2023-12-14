import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotobekia/controller/category/category_states.dart';
import 'package:kotobekia/models/category_model/specific_category_model.dart';
import 'package:kotobekia/shared/constants/api/api_constant.dart';
import 'package:kotobekia/shared/helper/functions.dart';
import 'package:kotobekia/shared/network/remote/remote.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(InitialCategoryState());

  static CategoryCubit get(context) => BlocProvider.of(context);

  bool isGrid = true;
  void changeLayout(status) {
    isGrid = status;
    emit(ChangeLayoutCategoryState());
  }

  List<Result> posts = [];
  int? page = 1;
  bool isLoading = false;
  bool isThereOtherData = true;
  SpecificCategoryModel? specificCategoryModel;
  void getCategory(
      {required String category,
      required BuildContext context,
      required String noInternet,
      required String weakInternet}) async {
    if (isThereOtherData &&
        page != null &&
        await HelperFunctions.hasConnection()) {
      isLoading = true;
      emit(GetCategoryDataLoadingState(isFirstFetch: page == 1));
      try {
        final response = await DioHelper.getData(
          url: '${ApiConstant.getSpecificCategoryMethodUrl}$category',
          query: {'page': page},
        );

        if (response.data == null) {
          emit(GetCategoryDataFailureState());
          return;
        }

        if (response.statusCode == 200) {
          print('success state');
          specificCategoryModel = SpecificCategoryModel.fromJson(response.data);
          isLoading = false;

          page = specificCategoryModel!.nextPage;

          isThereOtherData =
              specificCategoryModel!.remainingPages == 0 ? false : true;

          posts = posts + specificCategoryModel!.posts;

          emit(GetCategoryDataSuccessState());
        }
      } catch (error) {
        isLoading = false;
        print(error);
        if (error is SocketException) {
          emit(GetCategoryDataInternetFailureState(message: weakInternet));
        }
        if (error is DioException &&
                error.type == DioExceptionType.connectionError ||
            error is DioException &&
                error.type == DioExceptionType.connectionTimeout ||
            error is DioException &&
                error.type == DioExceptionType.sendTimeout ||
            error is DioException &&
                error.type == DioExceptionType.receiveTimeout) {
          emit(GetCategoryDataInternetFailureState(message: weakInternet));
        }
        //  else {
        //   emit(GetCategoryDataFailureState());
        // }
      }
    } else if (!await HelperFunctions.hasConnection()) {
      emit(GetCategoryDataInternetFailureState(message: noInternet));
    }
  }

  final scrollController = ScrollController();
  void handleScroll(
      {required String category,
      required BuildContext context,
      required String noInternet,
      required String weakInternet}) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0 &&
            isThereOtherData &&
            state is! GetCategoryDataLoadingState) {
          getCategory(
            category: category,
            context: context,
            noInternet: noInternet,
            weakInternet: weakInternet,
          );
        }
      }
    });
  }
}
