import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:kotobekia/shared/network/local/local.dart';
import 'package:solar_icons/solar_icons.dart';

class BuildBackButton extends StatelessWidget {
  final bool hasBackground;
  final Color? darkBackground;
  const BuildBackButton({
    super.key,
    required this.hasBackground,
    this.darkBackground,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: hasBackground ? EdgeInsets.symmetric(vertical: 16.h) : null,
      decoration: BoxDecoration(
        borderRadius: hasBackground ? BorderRadius.circular(14) : null,
        color: darkBackground,
      ),
      child: IconButton(
        icon: Icon(
          CacheHelper.getData(key: AppConstant.languageKey) == 'ar'
              ? SolarIconsOutline.altArrowRight
              : SolarIconsOutline.altArrowLeft,
          size: 30.w,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
