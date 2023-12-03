part of 'otp_cubit.dart';

@immutable
abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpCollectResultState extends OtpState {}


class LoadingVerifyOtpState extends OtpState {}

class SuccessVerifyOtpState extends OtpState {
  final String error;

  SuccessVerifyOtpState(this.error);
}

class FailedVerifyOtpState extends OtpState {
  final String error;

  FailedVerifyOtpState(this.error);
}

class SuccessResendOtpState extends OtpState {}