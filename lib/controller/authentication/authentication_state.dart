part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class LoadingUserCreateAccountState extends AuthenticationState {}

class SuccessUserCreateAccountState extends AuthenticationState {
  final UserModel userModel;

  SuccessUserCreateAccountState(this.userModel);
}

class FailedUserCreateAccountState extends AuthenticationState {
  final String error;

  FailedUserCreateAccountState(this.error);
}

class LoadingUserLoginState extends AuthenticationState {}

class SuccessUserLoginState extends AuthenticationState {
  final UserModel userModel;

  SuccessUserLoginState(this.userModel);
}

class FailedUserLoginState extends AuthenticationState {
  final String error;

  FailedUserLoginState(this.error);
}

class SuccessChangeGenderState extends AuthenticationState {}

class SuccessChangeCheckLanguageState extends AuthenticationState {}

class SuccessChangeVisibilityPasswordState extends AuthenticationState {}

class ChangeDefaultLanguageAuthenticationState extends AuthenticationState {}