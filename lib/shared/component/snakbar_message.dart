import 'package:flutter/material.dart';

enum SnackbarState { success, error, inValid }

void snackBarMessage(
    {required BuildContext context,
    required String message,
    required SnackbarState snackbarState}) {
  final snackbar = SnackBar(
    backgroundColor: snackbarState == SnackbarState.error
        ? Colors.red
        : snackbarState == SnackbarState.success
            ? Colors.green
            : Colors.blue,
    content: Text(
      message,
      style:
          Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),
      textAlign: TextAlign.center,
    ),
    duration: const Duration(seconds: 2),
  );
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
