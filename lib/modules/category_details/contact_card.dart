import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

class ContactCard extends StatelessWidget {
  final String name;

  const ContactCard({
    super.key,
    required this.name,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      color: whiteColor,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: whiteColor,
        ),
        width: double.infinity,
        height: 80.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        SolarIconsOutline.phoneRounded,
                        color: primaryColor,
                        size: 18.w,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'مكالمة',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        SolarIconsOutline.letter,
                        color: secondaryColor,
                        size: 18.w,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'رسالة',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: double.infinity,
              width: 2.w,
              color: midGrayColor,
            ),
            SizedBox(
              // alignment: Alignment.center,
              width: 60.w,
              height: 60.w,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset('assets/images/man.jpg'),
                  ),
                  const Positioned(
                    right: 0,
                    bottom: 0,
                    child: Icon(
                      Icons.task_alt_rounded,
                      color: Color(0xFF08B1E7),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 16.w),
              child: Column(
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'عرض الملف الشخصي',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 10.sp,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
