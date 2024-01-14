import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:kotobekia/controller/profile/profile_states.dart';
import 'package:kotobekia/models/identity_user_model/identity_user_model.dart';
import 'package:kotobekia/models/user_data_model/user_data_model.dart';
import 'package:kotobekia/shared/component/authentication/gender_row_in_auth.dart';
import 'package:kotobekia/shared/constants/api/api_constant.dart';
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:kotobekia/shared/network/local/local.dart';
import 'package:kotobekia/shared/network/remote/remote.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(InitialProfileState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  IdentityUserModel? identityUserModel;
  void getIdentityUser({
    required String? token,
  }) async {
    if (token != null) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      identityUserModel = IdentityUserModel.fromJson(decodedToken);
      if (identityUserModel != null) {
        await CacheHelper.saveData(
            key: AppConstant.userId, value: identityUserModel!.id);
      }

      print(CacheHelper.getData(key: AppConstant.userId));
      emit(SuccessGetIdentityUserState(identityUserModel!));
    }
  }

  bool hasAccount =
      CacheHelper.getData(key: AppConstant.token) != null ? true : false;
  void signOut() async {
    await CacheHelper.removeData(key: AppConstant.token);
    await CacheHelper.removeData(key: AppConstant.userId);
    await CacheHelper.removeData(key: AppConstant.userGender);
    hasAccount = false;
    emit(SignOutState());
  }

  void setUser(String? token) {
    if (token != null) {
      hasAccount = true;
    } else {
      hasAccount = false;
    }
    emit(SetUserState());
  }

  bool isDarkMode = ThemeMode.system == ThemeMode.dark ? true : false;

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    emit(ToggleDarkModeState());
  }

  UserDataModel? userDataModel;

  void getUser() async {
    if (hasAccount) {
      try {
        emit(GetUserDataLoadingState());

        final userId = CacheHelper.getData(key: AppConstant.userId);
        final token = CacheHelper.getData(key: AppConstant.token);
        final response = await DioHelper.getData(
          url: '${ApiConstant.getSpecificUserMethodUrl}$userId',
          token: token,
        );

        if (response.statusCode == 200) {
          print('got user data successfully');

          userDataModel = UserDataModel.fromJson(response.data);
          await CacheHelper.saveData(
              key: AppConstant.userGender, value: userDataModel!.user.gender);
          emit(GetUserDataSuccessState());
        } else {
          print('not 200 statuscode');
          emit(GetUserDataFailureState());
        }
      } catch (error) {
        print(error);
        emit(GetUserDataFailureState());
      }
    }
  }

  gender genderValue =
      CacheHelper.getData(key: AppConstant.userGender) == 'male'
          ? gender.Male
          : gender.Female;

  void changeGender(int value) {
    if (value == 0) {
      genderValue = gender.Male;
    } else {
      genderValue = gender.Female;
    }
    emit(UserChangingGenderState());
  }

  void updateUser({
    required String name,
    required String email,
    required String birthDate,
    required String gender,
  }) async {
    try {
      emit(UpdateUserLoadingState());
      final token = CacheHelper.getData(key: AppConstant.token);
      final userId = CacheHelper.getData(key: AppConstant.userId);
      print(token);
      final response = await DioHelper.patchData(
        url: '${ApiConstant.updateUserMethodUrl}$userId',
        data: {
          "fullName": name,
          "email": email,
          "birthDate": birthDate,
          "gender": gender
        },
        token: token,
      );
      if (response.statusCode == 200) {
        getUser();
        emit(UpdateUserSuccessState());
        print('updated user successfully');
      } else {
        emit(UpdateUserFailureState());
        print('problem updating user');
      }
    } catch (error) {
      print(error);
      emit(UpdateUserFailureState());
    }
  }
}
