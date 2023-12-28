// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kotobekia/controller/profile/profile_cubit.dart';
import 'package:kotobekia/controller/profile/profile_states.dart';
import 'package:kotobekia/modules/profile/profile_tile.dart';
import 'package:kotobekia/shared/component/divider_line.dart';
import 'package:kotobekia/shared/component/toast_message.dart';
import 'package:kotobekia/shared/helper/functions.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

class BuildProfileSettingsCard extends StatelessWidget {
  const BuildProfileSettingsCard({super.key});
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final profileCubit = ProfileCubit.get(context);
          return Card(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: ColorConstant.whiteColor,
              ),
              child: Column(
                children: [
                  BuildProfileTile(
                    icon: SolarIconsOutline.user,
                    text: locale!.modify_profile,
                    withSwitchIcon: false,
                    iconColor: const Color(0xFF747474),
                    onClick: () {
                      if (HelperFunctions.hasUserRegistered()) {
                        Navigator.pushNamed(context, 'modifyProfile');
                      } else {
                        buildToastMessage(
                            message: locale.go_register_message,
                            gravity: ToastGravity.CENTER);
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: const BuildDividerLine(
                      thickness: 2,
                    ),
                  ),
                  BuildProfileTile(
                    icon: SolarIconsOutline.heart,
                    iconColor: const Color(0xFF747474),
                    text: locale.favorite_adds,
                    withSwitchIcon: false,
                    onClick: () {
                      if (HelperFunctions.hasUserRegistered()) {
                        Navigator.pushNamed(context, 'favoriteAdds');
                      } else {
                        buildToastMessage(
                            message: locale.go_register_message,
                            gravity: ToastGravity.CENTER);
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: const BuildDividerLine(
                      thickness: 2,
                    ),
                  ),
                  BuildProfileTile(
                    icon: SolarIconsOutline.textSquare,
                    iconColor: const Color(0xFF747474),
                    text: locale.language,
                    withSwitchIcon: false,
                    onClick: () {
                      Navigator.pushNamed(context, 'changeLanguage');
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: const BuildDividerLine(
                      thickness: 2,
                    ),
                  ),
                  BuildProfileTile(
                    icon: SolarIconsOutline.sun,
                    iconColor: const Color(0xFF747474),
                    text: locale.dark_mode,
                    withSwitchIcon: true,
                    switchStatus: profileCubit.isDarkMode,
                    onClick: profileCubit.toggleDarkMode,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: const BuildDividerLine(
                      thickness: 2,
                    ),
                  ),
                  BuildProfileTile(
                    icon: SolarIconsOutline.infoSquare,
                    iconColor: ColorConstant.primaryColor,
                    text: locale.help,
                    withSwitchIcon: false,
                    onClick: () {},
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: const BuildDividerLine(
                      thickness: 2,
                    ),
                  ),
                  BuildProfileTile(
                    icon: SolarIconsOutline.shieldWarning,
                    iconColor: ColorConstant.primaryColor,
                    text: locale.report_problem,
                    withSwitchIcon: false,
                    onClick: () {},
                  )
                ],
              ),
            ),
          );
        });
  }
}
