
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../styles/colors.dart';





//Default Row in Authentication Screens

Widget buildTowLineRowInAuth({required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: MediaQuery.sizeOf(context).height / 390,
        width: MediaQuery.sizeOf(context).width / 2.85,
        color: strieghtLineColor.withOpacity(0.5),
      ),
      SizedBox(
        width: MediaQuery.sizeOf(context).width / 13.5,
      ),
      Text(
        'أو',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: MediaQuery.sizeOf(context).width / 20.5,
            color: strieghtLineColor),
      ),
      SizedBox(
        width: MediaQuery.sizeOf(context).width / 13.5,
      ),
      Container(
        height: MediaQuery.sizeOf(context).height / 390,
        width: MediaQuery.sizeOf(context).width / 2.85,
        color: strieghtLineColor.withOpacity(0.5),
      ),
    ],
  );
}