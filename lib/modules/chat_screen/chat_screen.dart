import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/chat/chat_cubit.dart';
import 'package:kotobekia/shared/component/authentication/default_text_form_in_app.dart';
import 'package:kotobekia/shared/component/divider_line.dart';
import 'package:kotobekia/shared/component/security_guidelines.dart';
import 'package:kotobekia/shared/component/users_chat.dart';
import 'package:kotobekia/shared/constants/images/images_constant.dart';
import 'package:kotobekia/shared/styles/colors.dart';

import '../../shared/component/check_type_chat.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    TextTheme font = Theme.of(context).textTheme;
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    var searchController = TextEditingController();
    return BlocConsumer<ChatCubit, ChatState>(
      builder: (context, state) {
        var cubit = context.read<ChatCubit>();
        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding:
                  EdgeInsets.only(left: w / 26, right: w / 26, top: h / 14),
              child: Column(
                children: [
                  Text(
                    locale!.messages,
                    style: font.titleMedium!.copyWith(fontSize: w / 21),
                  ),
                  SizedBox(
                    height: h / 21,
                  ),
                  BuildDefaultTextField(
                    withEyeVisible: false,
                      prefixIcons: const Icon(Icons.search),
                      backGroundColor: ColorConstant.foregroundColor,
                      inputType: TextInputType.text,
                      withText: false,
                      hintText: locale.search_by_name,
                      context: context,
                      controller: searchController,
                      width: double.infinity,
                      height: h / 16.8,
                      maxLenght: 225,
                      isObscured: false),
                  SizedBox(
                    height: h / 58,
                  ),
                  BuildSecurityGuideLines(h: h, w: w, font: font),
                  SizedBox(
                    height: h / 48,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(18.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(w / 30),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BuildCheckTypeChat(
                                cubit: cubit,
                                numberOfChecked: 1,
                                h: h,
                                w: w,
                                font: font,
                                text: locale.all,
                                numberOfMessage: 20),
                            BuildCheckTypeChat(
                              cubit: cubit,
                              numberOfChecked: 2,
                              h: h,
                              w: w,
                              font: font,
                              text: locale.requested,
                              numberOfMessage: 3,
                            ),
                            BuildCheckTypeChat(
                              cubit: cubit,
                              numberOfChecked: 3,
                              h: h,
                              w: w,
                              font: font,
                              text: locale.offered,
                              numberOfMessage: 0,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        const Divider(
                            color: ColorConstant.midGrayColor, thickness: 1),
                        if (cubit.checkedTypeChat == 1)
                          ListView.separated(
                              padding: EdgeInsets.only(top: 6.h),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, 'message');
                                  },
                                  child: BuildUsersChat(
                                    font: font,
                                    image: ImageConstant.userDefaultImage,
                                    name: 'محمد احمد ',
                                    lastMessage: 'بكام لو سمحت',
                                    status: 'منذ يومان',
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const BuildDividerLine(),
                              itemCount: 20),
                        if (cubit.checkedTypeChat == 2)
                          ListView.separated(
                              padding: EdgeInsets.only(top: 6.h),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return BuildUsersChat(
                                  font: font,
                                  image: ImageConstant.userDefaultImage,
                                  name: 'توينكز',
                                  lastMessage: 'انا عايز واحد من ده',
                                  status: 'الان',
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const BuildDividerLine(),
                              itemCount: 3),
                        if (cubit.checkedTypeChat == 3)
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 200,
                            child: Text(
                              'NO Users',
                              style:
                                  font.headlineMedium!.copyWith(fontSize: 20),
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
