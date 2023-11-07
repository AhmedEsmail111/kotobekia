
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//Row Details in Post page

Widget buildRowDetialsPostPage(
    {required BuildContext context,
      required String firstText,
      required String lastText}) {
  return Row(
    children: [
      Text(
        firstText,
        style: Theme.of(context).textTheme.displayLarge,
      ),
      Spacer(),
      Text(
        lastText,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontSize: MediaQuery.sizeOf(context).width / 30),
      ),
    ],
  );
}