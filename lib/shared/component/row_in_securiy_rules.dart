import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar_icons/solar_icons.dart';

import '../styles/colors.dart';

class buildRowTextSecurity extends StatelessWidget {
  final String text;
  final bool withIcon;
  const buildRowTextSecurity({super.key, required this.text,required this.withIcon});

  @override
  Widget build(BuildContext context) {
    TextTheme font = Theme.of(context).textTheme;
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    return Row(
      children: [
       const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorConstant.primaryColor,
        ),
         SizedBox(
          width: w/65,
        ),
        Text(
          text,
          style: font.titleMedium!.copyWith(fontSize: w/39),
        )
        ,
        if(withIcon)
          Icon(SolarIconsOutline.shieldUser ,color: ColorConstant.primaryColor,size: 15.w,)
      ],
    );
  }
}
