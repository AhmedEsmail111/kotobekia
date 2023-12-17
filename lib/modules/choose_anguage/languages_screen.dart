import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kotobekia/controller/authentication/authentication_cubit.dart';
import 'package:kotobekia/shared/constants/images/images_constant.dart';

import '../../shared/component/authentication/default_button_in_app.dart';
import '../../shared/component/language_column_in_boarding_screen.dart';
import '../../shared/styles/colors.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    TextTheme font = Theme.of(context).textTheme;
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<AuthenticationCubit>();
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(top: h / 7.2, left: w / 25, right: w / 25),
            child: Column(
              children: [
                Image.asset(ImageConstant.logoImage),
                SizedBox(
                  height: w / 7,
                ),
                Text(
                  locale!.choose_language,
                  style: font.bodyLarge,
                ),
                SizedBox(
                  height: h / 31,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BuildLanguageColumn(
                        onTap: () {
                          cubit.changeLanguage(false);
                        },
                        check: cubit.index == 0 ? true : false,
                        containerText: locale.language_code,
                        languageText: locale.language,
                        context: context),
                    SizedBox(
                      width: w / 6.5,
                    ),
                    BuildLanguageColumn(
                        onTap: () {
                          cubit.changeLanguage(true);
                        },
                        check: cubit.index == 1 ? true : false,
                        containerText: locale.language_code,
                        languageText: locale.language,
                        context: context)
                  ],
                ),
                SizedBox(
                  height: h / 9.2,
                ),
                BuildDefaultButton(
                    onTap: cubit.index != null
                        ? () {
                            Navigator.pushReplacementNamed(
                                context, 'homeLayout');
                          }
                        : null,
                    text: locale.go_on,
                    color: ColorConstant.primaryColor,
                    elevation: 4,
                    context: context)
              ],
            ),
          ),
        );
      },
    );
  }
}
