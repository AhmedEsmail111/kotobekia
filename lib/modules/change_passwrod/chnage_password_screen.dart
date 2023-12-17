import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/authentication/authentication_cubit.dart';
import 'package:kotobekia/shared/component/authentication/default_button_in_app.dart';
import 'package:kotobekia/shared/component/authentication/default_text_form_in_app.dart';
import 'package:kotobekia/shared/component/back_icon.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kotobekia/shared/styles/colors.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme font = Theme.of(context).textTheme;

    final locale = AppLocalizations.of(context);
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    var formKey = GlobalKey<FormState>();
    var currentPasswordController = TextEditingController();
    var newPasswordController = TextEditingController();
    var confirmNewPasswordController = TextEditingController();
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<AuthenticationCubit>();
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding:
                    EdgeInsets.only(top: 23.h, left: w / 25, right: w / 25),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'تغيير كلمة المرور',
                            style: font.titleMedium!.copyWith(fontSize: 18.sp),
                          ),
                          SizedBox(
                            width: 63.w,
                          ),
                          BuildBackIcon(cntx: context,),
                        ],
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      BuildDefaultTextField(
                          backGroundColor: Colors.white,
                          maxLenght: 128,
                          controller: currentPasswordController,
                          width: double.infinity,
                          height: h / 16.8,
                          withText: false,
                          cubit: cubit,
                          inputType: TextInputType.text,
                          withEyeVisible: false,
                          hintText: 'كلمة المرور الحالية',
                          onValidate: (value) {
                            if (value!.isEmpty) {
                              return "الرجاء إدخال كلمة المرور.";
                            } else if (value.length < 6) {
                              return "يجب أن تكون كلمة المرور على الأقل 6 أحرف.";
                            }
                            return null;
                          },
                          isObscured: true,
                          context: context),
                      SizedBox(
                        height: 20.h,
                      ),
                      InkWell(
                        onTap: () {
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              locale!.forgot_password,
                              style: font.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      BuildDefaultTextField(
                          backGroundColor: Colors.white,
                          maxLenght: 128,
                          controller: newPasswordController,
                          width: double.infinity,
                          height: h / 16.8,
                          withText: false,
                          cubit: cubit,
                          inputType: TextInputType.text,
                          withEyeVisible: false,
                          hintText: 'كلمة المرور الجديدة',
                          onValidate: (value) {
                            if (value!.isEmpty) {
                              return "الرجاء إدخال كلمة المرور.";
                            } else if (value.length < 6) {
                              return "يجب أن تكون كلمة المرور على الأقل 6 أحرف.";
                            }
                            return null;
                          },
                          isObscured: true,
                          context: context),
                      SizedBox(
                        height: 20.h,
                      ),
                      BuildDefaultTextField(
                          withEyeVisible: false,
                          cubit: cubit,
                          backGroundColor: Colors.white,
                          maxLenght: 128,
                          width: double.infinity,
                          height: h / 16.8,
                          withText: false,
                          onValidate: (value) {
                            if (value!.isEmpty) {
                              return "الرجاء إدخال تأكيد كلمة المرور.";
                            } else if (value.length < 6) {
                              return "يجب أن تكون كلمة المرور على الأقل 6 أحرف.";
                            } else if (newPasswordController.text !=
                                confirmNewPasswordController.text) {
                              return "كلمة المرور وتأكيد كلمة المرور غير متطابقين.";
                            }
                            return null;
                          },
                          controller: confirmNewPasswordController,
                          inputType: TextInputType.text,
                          hintText: 'أعد كتابة كلمة المرور الجديدة',
                          isObscured: true,
                          context: context),
                      SizedBox(
                        height: 90.h,
                      ),
                      BuildDefaultButton(
                          onTap: () {
                            if (formKey.currentState!.validate()) {}
                          },
                          text: 'حفظ التغييرات',
                          color: ColorConstant.primaryColor,
                          elevation: 4,
                          context: context),
                      SizedBox(
                        height: 18.h,
                      ),
                      Text(
                          'أحتفظ بكلمة المرور في مكان آمن حتي تستطيع الرجوع لحسابك دائما',
                      style: font.displayMedium!.copyWith(fontSize: 12.sp),
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
