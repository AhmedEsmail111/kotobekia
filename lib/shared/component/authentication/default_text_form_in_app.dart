import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../styles/colors.dart';

// Default TextFormField in my app

class BuildDefaultTextField extends StatelessWidget {
  final TextInputType inputType;
  final void Function(String? value)? onSaved;
  final String? Function(String? value)? onValidate;
  final String hintText;
  final bool isObscured;
  final String aboveFieldText;
  final BuildContext context;

  const BuildDefaultTextField(
      {super.key,
      required this.inputType,
      required this.hintText,
      required this.aboveFieldText,
      required this.context,
      this.onSaved,
      this.onValidate, required this.isObscured});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          aboveFieldText,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: MediaQuery.of(context).size.width / 25.5,
              ),
          textAlign: TextAlign.left,
        ),
        Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: TextFormField(
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: blackColor,
                    fontWeight: FontWeight.w300,
                  ),
              obscureText: isObscured,
              keyboardType: inputType,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle().copyWith(color: Colors.black26),
                border: InputBorder.none,
                suffixIcon: isObscured
                    ? Container(
                        width: MediaQuery.of(context).size.width / 20,
                        padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 40,
                        ),
                        alignment: Alignment.centerRight,
                        child: const Icon(SolarIconsOutline.eyeClosed))
                    : null,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 25,
                  vertical: MediaQuery.of(context).size.width / 50,
                ),
              ),
              onSaved: (newValue) {
// you have to check if the newValue is not null before doing any work with it
                onSaved!(newValue!);
              },
// you have to check if the newValue is not null before doing any work with it
              validator: onValidate),
        ),
      ],
    );
  }
}
