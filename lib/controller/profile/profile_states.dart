import 'package:kotobekia/models/identity_user_model/identity_user_model.dart';

abstract class ProfileStates {}

class InitialProfileState extends ProfileStates {}

class SignOutState extends ProfileStates {}

class SetUserState extends ProfileStates {}

class SuccessGetIdentityUserState extends ProfileStates {
  final IdentityUserModel identityUserModel;

  SuccessGetIdentityUserState(this.identityUserModel);
}

class ToggleDarkModeState extends ProfileStates {}

class GetUserDataLoadingState extends ProfileStates {}

class GetUserDataSuccessState extends ProfileStates {}

class GetUserDataFailureState extends ProfileStates {}

class UserChangingGenderState extends ProfileStates {}

class UpdateUserLoadingState extends ProfileStates {}

class UpdateUserSuccessState extends ProfileStates {}

class UpdateUserFailureState extends ProfileStates {}
