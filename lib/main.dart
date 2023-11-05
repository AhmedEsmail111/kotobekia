import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:kotobekia/shared/styles/styles.dart';
import 'package:page_transition/page_transition.dart';

import 'modules/languages_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: lightTheme(width: width, height: height),
        home:  Directionality(
            textDirection: TextDirection.rtl,
            child: AnimatedSplashScreen(
              nextScreen:const Directionality(
                  textDirection:TextDirection.rtl,
                  child: LanguageScreen()),
              duration: 3500,
              splashIconSize: width/0.7,
              pageTransitionType: PageTransitionType.fade,
              backgroundColor: backgroundColor,
              splash: 'assets/images/splash_animation.gif',
              splashTransition: SplashTransition.fadeTransition,

            ),));
  }
}
