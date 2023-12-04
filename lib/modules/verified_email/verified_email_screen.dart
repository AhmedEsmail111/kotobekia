import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/modules/get_start/get_start_screen.dart';
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../shared/constants/images/images_constant.dart';
class VerifiedEmailScreen extends StatelessWidget {
  const VerifiedEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    TextTheme font = Theme.of(context).textTheme;
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 5)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamed(context, '');
          });
        }
        return Scaffold(
          body: Padding(
            padding:  EdgeInsets.only(top: h/16),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'تم التحقق',
                    style: font.bodyLarge,
                  ),
                  SizedBox(
                    height: 37.h,
                  ),
                  Image.asset(
                    ImageConstant.doneVerifiedEmailImage,
                    width: w/1,
                    height: h/3.15,
                  ),
                  SizedBox(
                    height: h/18,
                  ),
                  Text(
                    'تم تأكيد البريد اﻷلكتروني بنجاح',
                    style: font.bodyLarge,
                  ),
                  SizedBox(
                    height: h/62,
                  ),
                  Text(
                    'جاري تحويلك للصفحه الرئيسية ...',
                    style: font.titleMedium!.copyWith(
                        color: ColorConstant.primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: w/25.5),
                  )
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
