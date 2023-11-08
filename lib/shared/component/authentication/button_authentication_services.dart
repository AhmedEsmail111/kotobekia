import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../styles/colors.dart';

//Button for authentication services have icon and text

class BuildButtonAuthServices extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color buttonColor;
  final String iconImage;
  final double elevation;
  final BuildContext context;


  const BuildButtonAuthServices({super.key,
    required this.onTap,
    required this.text,
    required this.buttonColor,
    required this.iconImage,
    required this.elevation,
    required this.context});

  @override
  Widget build(BuildContext context) {
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
}


