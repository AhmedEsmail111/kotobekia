import 'package:flutter/material.dart';

void snakBarMessage({required BuildContext context,
  required String message}) {
  final snackbar = SnackBar(
    backgroundColor: Colors.red,
    content: Text(message, style: Theme
        .of(context)
        .textTheme
        .titleSmall!
        .copyWith(color: Colors.white),),
    duration: const Duration(seconds: 2),
  );
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}