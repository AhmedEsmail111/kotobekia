import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/home/home_cubit.dart';
import 'package:kotobekia/controller/home/home_state.dart';
import 'package:kotobekia/models/post_model/post_model.dart';
import 'package:kotobekia/modules/category_book/category_book_screen.dart';

import 'package:kotobekia/modules/category_details/category_details_screen.dart';
import 'package:kotobekia/shared/component/home/add_section.dart';
import 'package:kotobekia/shared/component/home/card_to_posts.dart';
import 'package:kotobekia/shared/component/home/dignity_flag.dart';
import 'package:kotobekia/shared/component/home/row_above_card.dart';
import 'package:solar_icons/solar_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    // final r = w / 1.32;
    // print(r);
    return Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(10), child: Container()),
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
        body: BlocConsumer<HomeCubit, HomeStates>(
            listener: (ctx, state) {},
            builder: (ctx, state) {
              final homeCubit = HomeCubit.get(context);
              final kinderGatenPosts = homeCubit.kindergartenPosts;
              final primaryPosts = homeCubit.primaryPosts;
              final preparatoryPosts = homeCubit.preparatoryPosts;
              final secondaryPosts = homeCubit.secondaryPosts;
              final generalPosts = homeCubit.generalPosts;

              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const BuildPalestine(
                        text: 'لا بلد بعد فلسطين ولا عاصمة بعد القدس'),
                    const BuildAddsSection(
                      imageUrl:
                      'https://www.cairo24.com/UploadCache/libfiles/109/8/600x338o/558.jpg',
                    ),
                    BuildRowAboveCard(
                      title: locale!.kindergarten,
                      numberOfBooks: 100,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => CategoryBooksScreen(
                              data: kinderGatenPosts,
                              category: 'حضانة',
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 283.h,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: kinderGatenPosts.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 16.w),
                            child: BuildPosts(

                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => CategoryDetailsScreen(
                                    postDetails: Post(
                                      title: kinderGatenPosts[index].title,
                                      images: kinderGatenPosts[index].images,
                                      price: kinderGatenPosts[index].price,
                                      grade: kinderGatenPosts[index].grade,
                                      educationLevel: kinderGatenPosts[index]
                                          .educationLevel,
                                      location:
                                      kinderGatenPosts[index].location,
                                      numberOfBooks:
                                      kinderGatenPosts[index].numberOfBooks,
                                      seen: kinderGatenPosts[index].seen,
                                      description:
                                      kinderGatenPosts[index].description,
                                      createdSince: 'منذ 5 أيام',
                                      educationType:
                                      kinderGatenPosts[index].educationType,
                                      bookEdition:
                                      kinderGatenPosts[index].bookEdition,
                                      semester:
                                      kinderGatenPosts[index].semester,
                                    ),
                                  ),
                                ),
                              ),
                              imageHeight: 150.h,
                              imageWidth: 151.w,
                              width: 150.w,
                              height: 283.h,
                              borderRadius: BorderRadius.zero,
                              title: kinderGatenPosts[index].title,
                              description: kinderGatenPosts[index].description,
                              price: kinderGatenPosts[index].price,
                              image: kinderGatenPosts[index].images[0],
                              educationLevel: reversedLevels[
                              kinderGatenPosts[index].educationLevel]!,
                              location: kinderGatenPosts[index].location,
                              numberOfWatcher: kinderGatenPosts[index].seen,
                              numberOfBooks:
                              kinderGatenPosts[index].numberOfBooks,
                              cardElevation: 0,
                            ),
                          );
                        },
                      ),
                    ),
                    BuildRowAboveCard(
                      title: locale.primary,
                      numberOfBooks: 100,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => CategoryBooksScreen(
                              data: primaryPosts,
                              category: 'إبتدائي',
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 283.h,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: primaryPosts.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 16.w),
                            child: BuildPosts(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => CategoryDetailsScreen(
                                    postDetails: Post(
                                      title: primaryPosts[index].title,
                                      images: primaryPosts[index].images,
                                      price: primaryPosts[index].price,
                                      grade: primaryPosts[index].grade,
                                      educationLevel:
                                      primaryPosts[index].educationLevel,
                                      location: primaryPosts[index].location,
                                      numberOfBooks:
                                      primaryPosts[index].numberOfBooks,
                                      seen: primaryPosts[index].seen,
                                      description:
                                      primaryPosts[index].description,
                                      createdSince: 'منذ 5 أيام',
                                      educationType:
                                      primaryPosts[index].educationType,
                                      bookEdition:
                                      primaryPosts[index].bookEdition,
                                      semester: primaryPosts[index].semester,
                                    ),
                                  ),
                                ),
                              ),
                              imageHeight: 150.h,
                              imageWidth: 151.w,
                              width: 150.w,
                              height: 283.h,
                              borderRadius: BorderRadius.zero,
                              title: primaryPosts[index].title,
                              description: primaryPosts[index].description,
                              price: primaryPosts[index].price,
                              image: primaryPosts[index].images[0],
                              educationLevel: reversedLevels[
                              primaryPosts[index].educationLevel]!,
                              location: primaryPosts[index].location,
                              numberOfWatcher: primaryPosts[index].seen,
                              numberOfBooks: primaryPosts[index].numberOfBooks,
                              cardElevation: 0,
                            ),
                          );
                        },
                      ),
                    ),
                    BuildRowAboveCard(
                      title: locale.preparatory,
                      numberOfBooks: 100,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => CategoryBooksScreen(
                              data: preparatoryPosts,
                              category: 'إعدادي',
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 283.h,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: preparatoryPosts.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 16.w),
                            child: BuildPosts(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => CategoryDetailsScreen(
                                    postDetails: Post(
                                      title: preparatoryPosts[index].title,
                                      images: preparatoryPosts[index].images,
                                      price: primaryPosts[index].price,
                                      grade: preparatoryPosts[index].grade,
                                      educationLevel: preparatoryPosts[index]
                                          .educationLevel,
                                      location:
                                      preparatoryPosts[index].location,
                                      numberOfBooks:
                                      preparatoryPosts[index].numberOfBooks,
                                      seen: preparatoryPosts[index].seen,
                                      description:
                                      preparatoryPosts[index].description,
                                      createdSince: 'منذ 5 أيام',
                                      educationType:
                                      preparatoryPosts[index].educationType,
                                      bookEdition:
                                      preparatoryPosts[index].bookEdition,
                                      semester:
                                      preparatoryPosts[index].semester,
                                    ),
                                  ),
                                ),
                              ),
                              imageHeight: 150.h,
                              imageWidth: 151.w,
                              width: 150.w,
                              height: 283.h,
                              borderRadius: BorderRadius.zero,
                              title: preparatoryPosts[index].title,
                              description: preparatoryPosts[index].description,
                              price: preparatoryPosts[index].price,
                              image: preparatoryPosts[index].images[0],
                              educationLevel: reversedLevels[
                              preparatoryPosts[index].educationLevel]!,
                              location: preparatoryPosts[index].location,
                              numberOfWatcher: preparatoryPosts[index].seen,
                              numberOfBooks:
                              preparatoryPosts[index].numberOfBooks,
                              cardElevation: 0,
                            ),
                          );
                        },
                      ),
                    ),
                    BuildRowAboveCard(
                      title: locale.secondary,
                      numberOfBooks: 100,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => CategoryBooksScreen(
                              data: secondaryPosts,
                              category: 'ثانوي',
                            )),
                      ),
                    ),
                    SizedBox(
                      // margin: const EdgeInsets.only(right: 16),
                      height: 283.h,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: secondaryPosts.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 16.w),
                            child: BuildPosts(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => CategoryDetailsScreen(
                                      postDetails: Post(
                                        title: secondaryPosts[index].title,
                                        images:
                                        secondaryPosts[index].images,
                                        price: secondaryPosts[index].price,
                                        grade: secondaryPosts[index].grade,
                                        educationLevel:
                                        secondaryPosts[index]
                                            .educationLevel,
                                        location:
                                        secondaryPosts[index].location,
                                        numberOfBooks: secondaryPosts[index]
                                            .numberOfBooks,
                                        seen: secondaryPosts[index].seen,
                                        description: secondaryPosts[index]
                                            .description,
                                        createdSince: 'منذ 5 أيام',
                                        educationType: secondaryPosts[index]
                                            .educationType,
                                        bookEdition: secondaryPosts[index]
                                            .bookEdition,
                                        semester:
                                        secondaryPosts[index].semester,
                                      ),
                                    )),
                              ),
                              imageHeight: 150.h,
                              imageWidth: 151.w,
                              width: 150.w,
                              height: 283.h,
                              borderRadius: BorderRadius.zero,
                              title: secondaryPosts[index].title,
                              description: secondaryPosts[index].description,
                              price: secondaryPosts[index].price,
                              image: secondaryPosts[index].images[0],
                              educationLevel: reversedLevels[
                              secondaryPosts[index].educationLevel]!,
                              location: secondaryPosts[index].location,
                              numberOfWatcher: secondaryPosts[index].seen,
                              numberOfBooks:
                              secondaryPosts[index].numberOfBooks,
                              cardElevation: 0,
                            ),
                          );
                        },
                      ),
                    ),
                    BuildRowAboveCard(
                      title: locale.general,
                      numberOfBooks: 100,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => CategoryBooksScreen(
                              data: generalPosts,
                              category: 'عام',
                            )),
                      ),
                    ),
                    SizedBox(
                      // margin: const EdgeInsets.only(right: 16),
                      height: 283.h,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: generalPosts.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 16.w),
                            child: BuildPosts(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => CategoryDetailsScreen(
                                      postDetails: Post(
                                        title: generalPosts[index].title,
                                        images: generalPosts[index].images,
                                        price: generalPosts[index].price,
                                        grade: generalPosts[index].grade,
                                        educationLevel: generalPosts[index]
                                            .educationLevel,
                                        location:
                                        generalPosts[index].location,
                                        numberOfBooks: generalPosts[index]
                                            .numberOfBooks,
                                        seen: generalPosts[index].seen,
                                        description:
                                        generalPosts[index].description,
                                        createdSince: 'منذ 5 أيام',
                                        educationType: generalPosts[index]
                                            .educationType,
                                        bookEdition:
                                        generalPosts[index].bookEdition,
                                        semester:
                                        generalPosts[index].semester,
                                      ),
                                    )),
                              ),
                              imageHeight: 150.h,
                              imageWidth: 151.w,
                              width: 150.w,
                              height: 283.h,
                              borderRadius: BorderRadius.zero,
                              title: generalPosts[index].title,
                              description: generalPosts[index].description,
                              price: generalPosts[index].price,
                              image: generalPosts[index].images[0],
                              educationLevel: reversedLevels[
                              generalPosts[index].educationLevel]!,
                              location: generalPosts[index].location,
                              numberOfWatcher: generalPosts[index].seen,
                              numberOfBooks: generalPosts[index].numberOfBooks,
                              cardElevation: 0,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}