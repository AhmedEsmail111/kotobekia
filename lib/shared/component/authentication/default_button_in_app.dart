

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../styles/colors.dart';



// Default Button in my app


Widget buildDefaultButton(
    {required VoidCallback onTap,
      required String text,
      required Color color,
      required double elevation,
      required BuildContext context}) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 17,
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        backgroundColor: color,
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: foregroundColor,
          fontWeight: FontWeight.w500,
          fontSize: MediaQuery.of(context).size.width / 22.5,
        ),
      ),
    ),
  );
}