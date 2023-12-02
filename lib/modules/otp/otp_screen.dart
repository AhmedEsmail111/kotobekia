import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotobekia/controller/otp/otp_cubit.dart';
import 'package:kotobekia/modules/verified_email/verified_email_screen.dart';
import 'package:kotobekia/shared/component/authentication/default_button_in_app.dart';
import 'package:kotobekia/shared/component/authentication/row_text_and_link.dart';
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:kotobekia/shared/constants/images/images_constant.dart';
import '../../shared/component/authentication/otp_container.dart';
import '../../shared/component/snakbar_message.dart';
import '../../shared/styles/colors.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    TextTheme font = Theme.of(context).textTheme;
    FocusNode firstFocusNode = FocusNode();
    FocusNode secondFocusNode = FocusNode();
    var cubit = context.read<OtpCubit>();
    final String email = ModalRoute.of(context)?.settings.arguments as String;
    FocusNode thirdFocusNode = FocusNode();
    FocusNode fourthFocusNode = FocusNode();
    cubit.firstNumberController.clear();
    cubit.secondNumberController.clear();
    cubit.thirdNumberController.clear();
    cubit.fourNumberController.clear();
    return BlocConsumer<OtpCubit, OtpState>(
      builder: (context, state) {
        return Directionality(
          textDirection: AppConstant.directionalityApp,
          child: Scaffold(
            body: SingleChildScrollView(
              physics:const  BouncingScrollPhysics(),
              child: Padding(
                padding:
                    EdgeInsets.only(top: h / 13, left: w / 25, right: w / 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: w / 14,
                        height: h / 25.5,
                        color: midGrayColor,
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: h / 18),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'التحقق من البيانات',
                            style: font.bodyLarge,
                          ),
                          SizedBox(
                            height: h / 26,
                          ),
                          Image.asset(
                            ImageConstant.messageImage,
                            width: w / 3,
                            height: h / 9.6,
                          ),
                          SizedBox(
                            height: h / 26,
                          ),
                          Text(
                            'أدخل رمز OTP',
                            style: font.titleMedium,
                          ),
                          SizedBox(
                            height: h / 26,
                          ),
                          Row(
                            children: [
                              Text(
                                'تم إرسال كود OTP مكون من',
                                style: font.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: w / 28),
                              ),
                              Text(
                                ' 4 ',
                                style: font.displayMedium!.copyWith(
                                    color: strieghtLineColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: w / 28),
                              ),
                              Text(
                                'ارقام علي بريدك الإلكتروني.',
                                style: font.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: w / 28),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'قم بإدخال الكود:',
                                style: font.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: w / 28),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h / 55.5,
                          ),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BuildOtpContainer(
                                    cubit: cubit,
                                    currentFocusNode: firstFocusNode,
                                    nextFocusNode: secondFocusNode,
                                    context: context,
                                    numberController:
                                        cubit.firstNumberController),
                                BuildOtpContainer(
                                    cubit: cubit,
                                    nextFocusNode: thirdFocusNode,
                                    currentFocusNode: secondFocusNode,
                                    context: context,
                                    numberController:
                                        cubit.secondNumberController),
                                BuildOtpContainer(
                                    cubit: cubit,
                                    nextFocusNode: fourthFocusNode,
                                    currentFocusNode: thirdFocusNode,
                                    context: context,
                                    numberController:
                                        cubit.thirdNumberController),
                                BuildOtpContainer(
                                    cubit: cubit,
                                    currentFocusNode: fourthFocusNode,
                                    nextFocusNode: fourthFocusNode,
                                    context: context,
                                    numberController:
                                        cubit.fourNumberController),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: h / 26,
                          ),
                          state is! LoadingVerifyOtpState
                              ? BuildDefaultButton(
                                  onTap: cubit.otpResult.length == 4
                                      ? () {
                                          cubit.verifyOtp(
                                              email: email,
                                              otp: cubit.otpResult);
                                          print(cubit.otpResult);
                                        }
                                      : null,
                                  text: 'تأكيد',
                                  color: primaryColor,
                                  elevation: 4,
                                  context: context)
                              : const Center(
                                child: CircularProgressIndicator(
                                    color: primaryColor,
                                  ),
                              ),
                          SizedBox(
                            height: h / 26,
                          ),
                         BuildRowTextAndLink(
                           cubit: cubit,
                              fontSize: w / 25.5,
                              text: 'لم  تتلقى رمز  OTP ؟',
                              textLink: ' إعادة إرسال الكود',
                              context: context,
                              onTap: () {
                                cubit.resendOtp(email: email.toString());
                                cubit.resendOtpTimer();
                              }),
                          SizedBox(
                            height: h / 6,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is SuccessVerifyOtpState) {
          if(state.otpModel.message=='OTP Verified Successfully'){
            Navigator.pushReplacementNamed(context, 'verifiedEmail');
          }else{
            snakBarMessage(
                snackbarState: SnackbarState.error,
                context: context,
                message: state.otpModel.message.toString());
          }

        }else if (state is FailedVerifyOtpState){
          snakBarMessage(
              snackbarState: SnackbarState.error,
              context: context,
              message: state.error);
        }
      },
    );
  }
}
