import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kotobekia/controller/otp/otp_cubit.dart';
import '../../styles/colors.dart';


//Container in OTP Screen

class BuildOtpContainer extends StatelessWidget {
  final BuildContext context;
  final TextEditingController numberController;
  final FocusNode currentFocusNode;
  final FocusNode nextFocusNode;
  final OtpCubit cubit;
  const BuildOtpContainer({super.key,
    required this.context,
    required this.cubit,
    required this.currentFocusNode,
    required this.nextFocusNode,
    required this.numberController});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery
          .of(context)
          .size
          .width / 5.2,
      decoration: BoxDecoration(
        color: ColorConstant.midGrayColor,
        borderRadius:
        BorderRadius.circular(MediaQuery
            .of(context)
            .size
            .height / 52),
      ),
      child: TextField(
        style: Theme
            .of(context)
            .textTheme
            .bodyLarge,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: numberController,
        focusNode: currentFocusNode,
        onChanged: (value) {
          cubit.otpResultCollect();
          if (value.isNotEmpty) {
            currentFocusNode.unfocus();
            FocusScope.of(context).requestFocus(nextFocusNode);
          }
        },
        maxLength: 1,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorConstant.midGrayColor,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(
                  MediaQuery
                      .of(context)
                      .size
                      .height / 80)),
          counterText: '',
        ),
      ),
    );
  }
}

