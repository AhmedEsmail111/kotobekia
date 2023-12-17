import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/shared/component/authentication/default_button_in_app.dart';
import 'package:kotobekia/shared/component/authentication/default_text_form_in_app.dart';
import 'package:kotobekia/shared/component/back_icon.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kotobekia/shared/styles/colors.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme font = Theme.of(context).textTheme;
    var emailController = TextEditingController();
    final locale = AppLocalizations.of(context);
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(top:23.h, left: w / 25, right: w / 25),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BuildBackIcon(cntx: context),
                    ],
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Text(
                    'قم بإدخال البريد الالكتروني',
                    style: font.titleMedium!.copyWith(fontSize: 18.sp),
                  ),
                  Text(
                    'تأكد من ادخال بريد الكتروني صحيح مرتبط بحسابك \nلتتلقي عليه رسالة التأكيد',
                    style: font.displayMedium!.copyWith(fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 69.h,
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
                      aboveFieldText: locale!.email,
                      context: context),
                  SizedBox(height: 50.h,),
                  BuildDefaultButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {

                        }
                      },
                      text: 'استمرار',
                      color: ColorConstant.primaryColor,
                      elevation: 4,
                      context: context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
