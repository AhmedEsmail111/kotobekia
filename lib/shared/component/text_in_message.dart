import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';

class BuildTextMessage extends StatelessWidget {
  final TextTheme font;
  final String text;
  final bool sender;

  const BuildTextMessage({super.key, required this.font, required this.text,required this.sender});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: Align(
        alignment: sender
            ? AlignmentDirectional.centerStart
            : AlignmentDirectional.centerEnd,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.h),
            decoration: BoxDecoration(
                color: sender?primaryColor:foregroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                  bottomLeft: sender?Radius.circular(20.r):const Radius.circular(0),
                  bottomRight: sender?const Radius.circular(0):Radius.circular(20.r),
                )),
            child: Text(
              text,
              style: font.titleMedium!.copyWith(fontSize: 12.sp),
            )),
      ),
    );
  }
}
