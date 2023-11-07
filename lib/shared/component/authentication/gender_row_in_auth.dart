
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// ignore: camel_case_types, constant_identifier_names
enum gender { Female, Male }


// Row for choose gender

Widget buildGenderRow(
    {required BuildContext context,
      required String text,
      required gender character}) {
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