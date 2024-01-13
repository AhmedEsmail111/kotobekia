import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kotobekia/controller/favorites/favorites_states.dart';
import 'package:kotobekia/models/fav_posts_model/fav_posts_model.dart';
import 'package:kotobekia/shared/component/toast_message.dart';
import 'package:kotobekia/shared/constants/api/api_constant.dart';
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:kotobekia/shared/helper/functions.dart';
import 'package:kotobekia/shared/network/local/local.dart';
import 'package:kotobekia/shared/network/remote/remote.dart';

class FavoritesCubit extends Cubit<FavoritesStates> {
  FavoritesCubit() : super(InitialFavoritesState());

  static FavoritesCubit get(context) => BlocProvider.of(context);

  List<String> faveIds = [];
  FavPostsModel? favePostsModel;
  void getFavPosts() async {
    if (await HelperFunctions.hasConnection() &&
        HelperFunctions.hasUserRegistered()) {
      try {
        emit(GetFavPostsLoadingState());
        final response = await DioHelper.getData(
          url: ApiConstant.getFavPostsMethodUrl,
          token: CacheHelper.getData(
            key: AppConstant.token,
          ),
        );

        if (response.statusCode == 200) {
          print('got fav posts successfully');
          favePostsModel = FavPostsModel.fromJson(response.data);
          if (favePostsModel != null) {
            faveIds = favePostsModel!.posts.map((post) => post.id).toList();
          }
          print(faveIds.first);
          emit(GetFavPostsSuccessState());
        } else {
          print('unsuccess');
          emit(GetFavPostsFailureState());
        }
      } catch (error) {
        print(error.toString());
        emit(GetFavPostsFailureState());
      }
    } else if (!await HelperFunctions.hasConnection()) {
      emit(GetFavPostsInternetFailureState());
    }
  }

  Future<bool> addToFavorites(String postId) async {
    var isAdded = false;
    if (await HelperFunctions.hasConnection()) {
      emit(AddToFavLoadingState());
      try {
        final response = await DioHelper.postData(
          url: '${ApiConstant.addToFavMethodUrl}$postId',
          token: CacheHelper.getData(key: AppConstant.token),
        );

        if (response.statusCode == 200) {
          print('success');
          isAdded = true;

          emit(AddToFavSuccessState());
        } else {
          print('unsuccess');
          isAdded = false;
          emit(AddToFavFailureState());
        }
      } catch (e) {
        print(e.toString());
        isAdded = false;
        emit(AddToFavFailureState());
      }
    } else {
      // emit(AddToFavFailureInternetState());
      buildToastMessage(
          message: 'لا يوجد إتصال بالإنترنت', gravity: ToastGravity.CENTER);
    }

    return isAdded;
  }

  Future<bool> removeFromFavorites(String postId) async {
    var isRemoved = false;
    if (await HelperFunctions.hasConnection()) {
      emit(RemoveFromFavLoadingState());
      try {
        final response = await DioHelper.postData(
          url: '${ApiConstant.removeFromFavMethodUrl}$postId',
          token: CacheHelper.getData(key: AppConstant.token),
        );

        if (response.statusCode == 200) {
          print('removed successfully');
          isRemoved = true;
          emit(RemoveFromFavSuccessState());
        } else {
          print('unremoved');
          isRemoved = false;
          emit(RemoveFromFavFailureState());
        }
      } catch (e) {
        print(e.toString());
        isRemoved = false;
        emit(RemoveFromFavFailureState());
      }
    } else {
      buildToastMessage(
          message: 'لا يوجد إتصال بالإنترنت', gravity: ToastGravity.CENTER);
      // emit(RemoveFromFavInternetFailureState());
    }
    return isRemoved;
  }

  void handleLoveClick({required bool status, required String postId}) async {
    if (state is! AddToFavLoadingState && state is! RemoveFromFavLoadingState) {
      if (status == false) {
        final isAddedSuccessfully = await addToFavorites(postId);

        if (!isAddedSuccessfully) {
          faveIds.remove(postId);
          buildToastMessage(
            message: 'sorry a problem happened',
            gravity: ToastGravity.CENTER,
          );
          getFavPosts();
        }
      } else {
        final isRemovedSuccessfully = await removeFromFavorites(postId);
        if (!isRemovedSuccessfully) {
          faveIds.add(postId);
          buildToastMessage(
            message: 'sorry a problem happened',
            gravity: ToastGravity.CENTER,
          );
          getFavPosts();
        }
      }
    }
  }

  void toggleFaveStatus(String postId, bool status) {
    if (state is! AddToFavLoadingState && state is! RemoveFromFavLoadingState) {
      if (status) {
        faveIds.remove(postId);
      } else {
        faveIds.add(postId);
      }
      emit(ToggleFaveStatusState());
    }
  }
}
