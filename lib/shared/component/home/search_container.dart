import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar_icons/solar_icons.dart';

class BuildSearchContainer extends StatelessWidget {
  const BuildSearchContainer({super.key});
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'searchScreen');
      },
      child: Container(
        width: double.infinity,
        height: 38.h,
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.only(top: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.sp),
          border: Border.all(
            color: const Color(0xFFC8C5C5),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Icon(
                SolarIconsOutline.magnifier,
                size: 15.w,
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                locale!.search,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
