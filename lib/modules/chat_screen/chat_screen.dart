import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/chat/chat_cubit.dart';
import 'package:kotobekia/modules/message_screen/message_screen.dart';
import 'package:kotobekia/shared/component/authentication/default_text_form_in_app.dart';
import 'package:kotobekia/shared/component/divider_line.dart';
import 'package:kotobekia/shared/component/security_guidelines.dart';
import 'package:kotobekia/shared/component/users_chat.dart';
import 'package:kotobekia/shared/constants/images/images_constant.dart';
import 'package:kotobekia/shared/network/local/local.dart';
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
          body: cubit.conversationModel != null
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: w / 26, right: w / 26, top: h / 14),
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
                                children: [
                                  Text(
                                    'شات',
                                    style: font.titleMedium,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              const Divider(
                                  color: ColorConstant.midGrayColor,
                                  thickness: 1),
                              ListView.separated(
                                  padding: EdgeInsets.only(top: 6.h),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        cubit.openUserConversation(
                                            token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NzRlMDVkODVjZDBkYTczZmRhYmE5NSIsImZ1bGxOYW1lIjoibG9sbyIsImVtYWlsIjoibG9sQGdtYWlsLmNvbSIsInJvbGUiOiJ1c2VyIiwiZ2VuZGVyIjoibWFsZSIsImJpcnRoRGF0ZSI6IjIwMDAtMDYtMTVUMDA6MDA6MDAuMDAwWiIsImlhdCI6MTcwMjE1ODUxNX0.DZFqXXOWPD1KJEPXTHykAqPlmQ_hTQbjsRs2H6UyncA',
                                            receiverId: cubit.otherUsers[index].sId!);
                                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return MessageScreen(index: index,
                                            convId: cubit.conversationModel!.conversations![index].sId!,
                                            name:cubit.otherUsers[index].fullName!, male:cubit.otherUsers[index].gender == 'male'
                                                ? true
                                                : false);
                                        },));
                                      },
                                      child: BuildUsersChat(
                                        font: font,
                                        image:
                                            cubit.otherUsers[index].gender == 'male'
                                                ? ImageConstant.userMaleImage
                                                : ImageConstant.userFemaleImage,
                                        name: cubit.otherUsers[index].fullName!,
                                        lastMessage: cubit.conversationModel!.conversations![index].latestMessage!.message!,
                                        status: 'منذ يومان',
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const BuildDividerLine(),
                                  itemCount: cubit.otherUsers.length),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              :const Center(
                child: CircularProgressIndicator(
                    color: ColorConstant.primaryColor,
                  ),
              ),
        );
      },
      listener: (context, state) {},
    );
  }
}
