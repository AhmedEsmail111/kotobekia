import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/add_post/add_post_cubit.dart';
import 'package:kotobekia/controller/authentication/authentication_cubit.dart';
import 'package:kotobekia/controller/category/category_cubit.dart';
import 'package:kotobekia/controller/category_details/category_details_cubit.dart';
import 'package:kotobekia/controller/chat/chat_cubit.dart';
import 'package:kotobekia/controller/favorites/favorites_cubit.dart';
import 'package:kotobekia/controller/home/home_cubit.dart';
import 'package:kotobekia/controller/internet/internet-states.dart';
import 'package:kotobekia/controller/internet/internet_cubit.dart';
import 'package:kotobekia/controller/language/language_cubit.dart';
import 'package:kotobekia/controller/language/language_states.dart';
import 'package:kotobekia/controller/otp/otp_cubit.dart';
import 'package:kotobekia/controller/profile/profile_cubit.dart';
import 'package:kotobekia/l10n/l10n.dart';
import 'package:kotobekia/layout/home_layout.dart';
import 'package:kotobekia/modules/change_language/change_language.dart';
import 'package:kotobekia/modules/change_passwrod/chnage_password_screen.dart';
import 'package:kotobekia/modules/create_account/create_account_screen.dart';
import 'package:kotobekia/modules/favorite_adds/favorite_adds_.dart';
import 'package:kotobekia/modules/enter_new_password/enter_new_password_screen.dart';
import 'package:kotobekia/modules/forget_password/forget_password_screen.dart';
import 'package:kotobekia/modules/get_start/get_start_screen.dart';
import 'package:kotobekia/modules/login/Login_screen.dart';
import 'package:kotobekia/modules/modify_profile/modify_profile.dart';
import 'package:kotobekia/modules/otp/otp_screen.dart';
import 'package:kotobekia/modules/verified_email/verified_email_screen.dart';
import 'package:kotobekia/shared/component/snakbar_message.dart';
import 'package:kotobekia/shared/component/snakbar_message.dart';
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:kotobekia/shared/constants/images/images_constant.dart';
import 'package:kotobekia/shared/network/local/local.dart';
import 'package:kotobekia/shared/network/remote/remote.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:kotobekia/shared/styles/styles.dart';
import 'package:page_transition/page_transition.dart';

import 'modules/chat_screen/chat_screen.dart';
import 'modules/choose_anguage/languages_screen.dart';
import 'modules/message_screen/message_screen.dart';
import 'shared/helper/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  Widget widget;
  if(CacheHelper.getData(key: AppConstant.otpScreen)==null
  &&CacheHelper.getData(key: AppConstant.token)!=null
  ){
    widget=const OtpScreen();
  }else{
    widget=const LayoutScreen();
  }
  runApp(MyApp(widget: widget,));
}

class MyApp extends StatelessWidget {
  final Widget widget;
  const MyApp( {super.key,required this.widget});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationCubit(),
        ),
        BlocProvider(
          create: (context) => ChatCubit()..
          getUsersConversation(token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NzRlMDVkODVjZDBkYTczZmRhYmE5NSIsImZ1bGxOYW1lIjoibG9sbyIsImVtYWlsIjoibG9sQGdtYWlsLmNvbSIsInJvbGUiOiJ1c2VyIiwiZ2VuZGVyIjoibWFsZSIsImJpcnRoRGF0ZSI6IjIwMDAtMDYtMTVUMDA6MDA6MDAuMDAwWiIsImlhdCI6MTcwMjE1ODUxNX0.DZFqXXOWPD1KJEPXTHykAqPlmQ_hTQbjsRs2H6UyncA'),
        ),
        BlocProvider(
          create: (context) => OtpCubit(),
        ),
        BlocProvider(
          create: (ctx) => HomeCubit(),
        ),
        BlocProvider(
          create: (ctx) => CategoryCubit(),
        ),
        BlocProvider(
          create: (ctx) => AddPostCubit(),
        ),
        BlocProvider(
          create: (ctx) => ProfileCubit(),
        ),
        BlocProvider(
          create: (ctx) => FavoritesCubit(),
        ),
        BlocProvider(
          create: (ctx) => CategoryDetailsCubit(),
        ),
        BlocProvider(
          create: (ctx) => LanguageCubit(),
        ),
        BlocProvider(
          create: (ctx) => InternetCubit()..checkConnectivity(),
        ),

      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return BlocConsumer<LanguageCubit, LanguageStates>(
            listener: (ctx, state) {},
            builder: (ctx, state) {
              final profileCubit = LanguageCubit.get(_);
              return MaterialApp(
                  routes: {
                    'homeLayout': (context) => const LayoutScreen(),
                    'getStart': (context) => const GetStartScreen(),
                    'createAccount': (context) => const CreateAccountScreen(),
                    'login': (context) => const LoginScreen(),
                    'verifiedEmail': (context) => const VerifiedEmailScreen(),
                    'otp': (context) => const OtpScreen(),
                    'message': (context) => const MessageScreen(),
                    'chat': (context) => const ChatScreen(),
                    'changePassword': (context) => const ChangePasswordScreen(),
                    'forgetPassword': (context) => const ForgetPasswordScreen(),
                    'modifyProfile': (context) => const ModifyProfileScreen(),
                    'favoriteAdds': (context) => const FavoriteAddsScreen(),
                    'changeLanguage': (context) => const ChangeLanguageScreen(),
                  },
                  locale: profileCubit.locale,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate
                  ],
                  supportedLocales: L10n.all,
                  debugShowCheckedModeBanner: false,
                  themeMode: ThemeMode.light,
                  theme: lightTheme(width: width, height: height),
                  home: BlocListener<InternetCubit, InternetStates>(
                    listener: (ctx, state) {
                      final locale = AppLocalizations.of(ctx);
                      if (state is InternetNotConnected) {
                        snackBarMessage(
                          context: ctx,
                          message: locale!.snackbar_no_internet,
                          snackbarState: SnackbarState.error,
                          duration: const Duration(days: 1),
                        );
                      }
                      if (state is InternetConnected && !state.isFirst) {
                        snackBarMessage(
                            context: ctx,
                            message: locale!.connection_restored,
                            snackbarState: SnackbarState.success,
                            duration: const Duration(seconds: 2));
                      }
                    },
                    child: CacheHelper.getData(key: AppConstant.languageKey) ==
                            null
                        ? AnimatedSplashScreen(
                            nextScreen: CacheHelper.getData(
                                        key: AppConstant.languageKey) ==
                                    null
                                ? const LanguageScreen()
                                : widget,
                            duration: 3500,
                            splashIconSize: width / 0.7,
                            pageTransitionType: PageTransitionType.fade,
                            backgroundColor: ColorConstant.backgroundColor,
                            splash: ImageConstant.splashAnimationImage,
                            splashTransition: SplashTransition.fadeTransition,
                          )
                        : widget,
                  ));
            },
          );
        },
      ),
    );
  }
}
