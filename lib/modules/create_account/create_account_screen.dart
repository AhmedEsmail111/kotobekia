import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kotobekia/shared/component/snakbar_message.dart';
import 'package:kotobekia/shared/constants/icons/icons_constant.dart';

import '../../controller/authentication/authentication_cubit.dart';
import '../../shared/component/authentication/button_authentication_services.dart';
import '../../shared/component/authentication/default_button_in_app.dart';
import '../../shared/component/authentication/default_text_form_in_app.dart';
import '../../shared/component/authentication/gender_row_in_auth.dart';
import '../../shared/component/authentication/row_text_and_link.dart';
import '../../shared/component/authentication/tow_line_and_text_in_auth.dart';
import '../../shared/styles/colors.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var dayController = TextEditingController();
    var monthController = TextEditingController();
    var yearController = TextEditingController();
    TextTheme font = Theme.of(context).textTheme;
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is SuccessUserCreateAccountState) {
          if (state.userModel.token == null) {
            snackBarMessage(
                snackbarState: SnackbarState.error,
                context: context,
                message: state.userModel.message.toString(),
                duration: const Duration(seconds: 2));
          } else {
            Navigator.pushNamed(context, 'otp',
                arguments: emailController.text);
          }
        } else if (state is FailedUserCreateAccountState) {
          snackBarMessage(
              snackbarState: SnackbarState.error,
              context: context,
              message: state.error,
              duration: const Duration(seconds: 2));
        }
      },
      builder: (context, state) {
        var cubit = context.read<AuthenticationCubit>();
        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Padding(
                padding:
                    EdgeInsets.only(top: h / 7.8, left: w / 25, right: w / 25),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Text(
                        locale!.create_acount,
                        style: font.bodyLarge,
                      ),
                      SizedBox(
                        height: h / 55,
                      ),
                      Text(
                        locale.create_acount_slogan,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: h / 26,
                      ),
                      BuildButtonAuthServices(
                          onTap: () {},
                          text: locale.create_with_facebook,
                          buttonColor: ColorConstant.midGrayColor,
                          iconImage: IconConstant.facebookIcon,
                          elevation: 0,
                          context: context),
                      SizedBox(
                        height: h / 55,
                      ),
                      BuildButtonAuthServices(
                          onTap: () {},
                          text: locale.create_with_google,
                          buttonColor: ColorConstant.midGrayColor,
                          iconImage: IconConstant.googleIcon,
                          elevation: 0,
                          context: context),
                      SizedBox(
                        height: h / 35,
                      ),
                      BuildTowLineRowInAuth(context: context),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BuildDefaultTextField(
                              backGroundColor: Colors.white,
                              maxLenght: 100,
                              controller: nameController,
                              width: double.infinity,
                              height: h / 16.8,
                              withText: true,
                              onValidate: (value) {
                                if (value!.isEmpty) {
                                  return 'الرجاء إدخال اسمك.';
                                }
                                return null;
                              },
                              isObscured: false,
                              inputType: TextInputType.name,
                              hintText: locale.full_name_hint,
                              aboveFieldText: locale.full_name,
                              context: context),
                          SizedBox(
                            height: h / 52,
                          ),
                          BuildDefaultTextField(
                              backGroundColor: Colors.white,
                              maxLenght: 320,
                              controller: emailController,
                              width: double.infinity,
                              height: h / 16.8,
                              withText: true,
                              isObscured: false,
                              onValidate: (value) {
                                if (value!.isEmpty) {
                                  return "الرجاء إدخال البريد الإلكتروني.";
                                } else if (!RegExp(
                                        r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
                                    .hasMatch(value)) {
                                  return "البريد الإلكتروني غير صالح. يرجى إدخال عنوان بريد إلكتروني صحيح.";
                                }
                                return null;
                              },
                              inputType: TextInputType.emailAddress,
                              hintText: 'Ahmed@gmail.com',
                              aboveFieldText: locale.email,
                              context: context),
                          SizedBox(
                            height: h / 52,
                          ),
                          BuildDefaultTextField(
                              cubit: cubit,
                              backGroundColor: Colors.white,
                              maxLenght: 128,
                              controller: passwordController,
                              width: double.infinity,
                              height: h / 16.8,
                              withText: true,
                              onValidate: (value) {
                                if (value!.isEmpty) {
                                  return "الرجاء إدخال كلمة المرور.";
                                } else if (value.length < 6) {
                                  return "يجب أن تكون كلمة المرور على الأقل 6 أحرف.";
                                }
                                return null;
                              },
                              inputType: TextInputType.text,
                              hintText: '*****************',
                              numberOfFormPass: 1,
                              isObscured: true,
                              aboveFieldText: locale.password,
                              context: context),
                          SizedBox(
                            height: h / 52,
                          ),
                          BuildDefaultTextField(
                              cubit: cubit,
                              backGroundColor: Colors.white,
                              maxLenght: 128,
                              width: double.infinity,
                              height: h / 16.8,
                              withText: true,
                              numberOfFormPass: 2,
                              onValidate: (value) {
                                if (value!.isEmpty) {
                                  return "الرجاء إدخال تأكيد كلمة المرور.";
                                } else if (value.length < 6) {
                                  return "يجب أن تكون كلمة المرور على الأقل 6 أحرف.";
                                } else if (passwordController.text !=
                                    confirmPasswordController.text) {
                                  return "كلمة المرور وتأكيد كلمة المرور غير متطابقين.";
                                }
                                return null;
                              },
                              controller: confirmPasswordController,
                              inputType: TextInputType.text,
                              hintText: '*****************',
                              isObscured: true,
                              aboveFieldText: locale.rewrite_password,
                              context: context),
                          SizedBox(
                            height: h / 52,
                          ),
                          Text(
                            locale.gender,
                            style: font.titleMedium!.copyWith(
                              fontSize:
                                  MediaQuery.of(context).size.width / 25.5,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              BuildGenderRow(
                                  genderValue: cubit.genderValue,
                                  onChange: (gender) {
                                    cubit.changeGender(0);
                                  },
                                  context: context,
                                  text: locale.male,
                                  character: gender.Male),
                              SizedBox(
                                width: w / 20,
                              ),
                              BuildGenderRow(
                                  genderValue: cubit.genderValue,
                                  onChange: (gender) {
                                    cubit.changeGender(1);
                                  },
                                  context: context,
                                  text: locale.female,
                                  character: gender.Female)
                            ],
                          ),
                          SizedBox(
                            height: h / 52,
                          ),
                          Text(
                            locale.birth_day,
                            style: font.titleMedium!.copyWith(
                              fontSize:
                                  MediaQuery.of(context).size.width / 25.5,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BuildDefaultTextField(
                                  backGroundColor: Colors.white,
                                  maxLenght: 2,
                                  inputType: TextInputType.number,
                                  withText: false,
                                  controller: dayController,
                                  onValidate: (value) {
                                    if (value!.isEmpty) {
                                      return 'فارغ';
                                    }
                                    return null;
                                  },
                                  hintText: locale.one_day,
                                  aboveFieldText: '',
                                  context: context,
                                  width: w / 5.5,
                                  height: h / 17.5,
                                  isObscured: false),
                              BuildDefaultTextField(
                                  backGroundColor: Colors.white,
                                  maxLenght: 2,
                                  inputType: TextInputType.number,
                                  withText: false,
                                  hintText: locale.one_month,
                                  controller: monthController,
                                  onValidate: (value) {
                                    if (value!.isEmpty) {
                                      return 'فارغ';
                                    }
                                    return null;
                                  },
                                  aboveFieldText: '',
                                  context: context,
                                  width: w / 5,
                                  height: h / 17.5,
                                  isObscured: false),
                              BuildDefaultTextField(
                                  backGroundColor: Colors.white,
                                  inputType: TextInputType.number,
                                  withText: false,
                                  maxLenght: 4,
                                  hintText: locale.one_year,
                                  controller: yearController,
                                  onValidate: (value) {
                                    if (value!.isEmpty) {
                                      return 'فارغ';
                                    }
                                    return null;
                                  },
                                  aboveFieldText: '',
                                  context: context,
                                  width: w / 2.6,
                                  height: h / 17.5,
                                  isObscured: false),
                            ],
                          ),
                          SizedBox(
                            height: h / 28,
                          ),
                          state is! LoadingUserCreateAccountState
                              ? BuildDefaultButton(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      String birthDate =
                                          '${yearController.text}-${monthController.text}-${dayController.text}';
                                      cubit.userCreateAccount(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          name: nameController.text,
                                          birthDate: birthDate,
                                          gender:
                                              cubit.genderValue == gender.Male
                                                  ? 'male'
                                                  : 'female');
                                    }
                                  },
                                  text: locale.create_acount,
                                  color: ColorConstant.primaryColor,
                                  elevation: 4,
                                  context: context,
                                  withBorder: false,
                                )
                              : const Center(
                                  child: CircularProgressIndicator(
                                      color: ColorConstant.primaryColor)),
                          SizedBox(
                            height: h / 30,
                          ),
                          BuildRowTextAndLink(
                              fontSize: w / 30,
                              onTap: () {
                                Navigator.pushNamed(context, 'login');
                              },
                              text: locale.have_account,
                              textLink: locale.login,
                              context: context),
                          SizedBox(
                            height: h / 15,
                          ),
                        ],
                      )
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
