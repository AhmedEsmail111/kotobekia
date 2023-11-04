import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kotobekia/shared/styles/colors.dart';

class LanguageColum extends StatelessWidget {
  const LanguageColum({
    super.key,
    required this.containerText,
    required this.languageText,
  });

  final String containerText;
  final String languageText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.height / 10,
            child: Text(
              containerText,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: primaryColor,
                    fontSize: MediaQuery.of(context).size.width / 15,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Text(
          languageText,
          style: Theme.of(context).textTheme.displayLarge,
        )
      ],
    );
  }
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.color,
    required this.elevation,
  });

  final void Function() onTap;
  final String text;
  final Color color;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 14,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 18,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: color,
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: foregroundColor,
                fontWeight: FontWeight.w400,
                fontSize: MediaQuery.of(context).size.width / 19,
              ),
        ),
      ),
    );
  }
}

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon,
    required this.iconColor,
    required this.elevation,
  });

  final void Function() onTap;
  final String text;
  final Color iconColor;
  final IconData icon;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 14,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 18,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: mutedColor,
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: blackColor,
                    fontWeight: FontWeight.w400,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 35,
            ),
            Icon(
              icon,
              size: MediaQuery.of(context).size.width / 11,
              color: iconColor,
            )
          ],
        ),
      ),
    );
  }
}

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    super.key,
    required this.inputType,
    required this.onSaved,
    required this.hintText,
    this.isObscured = false,
    required this.aboveFieldText,
    required this.onValidate,
  });

  final TextInputType inputType;
  final void Function(String? value) onSaved;
  final String hintText;
  final bool isObscured;
  final String aboveFieldText;
  final String? Function(String? value) onValidate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 18,
          ),
          child: Text(
            aboveFieldText,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width / 160,
        ),
        Card(
          elevation: 2,
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 18,
          ),
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
                        child: const FaIcon(
                          FontAwesomeIcons.eyeLowVision,
                        ),
                      )
                    : null,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 25,
                  vertical: MediaQuery.of(context).size.width / 25,
                ),
              ),
              onSaved: (newValue) {
                // you have to check if the newValue is not null before doing any work with it
                onSaved(newValue!);
              },
              // you have to check if the newValue is not null before doing any work with it
              validator: onValidate),
        ),
      ],
    );
  }
}
