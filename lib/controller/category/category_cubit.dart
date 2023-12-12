import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotobekia/controller/category/category_states.dart';
import 'package:kotobekia/models/category_model/specific_category_model.dart';
import 'package:kotobekia/shared/constants/api/api_constant.dart';
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
  void getCategory(String category, context) async {
    if (isThereOtherData && page != null) {
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
          page = specificCategoryModel!.nextPage;
          isThereOtherData =
              specificCategoryModel!.remainingPages == 0 ? false : true;
          isLoading = false;
          posts = posts + specificCategoryModel!.posts;

          emit(GetCategoryDataSuccessState());
        }
      } catch (e) {
        emit(GetCategoryDataFailureState());
        print(e);
      }
    }
    //  else {
    //
    // }
  }

  final scrollController = ScrollController();
  void handleScroll(String category, context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0 &&
            isThereOtherData &&
            state is! GetCategoryDataLoadingState) {
          getCategory(category, context);
        }
      }
    });
  }
}
