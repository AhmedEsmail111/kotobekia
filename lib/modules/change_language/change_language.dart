import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/language/language_cubit.dart';
import 'package:kotobekia/controller/language/language_states.dart';
import 'package:kotobekia/modules/change_language/language_tile.dart';
import 'package:kotobekia/shared/component/authentication/default_button_in_app.dart';
import 'package:kotobekia/shared/component/divider_line.dart';
import 'package:kotobekia/shared/component/row_like_appbar.dart';
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:kotobekia/shared/network/local/local.dart';
import 'package:kotobekia/shared/styles/colors.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return BlocConsumer<LanguageCubit, LanguageStates>(
      listener: (ctx, state) {},
      builder: (ctx, state) {
        final languageCubit = LanguageCubit.get(context);

        return PopScope(
          onPopInvoked: (_) async {
            languageCubit.arabicStatus =
                CacheHelper.getData(key: AppConstant.languageKey) == 'ar'
                    ? true
                    : false;
            languageCubit.englishStatus = !languageCubit.arabicStatus;
          },
          child: Scaffold(
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  BuildRowLikeAppBar(
                    color: ColorConstant.foregroundColor,
                    text: locale!.language,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Material(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xFFEDEDED)),
                        borderRadius: BorderRadius.circular(14)),
                    color: ColorConstant.whiteColor,
                    child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Column(
                        children: [
                          BuildLanguageTile(
                            text: 'العربية',
                            isClicked: languageCubit.arabicStatus,
                            onClick: (status) {
                              languageCubit.changeLanguageStatus(
                                  !languageCubit.arabicStatus, 1);
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: const BuildDividerLine(thickness: 2),
                          ),
                          BuildLanguageTile(
                            text: 'English',
                            isClicked: languageCubit.englishStatus,
                            onClick: (status) {
                              languageCubit.changeLanguageStatus(
                                  !languageCubit.englishStatus, 0);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  BuildDefaultButton(
                    withBorder: false,
                    onTap: () {
                      languageCubit.setDefaultLanguage();
                      Navigator.pop(context);
                    },
                    text: locale.save_changes,
                    color: ColorConstant.primaryColor,
                    elevation: 3,
                    context: context,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                  ),
                ],
              ),
            )),
          ),
        );
      },
    );
  }
}
