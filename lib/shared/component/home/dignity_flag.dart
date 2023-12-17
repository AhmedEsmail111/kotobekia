import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/shared/constants/images/images_constant.dart';

class BuildPalestine extends StatelessWidget {
  final String text;

  const BuildPalestine({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    // final w = MediaQuery.of(context).size.width;
    // final h = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 35.h,
      color: const Color(0xFFECECEC),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              text,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          Image.asset(
            ImageConstant.palestineMapImage,
            width: 20,
            height: 20,
            fit: BoxFit.cover,
          ),
          Image.asset(
            ImageConstant.palestineImage,
            width: 20,
            height: 20,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
