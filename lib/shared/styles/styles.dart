import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData lightTheme({required double width, required double height}) =>
    ThemeData(
      textTheme: TextTheme(
        displayLarge: TextStyle(
            fontFamily: 'NotoSansArabic-SemiBold',
            fontSize: width/28,
        color: primaryColor,
        fontWeight: FontWeight.w800),
        bodyLarge: TextStyle(
            fontFamily: 'NotoSansArabic-SemiBold',
            fontSize: width/20,
            fontWeight: FontWeight.w900),
        bodyMedium: TextStyle(
          fontFamily: 'Poppins-ExtraLight',
          fontSize: width/25,
        ),
        titleMedium: TextStyle(
          fontFamily: 'NotoSansArabic-Medium',
          fontSize: width/22.8,
          fontWeight: FontWeight.w500
        ),
        displayMedium:  TextStyle(
          fontFamily: 'NotoSansArabic-Regular',
          fontSize: width/22.8,
        ),
        titleLarge: TextStyle(
          fontFamily: 'Amaranth-Bold',
          fontSize: width/12.5,
          color: primaryColor,
          fontWeight: FontWeight.bold
        ),
      ),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme:  AppBarTheme(
          systemOverlayStyle:const SystemUiOverlayStyle(
              statusBarColor: scaffoldBackgroundColor,
              statusBarIconBrightness: Brightness.dark),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: iconColor, size: width / 18,)),
    );
