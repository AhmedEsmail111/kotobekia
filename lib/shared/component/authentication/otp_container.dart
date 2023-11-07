
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../styles/colors.dart';


//Container in OTP Screen

Widget buildOtpContainer({required BuildContext context}) {
  return Container(
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width / 5.2,
    decoration: BoxDecoration(
      color: midGrayColor,
      borderRadius:
      BorderRadius.circular(MediaQuery.of(context).size.height / 52),
    ),
    child: Expanded(
      child: TextField(
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          filled: true,
          fillColor: midGrayColor,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.height / 80)),
          counterText: '',
        ),
      ),
    ),
  );
}