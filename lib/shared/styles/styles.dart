import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

ThemeData lightTheme({required double width, required double height}) =>
    ThemeData(
      textTheme: TextTheme(
        displayLarge: TextStyle(
            fontFamily: 'NotoSansArabic-SemiBold',
            fontSize: 20.sp,
            letterSpacing: 0.1,
            color: primaryColor,
            fontWeight: FontWeight.w800),
        bodyLarge: TextStyle(
            fontFamily: 'NotoSansArabic-SemiBold',
            fontSize: 18.sp,
            letterSpacing: 0.1,
            fontWeight: FontWeight.w900),
        bodyMedium: TextStyle(
          fontFamily: 'NotoSansArabic-SemiBold',
          fontSize: 14.sp,
          letterSpacing: 0.1,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          fontFamily: 'NotoSansArabic-Medium',
          fontSize: 16.sp,
          letterSpacing: 0.1,
        ),
        displayMedium: TextStyle(
          fontFamily: 'NotoSansArabic-Regular',
          fontSize: 14.sp,
          letterSpacing: 0.1,
        ),
        titleLarge: TextStyle(
            fontFamily: 'NotoSansArabic-SemiBold',
            fontSize: 20.sp,
            color: primaryColor,
            letterSpacing: 0.1,
            fontWeight: FontWeight.bold),
      ),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: scaffoldBackgroundColor,
              statusBarIconBrightness: Brightness.dark),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: iconColor,
            size: width / 18,
          )),
    );
