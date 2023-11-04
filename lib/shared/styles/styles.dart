import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(
    displayLarge: TextStyle(
        fontFamily: 'NotoSansArabic-SemiBold',
        fontSize: 14.sp,
        fontWeight: FontWeight.w900),
    bodyLarge: TextStyle(
        fontFamily: 'NotoSansArabic-SemiBold',
        fontSize: 18.sp,
        fontWeight: FontWeight.w900),
    bodyMedium: TextStyle(
      fontFamily: 'Poppins-ExtraLight',
      fontSize: 14.sp,
    ),
    titleMedium: TextStyle(
      fontFamily: 'NotoSansArabic-Regular',
      fontSize: 18.sp,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w900,
      fontFamily: 'Amaranth-Bold',
      fontSize: 13.sp,
    ),
  ),
  scaffoldBackgroundColor: backgroundColor,
  appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: scaffoldBackgroundColor,
          statusBarIconBrightness: Brightness.dark),
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: iconColor, size: 30)),
);
