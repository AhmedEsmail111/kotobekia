import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotobekia/controller/category/category_states.dart';
import 'package:kotobekia/models/category_model/specific_category_model.dart';
import 'package:kotobekia/shared/component/snakbar_message.dart';
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
  Future<void> getCategory(
      {required String category,
      required BuildContext context,
      required String noInternet,
      required String weakInternet,
      required String noMore}) async {
    if (isThereOtherData &&
        page != null &&
        await HelperFunctions.hasConnection() &&
        state is! GetCategoryDataLoadingState) {
      // isLoading will only be true when he tries to fetch other pages(more date),
      //and that does not include when he opens the category screen for the first time
      isLoading = page == 1 ? false : true;
      emit(GetCategoryDataLoadingState(isFirstFetch: page == 1));
      try {
        // print(page);

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
          print(response.data);
          print('totla ${specificCategoryModel!.totalDocuments}');

          isLoading = false;
          posts = posts + specificCategoryModel!.posts;
          page = specificCategoryModel!.nextPage;

          isThereOtherData = page == null ? false : true;

          print(posts.length);
          print(page);
          print(isThereOtherData);

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
    } else {
      if (context.mounted) {
        snackBarMessage(
            context: context,
            message: noMore,
            snackbarState: SnackbarState.inValid,
            duration: const Duration(seconds: 2));
      }
    }
  }

  final scrollController = ScrollController();
  void handleScroll(
      {required String category,
      required BuildContext context,
      required String noInternet,
      required String weakInternet,
      required noMore}) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          getCategory(
            category: category,
            context: context,
            noInternet: noInternet,
            weakInternet: weakInternet,
            noMore: noMore,
          );
        }
      }
    });
  }
}
