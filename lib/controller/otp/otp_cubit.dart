import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:kotobekia/models/user_model/user_model.dart';
import 'package:meta/meta.dart';

import '../../shared/constants/api/api_constant.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  var firstNumberController = TextEditingController();
  var secondNumberController = TextEditingController();
  var thirdNumberController = TextEditingController();
  var fourNumberController = TextEditingController();
  String otpResult='';
  void otpResultCollect(){
    otpResult='';
    otpResult=firstNumberController.text.toString() +
        secondNumberController.text.toString() +
        thirdNumberController.text.toString() +
        fourNumberController.text.toString();
    emit(OtpCollectResultState());
  }
  final dio = Dio();
  void verifyOtp({
    required String email,
    required String otp,
  }) async {

    emit(LoadingVerifyOtpState());

    try {
      final Response response = await dio.post(
          ApiConstant.verifyOtp,
          data: {'email': email, 'OTP':otp}
      );
      print(response.data.toString());

      emit(SuccessVerifyOtpState(response.data.toString()));
    } catch (error) {
      if (error is DioError) {
        print(error.response.toString());
        emit(SuccessVerifyOtpState(error.response.toString()));
      } else {
        print(error.toString());
        emit(FailedVerifyOtpState('there is Error'));
      }
    }
  }

  int secondsRemaining = 30;
  bool enableResend = false;
  Timer ?timer;

  void resendOtp(){
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
          secondsRemaining--;
      } else {
          enableResend = true;
      }
      emit(SuccessResendOtpState());
    });
  }



}
