import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/shared/component/vertical_divider.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

class BuildUserInfoCard extends StatelessWidget {
  const BuildUserInfoCard({super.key});
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    print(MediaQuery.of(context).size.width / 18);
    return Card(
      color: ColorConstant.whiteColor,
      child: Container(
        height: 68.h,
        width: double.infinity,
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: ColorConstant.whiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  locale!.number_of_chats,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14.sp,
                      ),
                ),
                Text(
                  '13 ${locale.interaction}',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF747474),
                      ),
                ),
              ],
            ),
            BuildVerticalDivider(
              height: 45.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  locale.number_of_posts,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14.sp,
                      ),
                ),
                Text(
                  '7 ${locale.adds}',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF747474),
                      ),
                ),
              ],
            ),
            BuildVerticalDivider(
              height: 45.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  locale.personal_badges,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14.sp,
                      ),
                ),
                Wrap(
                  children: [
                    Icon(
                      SolarIconsOutline.medalRibbonStar,
                      size: 18.w,
                    ),
                    Icon(
                      SolarIconsOutline.medalRibbonStar,
                      size: 18.w,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
