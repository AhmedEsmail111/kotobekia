import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/shared/component/authentication/default_text_form_in_app.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 24.h, bottom: 16.h, right: 16.w, left: 16.w),
              child: BuildDefaultTextField(
                prefixIcons: const Icon(SolarIconsOutline.library),
                inputType: TextInputType.text,
                withText: false,
                hintText: locale.search_by_title,
                backGroundColor: ColorConstant.whiteColor,
                context: context,
                width: double.infinity,
                height: 60.h,
                maxLenght: 100,
                isObscured: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
