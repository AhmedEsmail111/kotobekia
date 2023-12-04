import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

class BuildInteractionCard extends StatelessWidget {
  const BuildInteractionCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: ColorConstant.foregroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'Ad id #1256',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: const Color(0xFF939393),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                onPressed: () {},
                label: Text(
                  'حفظ',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                icon: Icon(
                  SolarIconsOutline.heart,
                  size: 20.h,
                  color:ColorConstant.iconColor,
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                label: Text(
                  'تبليغ',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                icon: Icon(
                  SolarIconsBold.shieldUser,
                  size: 20.h,
                  color: ColorConstant.iconColor,
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                label: Text(
                  'مشاركة',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                icon: Icon(
                  SolarIconsBold.forward,
                  size: 20.h,
                  color: ColorConstant.iconColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
