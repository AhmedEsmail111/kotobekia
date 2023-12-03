import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/models/post.dart';
import 'package:kotobekia/modules/category_books/list.dart';
import 'package:kotobekia/shared/component/home/adds_section.dart';
import 'package:kotobekia/shared/component/home/dignity_flag.dart';
import 'package:solar_icons/solar_icons.dart';

class CategoryBooksScreen extends StatelessWidget {
  const CategoryBooksScreen(
      {super.key, required this.data, required this.category});

  final List<Post> data;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(5), child: Container()),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                SolarIconsOutline.tuning_2,
                size: 19.w,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                SolarIconsOutline.bell,
                size: 19.w,
              ),
            ),
          ],
          title: Container(
            width: 292.w,
            height: 38.h,
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.only(top: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.sp),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.sp),
                    borderSide: const BorderSide(
                      color: Color(0xFFC8C5C5),
                    )),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.w, vertical: 19.h),
                hintTextDirection: TextDirection.rtl,
                hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                hintText: 'بحث',
                prefixIcon: Icon(
                  SolarIconsOutline.magnifier,
                  size: 15.w,
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 4.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        category,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            SolarIconsOutline.widget,
                          ))
                    ],
                  )),
              const BuildPalestine(text: 'القدس هي عاصمة فلسطين اﻷبديه'),
              const BuildAddsSection(
                imageUrl:
                    "https://www.cairo24.com/UploadCache/libfiles/109/8/600x338o/558.jpg",
              ),
              BuildList(
                data: data,
              ),
            ],
          ),
        ));
  }
}
