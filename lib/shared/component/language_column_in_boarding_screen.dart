import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Language Column in boarding screen for choose language


class BuildLanguageColumn extends StatelessWidget {

  final String containerText;
  final String languageText;
  final BuildContext context;

  const BuildLanguageColumn(
      {super.key, required this.containerText,
        required this.context,
        required this.languageText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery
                .of(context)
                .size
                .height / 10,
            width: MediaQuery
                .of(context)
                .size
                .height / 10,
            child: Text(
              containerText,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Text(
          languageText,
          style: Theme
              .of(context)
              .textTheme
              .titleMedium,
        )
      ],
    );
  }
}

