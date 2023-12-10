import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/shared/component/authentication/default_button_in_app.dart';
import 'package:kotobekia/shared/component/authentication/default_text_form_in_app.dart';
import 'package:kotobekia/shared/component/row_like_appbar.dart';
import 'package:kotobekia/shared/constants/images/images_constant.dart';
import 'package:kotobekia/shared/styles/colors.dart';

class ModifyProfileScreen extends StatelessWidget {
  const ModifyProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                BuildRowLikeAppBar(
                  color: ColorConstant.foregroundColor,
                  text: locale!.personal_profile,
                ),
                CircleAvatar(
                  radius: 50.w,
                  backgroundImage: const AssetImage(
                    ImageConstant.userDefaultImage,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Form(
                  child: Column(
                    children: [
                      BuildDefaultTextField(
                        inputType: TextInputType.text,
                        backGroundColor: ColorConstant.whiteColor,
                        context: context,
                        width: double.infinity,
                        height: 50.h,
                        maxLenght: 70,
                        isObscured: false,
                        hintText: '',
                        withText: false,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      BuildDefaultTextField(
                        inputType: TextInputType.text,
                        backGroundColor: ColorConstant.whiteColor,
                        context: context,
                        width: double.infinity,
                        height: 50.h,
                        maxLenght: 70,
                        isObscured: false,
                        hintText: '',
                        withText: false,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: BuildDefaultTextField(
                              inputType: TextInputType.text,
                              backGroundColor: ColorConstant.whiteColor,
                              context: context,
                              width: double.infinity,
                              height: 50.h,
                              maxLenght: 50,
                              isObscured: false,
                              hintText: '',
                              withText: false,
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Expanded(
                            child: BuildDefaultTextField(
                              inputType: TextInputType.text,
                              backGroundColor: ColorConstant.whiteColor,
                              context: context,
                              width: double.infinity,
                              height: 50.h,
                              maxLenght: 50,
                              isObscured: false,
                              hintText: '',
                              withText: false,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                BuildDefaultButton(
                  withBorder: true,
                  onTap: () {},
                  text: locale.modify_password,
                  color: ColorConstant.whiteColor,
                  elevation: 0,
                  context: context,
                ),
                SizedBox(
                  height: 16.h,
                ),
                BuildDefaultButton(
                  withBorder: false,
                  onTap: () {},
                  text: locale.save_changes,
                  color: ColorConstant.primaryColor,
                  elevation: 3,
                  context: context,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
