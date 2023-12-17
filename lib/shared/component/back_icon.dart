import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/shared/styles/colors.dart';

class BuildBackIcon extends StatelessWidget {
  final BuildContext cntx;
  const BuildBackIcon({super.key,
  required this.cntx});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(cntx);
      },
      child: Container(
        width:32.w,
        height:32.h,
        decoration: BoxDecoration(
            color: ColorConstant.midGrayColor,
            borderRadius: BorderRadius.circular(5.r)),
        child: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.black,
        ),
      ),
    );
  }
}
