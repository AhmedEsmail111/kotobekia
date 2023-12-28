import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/profile/profile_cubit.dart';
import 'package:kotobekia/controller/profile/profile_states.dart';
import 'package:kotobekia/shared/component/authentication/default_button_in_app.dart';
import 'package:kotobekia/shared/component/authentication/default_text_form_in_app.dart';
import 'package:kotobekia/shared/component/authentication/gender_row_in_auth.dart';
import 'package:kotobekia/shared/component/row_like_appbar.dart';
import 'package:kotobekia/shared/constants/images/images_constant.dart';
import 'package:kotobekia/shared/styles/colors.dart';

class ModifyProfileScreen extends StatelessWidget {
  const ModifyProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final profileCubit = ProfileCubit.get(context);
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
                      radius: 40.w,
                      backgroundImage: profileCubit.identityUserModel != null &&
                              profileCubit.identityUserModel!.gender == 'male'
                          ? const AssetImage(
                              ImageConstant.userMaleImage,
                            )
                          : const AssetImage(
                              ImageConstant.userFemaleImage,
                            ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Form(
                      child: Column(
                        children: [
                          BuildDefaultTextField(
                            initialFieldValue:
                                profileCubit.identityUserModel != null
                                    ? profileCubit.identityUserModel!.fullName
                                    : 'anonymous',
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
                            initialFieldValue:
                                profileCubit.userDataModel != null
                                    ? profileCubit.userDataModel!.user.email
                                    : 'anonymous@gmail.com',
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
                                  initialFieldValue: profileCubit
                                              .userDataModel !=
                                          null
                                      ? '${profileCubit.userDataModel!.user.birthDate.day}/${profileCubit.userDataModel!.user.birthDate.month}/${profileCubit.userDataModel!.user.birthDate.year}'
                                      : '1/1/1111',
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
                              // Expanded(
                              //   child: BuildDefaultTextField(
                              //     initialFieldValue:
                              //         profileCubit.identityUserModel != null
                              //             ? profileCubit
                              //                 .identityUserModel!.gender
                              //             : 'anonymous',
                              //     inputType: TextInputType.text,
                              //     backGroundColor: ColorConstant.whiteColor,
                              //     context: context,
                              //     width: double.infinity,
                              //     height: 50.h,
                              //     maxLenght: 50,
                              //     isObscured: false,
                              //     hintText: '',
                              //     withText: false,
                              //   ),
                              // ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BuildGenderRow(
                            genderValue: profileCubit.genderValue,
                            onChange: (gender) {
                              profileCubit.changeGender(0);
                            },
                            context: context,
                            text: locale.male,
                            character: gender.Male),
                        SizedBox(
                          width: 8.w,
                        ),
                        BuildGenderRow(
                            genderValue: profileCubit.genderValue,
                            onChange: (gender) {
                              profileCubit.changeGender(1);
                            },
                            context: context,
                            text: locale.female,
                            character: gender.Female)
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    BuildDefaultButton(
                      withBorder: true,
                      onTap: () {
                        Navigator.pushNamed(context, 'changePassword');
                      },
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
      },
    );
  }
}
