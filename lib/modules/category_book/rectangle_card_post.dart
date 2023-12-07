import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/models/post_model/post_model.dart';
import 'package:kotobekia/shared/helper/functions.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

class BuildRectangleCardPost extends StatelessWidget {
  final String title;
  final String description;
  final int price;
  final String image;
  final String educationLevel;
  final String location;
  final DateTime timeSince;
  final int numberOfWatcher;
  final int numberOfBooks;

  final void Function() onTap;
  const BuildRectangleCardPost({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.educationLevel,
    required this.location,
    required this.numberOfWatcher,
    required this.numberOfBooks,
    required this.onTap,
    required this.timeSince,
  });

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final time = DateTime.now().difference(timeSince).inDays;

    final timeText = time <= 10 ? locale!.days : locale!.one_day_calender;
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: ColorConstant.whiteColor,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFC8C5C5)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          width: double.infinity,
          height: 178.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(
                      14.sp,
                    ),
                    child: Image.network(
                      width: MediaQuery.of(context).size.width / 2.6,
                      height: 158.h,
                      fit: BoxFit.cover,
                      'https://www.cairo24.com/UploadCache/libfiles/109/8/600x338o/558.jpg',
                    ),
                  ),
                  Positioned(
                    right: 1,
                    bottom: 1,
                    child: IconButton(
                      icon: Icon(
                        SolarIconsOutline.heart,
                        color: ColorConstant.whiteColor,
                        size: 20.h,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'getStart');
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.4,
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                      textDirection: HelperFunctions.isArabic(title)
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2.4,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 2,
                        description,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                            ),
                        textDirection: HelperFunctions.isArabic(description)
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                      ),
                    ),
                  ),
                  Text(
                    reversedLevels[educationLevel]!,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                    textDirection: HelperFunctions.isArabic(
                            reversedLevels[educationLevel]!)
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.4,
                    child: Row(
                      children: [
                        Icon(
                          SolarIconsOutline.book,
                          size: 10.h,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 60,
                        ),
                        Text(
                          '$numberOfBooks',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: 10.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 55,
                        ),
                        Icon(
                          SolarIconsOutline.eye,
                          size: 10.h,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 55,
                        ),
                        Text(
                          '$numberOfWatcher',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                            price == 0
                                ? locale!.free
                                : '$price ${locale!.currency}',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
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
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.4,
                    child: Row(
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
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                          locale.time_since('$time $timeText'),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: 10.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
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
// Text(
//   softWrap: true,
//   overflow: TextOverflow.ellipsis,
//   maxLines: 3,
//   description,
//   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//         fontSize: 10.sp,
//         fontWeight: FontWeight.w600,
//       ),
// ),

// Column(
//   children: [
//     Container(
//       alignment: Alignment.centerRight,
//       child: Text(
//         title,
//         overflow: TextOverflow.ellipsis,
//         maxLines: 1,
//         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//               fontSize: 13.sp,
//               fontWeight: FontWeight.w700,
//             ),
//       ),
//     ),
//     Text(
//       overflow: TextOverflow.ellipsis,
//       maxLines: 1,
//       description,
//       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//             fontSize: 10.sp,
//             fontWeight: FontWeight.w400,
//           ),
//     ),
//     SizedBox(
//       height: MediaQuery.sizeOf(context).width / 55,
//     ),
//     Row(
//       children: [
//         Icon(
//           SolarIconsOutline.book,
//           size: 10.h,
//         ),
//         SizedBox(
//           width: MediaQuery.sizeOf(context).width / 60,
//         ),
//         Text(
//           '$numberOfBooks',
//           style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//               fontSize: 10.sp, fontWeight: FontWeight.w900),
//         ),
//         SizedBox(
//           width: MediaQuery.sizeOf(context).width / 55,
//         ),
//         Icon(
//           SolarIconsOutline.eye,
//           size: 10.h,
//         ),
//         SizedBox(
//           width: MediaQuery.sizeOf(context).width / 55,
//         ),
//         Text(
//           '$numberOfWatcher',
//           style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                 fontSize: 10.sp,
//                 fontWeight: FontWeight.w900,
//               ),
//         ),
//         Spacer(),
//         Container(
//           alignment: Alignment.center,
//           width: 38.w,
//           height: 20.h,
//           decoration: BoxDecoration(
//               color: price == 0
//                   ? primaryColor.withOpacity(0.2)
//                   : const Color(0xFFD0E6F3),
//               borderRadius: BorderRadius.circular(
//                   MediaQuery.sizeOf(context).width / 30)),
//           child: Text(
//             price == 0 ? 'مجاناً' : '$price ج',
//             style:
//                 Theme.of(context).textTheme.titleLarge!.copyWith(
//                       // textBaseline: TextBaseline.alphabetic,
//                       fontSize: 12.sp,
//                       fontWeight: FontWeight.w400,
//                       color: price == 0
//                           ? primaryColor
//                           : const Color(0xFF1077FB),
//                     ),
//           ),
//         ),
//       ],
//     ),
//     SizedBox(
//       height: MediaQuery.sizeOf(context).width / 85,
//     ),
//     Container(
//       alignment: Alignment.centerRight,
//       child: Text(
//         educationLevel,
//         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//               fontSize: 10.sp,
//               fontWeight: FontWeight.w400,
//             ),
//       ),
//     ),
//     Row(
//       children: [
//         Icon(
//           SolarIconsOutline.mapPoint,
//           size: 10.h,
//         ),
//         SizedBox(
//           width: MediaQuery.sizeOf(context).width / 90,
//         ),
//         Text(
//           location,
//           style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                 fontSize: 10.sp,
//                 fontWeight: FontWeight.w500,
//               ),
//         ),
//         SizedBox(
//           width: MediaQuery.sizeOf(context).width / 55,
//         ),
//         const Spacer(),
//         Icon(
//           SolarIconsOutline.clockCircle,
//           size: 10.h,
//         ),
//         SizedBox(
//           width: MediaQuery.sizeOf(context).width / 120,
//         ),
//         Text(
//           'منذ 5 ايام',
//           style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//               fontSize: 10.sp, fontWeight: FontWeight.w500),
//         ),
//       ],
//     ),
//   ],
// )
