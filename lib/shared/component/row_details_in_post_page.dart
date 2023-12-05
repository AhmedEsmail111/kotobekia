import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Row Details in Post page

class BuildRowDetialsPostPage extends StatelessWidget {
  final BuildContext context;
  final String firstText;
  final String lastText;

  const BuildRowDetialsPostPage(
      {super.key,
      required this.context,
      required this.firstText,
      required this.lastText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          firstText,
          style: Theme.of(context).textTheme.displayLarge,
        ),
       const Spacer(),
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
}
