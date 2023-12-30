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
import 'package:kotobekia/shared/constants/api/api_constant.dart';
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:kotobekia/shared/constants/images/images_constant.dart';
import 'package:kotobekia/shared/network/local/local.dart';
import 'package:kotobekia/shared/styles/colors.dart';

final formKey = GlobalKey<FormState>();

class ModifyProfileScreen extends StatelessWidget {
  const ModifyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // print(CacheHelper.getData(key: AppConstant.userGender));
    print(
        '${ApiConstant.updateUserMethodUrl}${CacheHelper.getData(key: AppConstant.userId)}');
    final locale = AppLocalizations.of(context);
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    String enteredName = '';
    String enteredEmail = '';
    String day = '';
    String month = '';
    String year = '';

    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final profileCubit = ProfileCubit.get(context);
        return PopScope(
          onPopInvoked: (_) {
            profileCubit.genderValue =
                CacheHelper.getData(key: AppConstant.userGender) == 'male'
                    ? gender.Male
                    : gender.Female;
          },
          child: Scaffold(
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
                        backgroundImage: profileCubit.identityUserModel !=
                                    null &&
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
                        key: formKey,
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
                              onValidate: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'please enter your name';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                enteredName = value!;
                              },
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
                              onValidate: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'please enter your email';
                                } else if (!RegExp(
                                        r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
                                    .hasMatch(value)) {
                                  return 'The email is not valid';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                enteredEmail = value!;
                              },
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: BuildDefaultTextField(
                            //         initialFieldValue: profileCubit
                            //                     .userDataModel !=
                            //                 null
                            //             ? '${profileCubit.userDataModel!.user.birthDate.day}/${profileCubit.userDataModel!.user.birthDate.month}/${profileCubit.userDataModel!.user.birthDate.year}'
                            //             : '1/1/1111',
                            //         inputType: TextInputType.text,
                            //         backGroundColor: ColorConstant.whiteColor,
                            //         context: context,
                            //         width: double.infinity,
                            //         height: 50.h,
                            //         maxLenght: 50,
                            //         isObscured: false,
                            //         hintText: '',
                            //         withText: false,
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       width: 16.w,
                            //     ),
                            //     // Expanded(
                            //     //   child: BuildDefaultTextField(
                            //     //     initialFieldValue:
                            //     //         profileCubit.identityUserModel != null
                            //     //             ? profileCubit
                            //     //                 .identityUserModel!.gender
                            //     //             : 'anonymous',
                            //     //     inputType: TextInputType.text,
                            //     //     backGroundColor: ColorConstant.whiteColor,
                            //     //     context: context,
                            //     //     width: double.infinity,
                            //     //     height: 50.h,
                            //     //     maxLenght: 50,
                            //     //     isObscured: false,
                            //     //     hintText: '',
                            //     //     withText: false,
                            //     //   ),
                            //     // ),
                            //   ],
                            // )

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BuildDefaultTextField(
                                  withEyeVisible: false,
                                  initialFieldValue:
                                      profileCubit.userDataModel != null
                                          ? profileCubit
                                              .userDataModel!.user.birthDate.day
                                              .toString()
                                          : '',
                                  backGroundColor: Colors.white,
                                  maxLenght: 2,
                                  inputType: TextInputType.number,
                                  withText: false,
                                  onValidate: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'فارغ';
                                    }
                                    return null;
                                  },
                                  hintText: locale.one_day,
                                  aboveFieldText: '',
                                  context: context,
                                  width: w / 5.5,
                                  height: h / 17.5,
                                  isObscured: false,
                                  onSaved: (value) {
                                    day = value!;
                                  },
                                ),
                                BuildDefaultTextField(
                                  initialFieldValue:
                                      profileCubit.userDataModel != null
                                          ? profileCubit.userDataModel!.user
                                              .birthDate.month
                                              .toString()
                                          : '',
                                  withEyeVisible: false,
                                  backGroundColor: Colors.white,
                                  maxLenght: 2,
                                  inputType: TextInputType.number,
                                  withText: false,
                                  hintText: locale.one_month,
                                  onValidate: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'فارغ';
                                    }
                                    return null;
                                  },
                                  aboveFieldText: '',
                                  context: context,
                                  width: w / 5,
                                  height: h / 17.5,
                                  isObscured: false,
                                  onSaved: (value) {
                                    month = value!;
                                  },
                                ),
                                BuildDefaultTextField(
                                  initialFieldValue:
                                      profileCubit.userDataModel != null
                                          ? profileCubit.userDataModel!.user
                                              .birthDate.year
                                              .toString()
                                          : '',
                                  withEyeVisible: false,
                                  backGroundColor: Colors.white,
                                  inputType: TextInputType.number,
                                  withText: false,
                                  maxLenght: 4,
                                  hintText: locale.one_year,
                                  onValidate: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'فارغ';
                                    }
                                    return null;
                                  },
                                  aboveFieldText: '',
                                  context: context,
                                  width: w / 2.6,
                                  height: h / 17.5,
                                  isObscured: false,
                                  onSaved: (value) {
                                    year = value!;
                                  },
                                ),
                              ],
                            ),
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
                      state is UpdateUserLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: ColorConstant.primaryColor,
                              ),
                            )
                          : BuildDefaultButton(
                              withBorder: false,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  final birthDate = '$day-$month-$year';
                                  print(birthDate);
                                  print(profileCubit.genderValue);
                                  profileCubit.updateUser(
                                    name: enteredName,
                                    email: enteredEmail,
                                    birthDate: birthDate,
                                    gender:
                                        profileCubit.genderValue == gender.Male
                                            ? "male"
                                            : "female",
                                  );
                                }
                              },
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
          ),
        );
      },
    );
  }
}
