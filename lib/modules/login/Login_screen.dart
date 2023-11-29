import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotobekia/controller/authentication/authentication_cubit.dart';
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:kotobekia/shared/constants/icons/icons_constant.dart';
import '../../shared/component/authentication/button_authentication_services.dart';
import '../../shared/component/authentication/default_button_in_app.dart';
import '../../shared/component/authentication/default_text_form_in_app.dart';
import '../../shared/component/authentication/row_text_and_link.dart';
import '../../shared/component/authentication/tow_line_and_text_in_auth.dart';
import '../../shared/component/snakbar_message.dart';

import '../../shared/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    TextTheme font = Theme.of(context).textTheme;
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    var formKey=GlobalKey<FormState>();
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        var cubit = context.read<AuthenticationCubit>();
        return Directionality(
          textDirection: AppConstant.directionalityApp,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: h / 12.5, left: w / 25, right: w / 25),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Text(
                          'تسجيل الدخول',
                          style: font.bodyLarge,
                        ),
                        SizedBox(
                          height: h / 55,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'مرحبا بعودتك يا صديقي.',
                              style: font.bodyLarge,
                            ),
                            Text(
                              'يلا بينا نبدأ خير جديد ؟',
                              style: font.titleMedium,
                            ),
                            SizedBox(
                              height: h / 55,
                            ),
                            BuildDefaultTextField(
                                backGroundColor: Colors.white,
                                maxLenght: 320,
                                controller: emailController,
                                width: double.infinity,
                                height: h / 16.8,
                                withText: true,
                                isObscured: false,
                                inputType: TextInputType.emailAddress,
                                hintText: 'Ahmed@gmail.com',
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
                                aboveFieldText: 'البريد الالكتروني',
                                context: context),
                            SizedBox(
                              height: h / 52,
                            ),
                            BuildDefaultTextField(
                                backGroundColor: Colors.white,
                                maxLenght: 128,
                                controller: passwordController,
                                width: double.infinity,
                                height: h / 16.8,
                                withText: true,
                                cubit: cubit,
                                inputType: TextInputType.text,
                                hintText: '*****************',
                                onValidate: (value) {
                                  if (value!.isEmpty) {
                                    return "الرجاء إدخال كلمة المرور.";
                                  } else if (value.length < 6) {
                                    return "يجب أن تكون كلمة المرور على الأقل 6 أحرف.";
                                  }
                                  return null;
                                },
                                numberOfFormPass: 1,
                                isObscured: true,
                                aboveFieldText: 'الرقم السري',
                                context: context),
                            SizedBox(
                              height: h / 28,
                            ),
                            state is! LoadingUserLoginState
                                ? BuildDefaultButton(
                                    onTap: () {
                                      if(formKey.currentState!.validate()){
                                        cubit.userLogin(
                                            email: emailController.text,
                                            password: passwordController.text);
                                      }
                                    },
                                    text: 'تسجيل الدخول',
                                    color: primaryColor,
                                    elevation: 4,
                                    context: context)
                                :  const Center(
                                  child: CircularProgressIndicator(
                                    color: primaryColor,
                                  ),
                                ),
                            SizedBox(
                              height: h / 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'هل نسيت الرقم السري ؟',
                                  style: font.displayMedium!.copyWith(
                                      fontWeight: FontWeight.w600, fontSize: 14),
                                )
                              ],
                            ),
                            SizedBox(
                              height: h / 55,
                            ),
                            BuildTowLineRowInAuth(context: context),
                            SizedBox(
                              height: h / 55,
                            ),
                            BuildButtonAuthServices(
                                onTap: () {},
                                text: 'التسجيل باستخدام حساب فيسبوك',
                                buttonColor: midGrayColor,
                                iconImage: IconConstant.facebookIcon,
                                elevation: 0,
                                context: context),
                            SizedBox(
                              height: h / 55,
                            ),
                            BuildButtonAuthServices(
                                onTap: () {},
                                text: 'التسجيل باستخدام حساب جوجل',
                                buttonColor: midGrayColor,
                                iconImage: IconConstant.googleIcon,
                                elevation: 0,
                                context: context),
                            SizedBox(
                              height: h / 35,
                            ),
                            BuildRowTextAndLink(
                                fontSize: w / 30,
                                onTap: () {
                                  Navigator.pushNamed(context,
                                      'createAccount');
                                },
                                text: 'ليس لديك حساب؟',
                                textLink: 'سجل الأن',
                                context: context),
                            SizedBox(
                              height: h / 8,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is SuccessUserLoginState) {
          if(state.userModel.token==null){
            snakBarMessage(
                context: context,
                message: state.userModel.message.toString());
          }else {
         Navigator.pushNamed(context, '');
          }
        } else if (state is FailedUserLoginState) {
          snakBarMessage(
              context: context,
              message: state.error);
        }
      },
    );
  }
}
