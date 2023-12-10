import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/modules/profile/profile_settings%20_card.dart';
import 'package:kotobekia/modules/profile/profile_tile.dart';
import 'package:kotobekia/modules/profile/user_info_card.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(top: 20.h, bottom: 16.h, left: 16.w, right: 16.w),
          child: Column(
            children: [
              Text(
                locale!.account,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(
                height: 35.h,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50.w,
                    backgroundColor: const Color(0xFFD9D9D9),
                    child: Icon(
                      SolarIconsOutline.user,
                      size: 50.w,
                    ),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 10,
                    child: Icon(
                      SolarIconsBold.verifiedCheck,
                      size: 28.w,
                      color: const Color(0xFF08B1E7),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'امجد حسام الدين',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                'Ahmed@gmail.com',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 12.sp),
              ),
              SizedBox(
                height: 16.h,
              ),
              const BuildUserInfoCard(),
              SizedBox(
                height: 8.h,
              ),
              const BuildProfileSettingsCard(),
              SizedBox(
                height: 12.h,
              ),
              Card(
                color: ColorConstant.whiteColor,
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorConstant.whiteColor,
                      borderRadius: BorderRadius.circular(14)),
                  child: BuildProfileTile(
                    icon: SolarIconsOutline.logout_2,
                    iconColor: ColorConstant.dangerColor,
                    text: locale.log_out,
                    switchIcon: false,
                    onClick: () {},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
