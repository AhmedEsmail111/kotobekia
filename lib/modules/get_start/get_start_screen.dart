import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kotobekia/modules/login/Login_screen.dart';
import 'package:kotobekia/modules/create_account/create_account_screen.dart';

import '../../shared/component/authentication/default_button_in_app.dart';
import '../../shared/constants/app/app_constant.dart';
import '../../shared/constants/images/images_constant.dart';
import '../../shared/navigation/push_and_pop_all_previous.dart';
import '../../shared/styles/colors.dart';


class GetStartScreen extends StatelessWidget {
  const GetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    return Directionality(
      textDirection: directionalityApp,
      child: Scaffold(
          body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: h / 5.5, left: w / 16, right: w / 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset(
                  getStartImage,
                  width: w/1.21,
                  height: h/2.7,
                ),
                SizedBox(
                  height: h / 17.5,
                ),
                Padding(
                  padding: EdgeInsets.only(right: w / 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'أهلا بيك في ',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: w / 20.5),
                          ),
                          Text(
                            'كُتبيكيا',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: w / 20.5, color: startingColor),
                          ),
                        ],
                      ),
                      Text(
                        'حيث لا حدود للخير تقدر تبدأ من هنا.',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: h / 17.5, left: w / 22.5, right: w / 22.5),
            child: buildDefaultButton(
                onTap: () {
                  pushAndPopAllScreens(context: context,
                      screen: const CreateAccountScreen());
                },
                text: 'تسجيل حساب جديد',
                color: primaryColor,
                elevation: 0,
                context: context),
          ),
          SizedBox(height: h/38,),
          InkWell(
            onTap: () {
              pushAndPopAllScreens(context: context,
                  screen: const LoginScreen());
            },
            child: Text(
              'تسجيل الدخول',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: w/22.5, decoration: TextDecoration.underline),
            ),
          )
        ],
      )),
    );
  }
}
