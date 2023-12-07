import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/shared/helper/functions.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../styles/colors.dart';

// card that contain about post books

class BuildPosts extends StatelessWidget {
  final String title;
  final String description;
  final int price;
  final String image;
  final String educationLevel;
  final String location;
  final DateTime timeSince;
  final int numberOfWatcher;
  final int numberOfBooks;
  final double? height;
  final double? width;
  final double imageWidth;
  final double imageHeight;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final double cardElevation;
  final BoxBorder? cardBorder;
  final void Function() onTap;
  const BuildPosts({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.educationLevel,
    required this.location,
    // required this.lastTime,
    required this.numberOfWatcher,
    required this.numberOfBooks,
    this.height,
    this.width,
    required this.imageWidth,
    required this.imageHeight,
    required this.borderRadius,
    required this.cardElevation,
    this.contentPadding,
    required this.onTap,
    this.cardBorder,
    required this.timeSince,
  });

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final time = DateTime.now().difference(timeSince).inDays;

    final timeText = time <= 10 ? locale!.days : locale!.one_day_calender;
    return Card(
      elevation: cardElevation,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: ColorConstant.backgroundColor,
            borderRadius: borderRadius,
            border: cardBorder,
          ),
          padding: contentPadding,
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    14.sp,
                  ),
                  child: Image.network(
                    width: imageWidth,
                    height: imageHeight,
                    fit: BoxFit.cover,
                    'https://img.freepik.com/free-vector/hand-drawn-flat-design-stack-books-illustration_23-2149341898.jpg?w=740&t=st=1701695516~exp=1701696116~hmac=1ee8abb2afd856098988ec791155a2d564f92a9222648a3278485002899c990e',
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(
                        SolarIconsOutline.heart,
                        color: ColorConstant.whiteColor,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'getStart');
                      },
                    ))
              ]),
              Container(
                alignment: HelperFunctions.isArabic(title)
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                      ),
                  textDirection: HelperFunctions.isArabic(title)
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    description,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                    textDirection: HelperFunctions.isArabic(description)
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Icon(
                    SolarIconsOutline.book,
                    size: 10.h,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    '$numberOfBooks',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 10.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Icon(
                    SolarIconsOutline.eye,
                    size: 10.h,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    '$numberOfWatcher',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    width: 38.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                        color: price == 0
                            ? ColorConstant.primaryColor.withOpacity(0.2)
                            : const Color(0xFFD0E6F3),
                        borderRadius: BorderRadius.circular(
                            MediaQuery.sizeOf(context).width / 30)),
                    child: Text(
                      price == 0 ? locale!.free : '$price ${locale!.currency}',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            // textBaseline: TextBaseline.alphabetic,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: price == 0
                                ? ColorConstant.primaryColor
                                : const Color(0xFF1077FB),
                          ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Text(
                  educationLevel,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                  textDirection: HelperFunctions.isArabic(educationLevel)
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                ),
              ),
              Row(
                children: [
                  Icon(
                    SolarIconsOutline.mapPoint,
                    size: 10.h,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 90,
                  ),
                  Text(
                    location,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                    textDirection: HelperFunctions.isArabic(location)
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 55,
                  ),
                  const Spacer(),
                  Icon(
                    SolarIconsOutline.clockCircle,
                    size: 10.h,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 120,
                  ),
                  Text(
                    locale.time_since('$time $timeText '),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 10.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// custimize the radius and the elevation
// add the logic to home screen