import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/shared/component/divider_line.dart';
import 'package:kotobekia/shared/component/item_for_user_in_chat.dart';
import 'package:kotobekia/shared/component/text_in_message.dart';
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:kotobekia/shared/constants/images/images_constant.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../shared/component/user_row_in_message.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme font = Theme.of(context).textTheme;
    return Directionality(
      textDirection: AppConstant.directionalityApp,
      child: Scaffold(
        bottomSheet: Container(
          padding: EdgeInsets.all(12.w),
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  maxLines: null, // Allow the TextFormField to have multiple lines
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
                    fillColor: midGrayColor,
                    filled: true,
                    hintText: 'قول اللي نفسك فيه...',
                    hintStyle: font.displayMedium!.copyWith(fontSize: 12.sp),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: Icon(SolarIconsOutline.gallery, color: primaryColor, size: 24.w),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 18.w),
              Transform.scale(
                scaleX: -1,
                child: Icon(SolarIconsOutline.plain2, size: 24.w, color: primaryColor),
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Material(
              elevation: 4,
              shadowColor: Colors.black.withOpacity(0.25),
              child: Container(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 35.h),
                color: Colors.white,
                height: 180.h,
                width: double.infinity,
                child: Column(
                  children: [
                    BuildUserRowInMessage(name: 'امجد حسام الدين', font: font),
                    SizedBox(
                      height: 9.h,
                    ),
                    const BuildDividerLine(),
                    BuildItemForUserInChat(
                        font: font,
                        image:
                            'https://www.cairo24.com/UploadCache/libfiles/109/8/600x338o/558.jpg',
                        price: 'مجانا',
                        title: 'مجموعة كتب الاضواء',
                        category: ' كتب مستعملة الاضواء الصف الثالث الاعدادي')
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            BuildTextMessage(font: font, text: 'الكتاب مجاني ولا بفلوس',sender: true),
            SizedBox(height: 36.h,),
            BuildTextMessage(font: font, text: 'مجاني تقدري تستلميه مني في اقرب محطة مترو ',sender: false),
          ],
        ),
      ),
    );
  }
}
