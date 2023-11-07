
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../styles/colors.dart';

//Button for authentication services have icon and text

Widget buildButtonAuthServices(
    {required VoidCallback onTap,
      required String text,
      required Color buttonColor,
      required String iconImage,
      required double elevation,
      required BuildContext context}) {
  return Container(
    height: MediaQuery.of(context).size.height / 17.5,
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: buttonColor,
      ),
      onPressed: onTap,
      child: Row(
        children: [
          Image.asset(iconImage),
          SizedBox(
            width: MediaQuery.of(context).size.width / 22,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: blackColor,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
