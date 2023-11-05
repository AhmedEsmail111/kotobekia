import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kotobekia/shared/components/components.dart';
import 'package:kotobekia/shared/styles/colors.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: h / 7.2, left: 16, right: 16),
        child: Column(
          children: [
            Image.asset('assets/images/logo.png'),
            SizedBox(
              height: w / 7,
            ),
            Text(
              'إختر لغتك المفضلة',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: h / 31,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildLanguageColumn(
                    containerText: 'Aa',
                    languageText: 'English',
                    context: context),
                SizedBox(
                  width: w / 6.5,
                ),
                buildLanguageColumn(
                    containerText: 'ض',
                    languageText: 'العربية',
                    context: context)
              ],
            ),
            SizedBox(
              height: 92,
            ),
            buildDefaultButton(
                onTap: (){

                },
                text: 'متابعة',
                color: primaryColor,
                elevation: 4,
                context: context)
          ],
        ),
      ),
    );
  }
}
