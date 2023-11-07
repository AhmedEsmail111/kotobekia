
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';


//Row is in Authentication Screen

Widget buildRowTextAndLink(
    {required String text,
      required String textLink,
      required BuildContext context,
      required VoidCallback onTap
    }) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontSize:
        MediaQuery.sizeOf(context).width / 30,fontWeight: FontWeight.w500,),
      ),
      SizedBox(
        width: MediaQuery.sizeOf(context).width / 100,
      ),
      GestureDetector(
        onTap: onTap,
        child: Text(
          textLink,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: MediaQuery.sizeOf(context).width / 30,
            color: primaryColor,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
        ),
      )
    ],
  );
}