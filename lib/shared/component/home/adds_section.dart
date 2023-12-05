import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/shared/styles/colors.dart';

class BuildAddsSection extends StatelessWidget {
  final String imageUrl;
  const BuildAddsSection({
    super.key,
    required this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final h = MediaQuery.sizeOf(context).height;
    // final r = h / 25.5;
    // print(r);
    return Container(
      height: 115.h,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.only(
        right: 16.w,
        left: 16.w,
        top: 8.h,
        bottom: 8.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.sp),
      ),
      child: Stack(children: [
        Image.network(
          imageUrl,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
            left: 10,
            top: 10,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorConstant.whiteColor,
              ),
              width: 25.h,
              height: 25.h,
              child: Text(
                'AD',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 12.sp,
                      color: const Color(0xFF0F172A),
                    ),
              ),
            ))
      ]),
    );
  }
}
