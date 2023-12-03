import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../shared/component/authentication/default_button_in_app.dart';
import '../../shared/constants/app/app_constant.dart';
import '../../shared/constants/images/images_constant.dart';
import '../../shared/styles/colors.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class GetStartScreen extends StatelessWidget {
  const GetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    return Directionality(
      textDirection: AppConstant.directionalityApp,
      child: Scaffold(
          body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: h / 5.5, left: w / 16, right: w / 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset(
                  ImageConstant.getStartImage,
                  width: w / 1.21,
                  height: h / 2.7,
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
            child: BuildDefaultButton(
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'createAccount');
                },
                text: AppLocalizations.of(context)!.register,
                color: primaryColor,
                elevation: 0,
                context: context),
          ),
          SizedBox(
            height: h / 38,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, 'login');
            },
            child: Text(
              AppLocalizations.of(context)!.login,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: w / 22.5, decoration: TextDecoration.underline),
            ),
          )
        ],
      )),
    );
  }
}
