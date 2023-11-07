import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void pushToNextScreen({required BuildContext context, required Widget screen}) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return screen;
        },
      ));
}
