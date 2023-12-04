import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/models/post_model/post_model.dart';
import 'package:kotobekia/modules/category_details/details_card.dart';
import 'package:kotobekia/shared/component/home/add_section.dart';
import 'package:kotobekia/modules/category_details/contact_card.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

import 'interaction_card.dart';
import 'row_details.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({super.key, required this.postDetails});
  final Post postDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      appBar: AppBar(
          title: Container(
            alignment: Alignment.topRight,
            child: Text(
              postDetails.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(14)),
              width: double.infinity,
              height: 200.h,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://www.cairo24.com/UploadCache/libfiles/109/8/600x338o/558.jpg',
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    width: 70.w,
                    height: 50.h,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFD7D7D8)
                        //  const Color.fromARGB(210, 243, 243, 239),
                      ),
                      margin: EdgeInsets.all(8.w),
                      width: 42.w,
                      height: 30.h,
                      alignment: Alignment.center,
                      child: Text(
                        '${postDetails.images.length} صور',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    width: 60.w,
                    height: 50.h,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'getStart');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFD7D7D8),
                          // const Color.fromARGB(210, 243, 243, 239),
                        ),
                        margin: EdgeInsets.all(8.w),
                        width: 42.w,
                        height: 30.h,
                        alignment: Alignment.center,
                        child: const Icon(SolarIconsOutline.heart),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 85.h,
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: postDetails.images.length,
                itemBuilder: (context, index) => Container(
                  clipBehavior: Clip.hardEdge,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(14)),
                  width: 85.h,
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Image.network(
                    'https://www.cairo24.com/UploadCache/libfiles/109/8/600x338o/558.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            BuildCardDetails(
              description: postDetails.description,
              location: postDetails.location,
              price: postDetails.price,
              timeSince: postDetails.createdSince,
              title: postDetails.title,
            ),
            BuildRowDetails(
              isLast: false,
              isFirst: true,
              firstText: 'المرحلة التعليمية',
              secondText: reversedLevels[postDetails.educationLevel]!,
            ),
            BuildRowDetails(
              isLast: false,
              firstText: 'الصف',
              secondText: postDetails.grade,
            ),
            BuildRowDetails(
              isLast: false,
              firstText: 'نوع التعليم',
              secondText: postDetails.educationType,
            ),
            BuildRowDetails(
              isLast: false,
              firstText: 'السنة الدراسية',
              secondText: postDetails.bookEdition,
            ),
            BuildRowDetails(
              firstText: 'التيرم',
              secondText: postDetails.semester,
            ),
            SizedBox(
              height: 4.h,
            ),
            const BuildInteractionCard(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: const BuildContactCard(name: 'أمجد حسام الدين'),
            ),
            const BuildAddsSection(
              imageUrl:
              'https://www.cairo24.com/UploadCache/libfiles/109/8/600x338o/558.jpg',
            ),
          ],
        ),
      ),
    );
  }
}