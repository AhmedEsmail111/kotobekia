import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types, constant_identifier_names
enum gender { Female, Male }

// Row for choose gender

class BuildGenderRow extends StatelessWidget {
  final BuildContext context;
  final String text;
  final gender character;

  const BuildGenderRow(
      {super.key,
      required this.context,
      required this.text,
      required this.character});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<gender>(
          value: gender.Male,
          groupValue: character,
          onChanged: (gender? value) {},
        ),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
