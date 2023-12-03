import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';

class BuildItemForUserInChat extends StatelessWidget {
  final TextTheme font;
  final String image;
  final String title;
  final String category;
  final String price;

  const BuildItemForUserInChat(
      {super.key,
      required this.font,
      required this.image,
      required this.price,
      required this.title,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: midGrayColor, borderRadius: BorderRadius.circular(8.r)),
          width: 39.w,
          height: 39.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(title,
                    style: font.bodyLarge!.copyWith(
                        fontSize: 12.sp, fontWeight: FontWeight.w500)),
                SizedBox(
                  width: 20.w,
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.sizeOf(context).width / 10,
                  height: MediaQuery.sizeOf(context).height / 39,
                  decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(
                          MediaQuery.sizeOf(context).width / 30)),
                  child: Text(
                   price,
                    style: font.titleLarge!.copyWith(
                        fontSize: MediaQuery.sizeOf(context).width / 38,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
            Text(category,
                style: font.bodyMedium!.copyWith(fontSize: 10.sp))
          ],
        ),
      ],
    );
  }
}
