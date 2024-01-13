import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotobekia/controller/search/search_states.dart';
import 'package:kotobekia/models/search_model/search_model.dart';
import 'package:kotobekia/shared/constants/api/api_constant.dart';
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:kotobekia/shared/helper/functions.dart';
import 'package:kotobekia/shared/network/local/local.dart';
import 'package:kotobekia/shared/network/remote/remote.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super((InitialSearchState()));

  static SearchCubit get(context) => BlocProvider.of(context);
  SearchModel? searchModel;
  void search(String query) async {
    if (await HelperFunctions.hasConnection()) {
      try {
        emit(LoadingSearchState());
        final response = await DioHelper.getData(
          url: ApiConstant.searchMethodUrl,
          query: {'keyword': query},
          token: CacheHelper.getData(key: AppConstant.token),
        );

        if (response.statusCode == 200) {
          print('got search successfully');
          searchModel = SearchModel.fromJson(response.data);
          emit(SuccessSearchState());
        } else {
          print('error getting search');
          emit((FailureSearchState()));
        }
      } catch (error) {
        print(error);
        emit(FailureSearchState());
      }
    }
  }
}
