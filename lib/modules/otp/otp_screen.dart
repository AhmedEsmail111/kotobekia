import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../shared/constants/app/app_constant.dart';
import '../../shared/constants/images/images_constant.dart';
import '../../shared/styles/colors.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    return Directionality(
      textDirection: directionalityApp,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 63, left: w / 25, right: w / 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  color: midGrayColor,
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                  ),
                ),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                 Text(
                   'التحقق من البيانات',
                   style: Theme.of(context).textTheme.bodyLarge,
                 ),
                 SizedBox(
                   height: 32,
                 ),
                 Image.asset(
                   messageImage,
                   width: 109,
                   height: 87,
                 ),
                 SizedBox(
                   height: 32,
                 ),
                 Text('أدخل رمز OTP',style: Theme.of(context).textTheme.titleMedium,)

               ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
