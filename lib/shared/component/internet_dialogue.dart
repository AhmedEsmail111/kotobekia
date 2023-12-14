import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void buildInternetDialogue(
    {required BuildContext context, required String message}) {
  final dialogue = AlertDialog(
    title: Center(
      child: Text(
        message,
        style:
            Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15.sp),
        textAlign: TextAlign.center,
      ),
    ),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Ok'))
    ],
    actionsAlignment: MainAxisAlignment.center,
  );

  showDialog(
    context: context,
    builder: (context) {
      return dialogue;
    },
  );
}
