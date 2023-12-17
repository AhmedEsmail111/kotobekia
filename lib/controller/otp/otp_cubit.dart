import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:kotobekia/models/otp_model/otp_model.dart';
import 'package:kotobekia/models/user_model/user_model.dart';
import 'package:kotobekia/shared/network/remote/remote.dart';
import 'package:meta/meta.dart';

import '../../shared/constants/api/api_constant.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  var firstNumberController = TextEditingController();
  var secondNumberController = TextEditingController();
  var thirdNumberController = TextEditingController();
  var fourNumberController = TextEditingController();
  String otpResult = '';

  void otpResultCollect() {
    otpResult = '';
    otpResult = firstNumberController.text.toString() +
        secondNumberController.text.toString() +
        thirdNumberController.text.toString() +
        fourNumberController.text.toString();
    emit(OtpCollectResultState());
  }

  OtpModel? otpModel;

  void verifyOtp({
    required String email,
    required String otp,
  }) async {
    emit(LoadingVerifyOtpState());

    try {
      final response = await DioHelper.postData(
          url: ApiConstant.verifyOtp, data: {'email': email, 'OTP': otp});

      print(response.data.toString());
      Map<String, dynamic> responseData = response.data;
      otpModel = OtpModel.fromJson(responseData);
      emit(SuccessVerifyOtpState(otpModel!));
    } catch (error) {
      if (error is DioError) {
        print(error.response.toString());
        Map<String, dynamic> responseData = error.response!.data;
        otpModel = OtpModel.fromJson(responseData);
        emit(SuccessVerifyOtpState(otpModel!));
      } else {
        print(error.toString());
        emit(FailedVerifyOtpState('there is Error'));
      }
    }
  }

  void resendOtp({required String email}) async {
    try {
      final response = await DioHelper.postData(
          url: ApiConstant.resendOtp, data: {'email': email});

      print(response.data.toString());
      Map<String, dynamic> responseData = response.data;
      otpModel = OtpModel.fromJson(responseData);
      emit(SuccessResendOtpState(otpModel!));
    } catch (error) {
      print(error.toString());
      emit(FailedResendOtpState('Error when send OTP'));
    }
  }

  int secondsRemaining = 30;
  bool enableResend = true;
  Timer? timer;

  void resendOtpTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining != 0) {
        enableResend = false;
        secondsRemaining--;
      } else {
        secondsRemaining = 30;
        enableResend = true;
        timer.cancel();
      }
      emit(SuccessResendOtpAndStartTimerState());
    });
  }
}
