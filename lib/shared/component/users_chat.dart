import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';

class BuildUsersChat extends StatelessWidget {
  final String image;
  final TextTheme font;
  final String name;
  final String lastMessage;
  final String status;

  const BuildUsersChat(
      {super.key,
      required this.name,
      required this.lastMessage,
      required this.status,
      required this.font,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.asset(
              image,
              height: 47.w,
              width: 47.w,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 2.h, left: 2.w),
              child: CircleAvatar(
                radius: 5.r,
                backgroundColor: ColorConstant.primaryColor,
              ),
            )
          ],
        ),
        SizedBox(
          width: 16.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: font.bodyLarge!
                  .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 180.w,
              child: Text(lastMessage,
                  overflow: TextOverflow.ellipsis,
                  style: font.displayMedium!.copyWith(
                      fontSize: 12.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500)),
            ),
          ],
        ),
        Spacer(),
        Text(
          status,
          style: font.titleSmall!.copyWith(fontSize: 12),
        )
      ],
    );
  }
}
