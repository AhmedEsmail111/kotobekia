import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kotobekia/modules/login/Login_screen.dart';
import 'package:kotobekia/modules/otp/otp_screen.dart';
import '../../shared/component/authentication/button_authentication_services.dart';
import '../../shared/component/authentication/default_button_in_app.dart';
import '../../shared/component/authentication/default_text_form_in_app.dart';
import '../../shared/component/authentication/gender_row_in_auth.dart';
import '../../shared/component/authentication/row_text_and_link.dart';
import '../../shared/component/authentication/tow_line_and_text_in_auth.dart';
import '../../shared/constants/app/app_constant.dart';
import '../../shared/constants/icons/icons_constant.dart';
import '../../shared/navigation/push_navigation.dart';
import '../../shared/styles/colors.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var dayController = TextEditingController();
    var monthController = TextEditingController();
    var yearController = TextEditingController();

    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    return Directionality(
      textDirection: directionalityApp,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: h / 7.8, left: w / 25, right: w / 25),
              child: Column(
                children: [
                  Text(
                    'إنشاء حساب',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: h / 55,
                  ),
                  Text(
                    'أنشئ حساب وابحث عن الخير او اصنع خير جديد ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: h / 26,
                  ),
                  buildButtonAuthServices(
                      onTap: () {},
                      text: 'التسجيل باستخدام حساب فيسبوك',
                      buttonColor: midGrayColor,
                      iconImage: facebookIcon,
                      elevation: 0,
                      context: context),
                  SizedBox(
                    height: h / 55,
                  ),
                  buildButtonAuthServices(
                      onTap: () {},
                      text: 'التسجيل باستخدام حساب جوجل',
                      buttonColor: midGrayColor,
                      iconImage: googleIcon,
                      elevation: 0,
                      context: context),
                  SizedBox(
                    height: h / 35,
                  ),
                  buildTowLineRowInAuth(context: context),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildDefaultTextField(
                          inputType: TextInputType.name,
                          hintText: 'احمد محمد عبدالعال',
                          aboveFieldText: 'الاسم بالكامل',
                          context: context),
                      SizedBox(
                        height: h / 52,
                      ),
                      buildDefaultTextField(
                          inputType: TextInputType.emailAddress,
                          hintText: 'Ahmed@gmail.com',
                          aboveFieldText: 'البريد الالكتروني',
                          context: context),
                      SizedBox(
                        height: h / 52,
                      ),
                      buildDefaultTextField(
                          inputType: TextInputType.text,
                          hintText: '*****************',
                          isObscured: true,
                          aboveFieldText: 'الرقم السري',
                          context: context),
                      SizedBox(
                        height: h / 52,
                      ),
                      buildDefaultTextField(
                          inputType: TextInputType.text,
                          hintText: '*****************',
                          isObscured: true,
                          aboveFieldText: 'أعد كتابة الرقم السري',
                          context: context),
                      SizedBox(
                        height: h / 52,
                      ),
                      Text(
                        'الجنس',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: MediaQuery.of(context).size.width / 25.5,
                            ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          buildGenderRow(
                              context: context,
                              text: 'ذكر',
                              character: gender.Male),
                          SizedBox(
                            width: w / 20,
                          ),
                          buildGenderRow(
                              context: context,
                              text: 'أنثى',
                              character: gender.Female)
                        ],
                      ),
                      SizedBox(
                        height: h / 28,
                      ),
                      buildDefaultButton(
                          onTap: () {
                            pushToNextScreen(context: context,
                                screen: const OtpScreen());
                          },
                          text: 'إنشاء حساب',
                          color: primaryColor,
                          elevation: 4,
                          context: context),
                      SizedBox(
                        height: h / 30,
                      ),
                      buildRowTextAndLink(
                        onTap: () {
                          pushToNextScreen(context: context,
                              screen: const LoginScreen());
                        },
                          text: 'لديك حساب؟',
                          textLink: 'تسجيل الدخول',
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
  }
}
