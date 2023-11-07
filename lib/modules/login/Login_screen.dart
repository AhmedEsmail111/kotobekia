import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../shared/component/authentication/button_authentication_services.dart';
import '../../shared/component/authentication/default_button_in_app.dart';
import '../../shared/component/authentication/default_text_form_in_app.dart';
import '../../shared/component/authentication/row_text_and_link.dart';
import '../../shared/component/authentication/tow_line_and_text_in_auth.dart';
import '../../shared/constants/app/app_constant.dart';
import '../../shared/constants/icons/icons_constant.dart';
import '../../shared/navigation/pop_navigation.dart';
import '../../shared/styles/colors.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    return Directionality(
      textDirection: directionalityApp,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding:
                  EdgeInsets.only(top: h/12.5, left: w / 25, right: w / 25),
              child: Column(
                children: [
                  Text(
                    'تسجيل الدخول',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: h / 55,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'مرحبا بعودتك يا صديقي.',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        'يلا بينا نبدأ خير جديد ؟',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: h / 55,
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
                        height: h / 28,
                      ),
                      buildDefaultButton(
                          onTap: () {},
                          text: 'تسجيل الدخول',
                          color: primaryColor,
                          elevation: 4,
                          context: context),
                      SizedBox(
                        height: h/50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'هل نسيت الرقم السري ؟',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                !.copyWith(
                                    fontWeight: FontWeight.w600, fontSize: 14),
                          )
                        ],
                      ),
                      SizedBox(
                        height: h/55,
                      ),
                      buildTowLineRowInAuth(context: context),
                      SizedBox(
                        height: h/55,
                      ),
                      buildButtonAuthServices(
                          onTap: () {},
                          text: 'التسجيل باستخدام حساب فيسبوك',
                          buttonColor: midGrayColor,
                          iconImage: facebookIcon,
                          elevation: 0,
                          context: context),
                      SizedBox(
                        height: h/55,
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
                      buildRowTextAndLink(
                          onTap: () {
                            popCurrentScreen(context: context);
                          },
                          text: 'ليس لديك حساب؟',
                          textLink: 'سجل الأن',
                          context: context),
                      SizedBox(height: h/8,)
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
