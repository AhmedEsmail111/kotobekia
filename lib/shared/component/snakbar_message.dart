import 'package:flutter/material.dart';
import 'package:kotobekia/shared/styles/colors.dart';

enum SnackbarState { success, error}

void snakBarMessage({required BuildContext context,
  required String message, required SnackbarState snackbarState }) {
  final snackbar = SnackBar(
    backgroundColor:snackbarState==SnackbarState.error? Colors.red:Colors.green,
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