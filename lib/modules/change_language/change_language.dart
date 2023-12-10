import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/profile/profile_cubit.dart';
import 'package:kotobekia/controller/profile/profile_states.dart';
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
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (ctx, state) {},
      builder: (ctx, state) {
        final profileCubit = ProfileCubit.get(context);

        return PopScope(
          onPopInvoked: (_) {
            profileCubit.arabicStatus =
                CacheHelper.getData(key: AppConstant.languageKey) == 'ar'
                    ? true
                    : false;
            profileCubit.englishStatus = !profileCubit.arabicStatus;
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
                            isClicked: profileCubit.arabicStatus,
                            onClick: (status) {
                              profileCubit.changeLanguageStatus(
                                  !profileCubit.arabicStatus, 1);
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: const BuildDividerLine(thickness: 2),
                          ),
                          BuildLanguageTile(
                            text: 'English',
                            isClicked: profileCubit.englishStatus,
                            onClick: (status) {
                              profileCubit.changeLanguageStatus(
                                  !profileCubit.englishStatus, 0);
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
                      profileCubit.setDefaultLanguage();
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
