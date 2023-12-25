import 'package:kotobekia/models/identity_user_model/identity_user_model.dart';

abstract class HomeStates {}

class InitialHomeState extends HomeStates {}

class ChangeBottomNavBarHomeState extends HomeStates {}

class GetHomeDataSuccessHomeState extends HomeStates {}

class GetHomeDataFailureHomeState extends HomeStates {}

class GetHomeDataInternetFailureHomeState extends HomeStates {
  final String message;

  GetHomeDataInternetFailureHomeState({required this.message});
}

class GetHomeDataLoadingHomeState extends HomeStates {}

class ChangeModalBottomSheetHomeState extends HomeStates {}

class SuccessGetIdentityUserState extends HomeStates {
  final IdentityUserModel identityUserModel;

  SuccessGetIdentityUserState(this.identityUserModel);
}