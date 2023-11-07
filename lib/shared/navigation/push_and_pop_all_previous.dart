import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// push then pop all previous screens

void pushAndPopAllScreens({required BuildContext context, required Widget screen}) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return screen;
        },
      ));
}
