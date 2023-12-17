// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/modules/profile/profile_tile.dart';
import 'package:kotobekia/shared/component/divider_line.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

class BuildProfileSettingsCard extends StatelessWidget {
  const BuildProfileSettingsCard({super.key});
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
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
              switchIcon: false,
              iconColor: const Color(0xFF747474),
              onClick: () {
                Navigator.pushNamed(context, 'modifyProfile');
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
              switchIcon: false,
              onClick: () {
                Navigator.pushNamed(context, 'favoriteAdds');
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
              switchIcon: false,
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
              switchIcon: true,
              onClick: () {},
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
              switchIcon: false,
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
              switchIcon: false,
              onClick: () {},
            )
          ],
        ),
      ),
    );
  }
}
