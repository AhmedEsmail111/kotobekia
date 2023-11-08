import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';

//Row is in Authentication Screen

class BuildRowTextAndLink extends StatelessWidget {
  final String text;
  final String textLink;
  final BuildContext context;
  final VoidCallback onTap;

  const BuildRowTextAndLink(
      {super.key,
      required this.text,
      required this.textLink,
      required this.context,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: MediaQuery.sizeOf(context).width / 30,
                fontWeight: FontWeight.w500,
              ),
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
}

