import 'package:flutter/material.dart';
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:kotobekia/shared/network/local/local.dart';
import 'package:solar_icons/solar_icons.dart';

class BuildBackButton extends StatelessWidget {
  const BuildBackButton({super.key});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        CacheHelper.getData(key: AppConstant.languageKey) == 'ar'
            ? SolarIconsOutline.altArrowRight
            : SolarIconsOutline.altArrowLeft,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
