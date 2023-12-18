import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kotobekia/controller/category_details/category_details_states.dart';
import 'package:kotobekia/shared/component/toast_message.dart';
import 'package:kotobekia/shared/constants/api/api_constant.dart';
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:kotobekia/shared/helper/functions.dart';
import 'package:kotobekia/shared/network/remote/remote.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoryDetailsCubit extends Cubit<CategoryDetailsStates> {
  CategoryDetailsCubit() : super(InitialCategoryDetailsState());

  static CategoryDetailsCubit get(context) => BlocProvider.of(context);

  void sharePost(String postUrl) {
    final url = Uri.parse('${AppConstant.baseShareUrl}/post/$postUrl');
    Share.shareUri(url);
  }

  void handleCall(String phoneNumber) async {
    final phoneUrl = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(phoneUrl)) {
      await launchUrl(phoneUrl);
    } else {
      print('Could not launch $phoneUrl');
    }
  }

  Future<bool> addToFavorites(String postId) async {
    var isAdded = false;
    if (await HelperFunctions.hasConnection()) {
      emit(AddToFavLoadingState());
      try {
        final response = await DioHelper.postData(
          url: '${ApiConstant.addToFavMethodUrl}$postId',
          token:
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NzRlMDU4ODVjZDBkYTczZmRhYmE5MiIsImZ1bGxOYW1lIjoiTW9qYW5hZCIsImVtYWlsIjoibW9qYW5hZEBrb3RvYmVraWEuY29tIiwicm9sZSI6InVzZXIiLCJpc0NvbmZpcm1lZCI6ZmFsc2UsImlhdCI6MTcwMjE1ODQyNH0.j0VMeWdxwoy7idBLUI-jvWD0r38MS0o_s4goAL_Gp4k',
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
            token:
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NzRlMDU4ODVjZDBkYTczZmRhYmE5MiIsImZ1bGxOYW1lIjoiTW9qYW5hZCIsImVtYWlsIjoibW9qYW5hZEBrb3RvYmVraWEuY29tIiwicm9sZSI6InVzZXIiLCJpc0NvbmZpcm1lZCI6ZmFsc2UsImlhdCI6MTcwMjE1ODQyNH0.j0VMeWdxwoy7idBLUI-jvWD0r38MS0o_s4goAL_Gp4k');

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
    }
    return isRemoved;
  }

  void handleLoveClick({required bool status, required String postId}) async {
    print(postId);
    if (status == false) {
      final isAddedSuccessfully = await addToFavorites(postId);
      if (isAddedSuccessfully) {
        buildToastMessage(
          message: 'the post added to favorites',
          gravity: ToastGravity.CENTER,
        );
      }
    } else {
      final isRemovedSuccessfully = await removeFromFavorites(postId);
    }
  }
}
