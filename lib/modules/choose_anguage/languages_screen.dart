import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kotobekia/modules/get_start/get_start_screen.dart';
import '../../shared/component/authentication/default_button_in_app.dart';
import '../../shared/component/language_column_in_boarding_screen.dart';
import '../../shared/constants/images/images_constant.dart';
import '../../shared/navigation/push_and_pop_all_previous.dart';
import '../../shared/styles/colors.dart';


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
            Image.asset(logoImage),
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
                BuildLanguageColumn(
                    containerText: 'Aa',
                    languageText: 'English',
                    context: context),
                SizedBox(
                  width: w / 6.5,
                ),
                BuildLanguageColumn(
                    containerText: 'ض',
                    languageText: 'العربية',
                    context: context)
              ],
            ),
            SizedBox(
              height: 92,
            ),
            BuildDefaultButton(
                onTap: (){
                  pushAndPopAllScreens(context: context,
                      screen: const GetStartScreen());
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
