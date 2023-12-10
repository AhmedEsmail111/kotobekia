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
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:kotobekia/shared/network/local/local.dart';
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
              hintText: locale!.search,
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
          final homePostsModel = homeCubit.homePostsModel;
          final kinderGatenPosts = homeCubit.kindergartenPosts;
          final primaryPosts = homeCubit.primaryPosts;
          final preparatoryPosts = homeCubit.preparatoryPosts;
          final secondaryPosts = homeCubit.secondaryPosts;
          final generalPosts = homeCubit.generalPosts;

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                BuildPalestine(text: locale.palestine),
                const BuildAddsSection(
                  imageUrl:
                      'https://www.cairo24.com/UploadCache/libfiles/109/8/600x338o/558.jpg',
                ),
                BuildRowAboveCard(
                  title: locale.kindergarten,
                  numberOfBooks: 100,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => CategoryBooksScreen(
                              categoryIndex: 0,
                              category: locale.kindergarten,
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
                      final languageCode =
                          CacheHelper.getData(key: AppConstant.languageKey);
                      return Container(
                        margin: languageCode == 'ar'
                            ? EdgeInsets.only(right: 16.w)
                            : EdgeInsets.only(left: 16.w),
                        child: BuildPosts(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => CategoryDetailsScreen(
                                categoryIndex: 0,
                                postIndex: index,
                              ),
                            ),
                          ),
                          imageHeight: 160.h,
                          imageWidth: 150.w,
                          width: 150.w,
                          height: 283.h,
                          borderRadius: BorderRadius.zero,
                          title: kinderGatenPosts[index].title,
                          description: kinderGatenPosts[index].description,
                          price: kinderGatenPosts[index].price,
                          image: kinderGatenPosts[index].images[0],
                          educationLevel: reversedLevels[
                              kinderGatenPosts[index].educationLevel]!,
                          location: kinderGatenPosts[index].city,
                          numberOfWatcher: kinderGatenPosts[index].views,
                          numberOfBooks: kinderGatenPosts[index].numberOfBooks,
                          timeSince: kinderGatenPosts[index].createdAt,
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
                              categoryIndex: 1,
                              category: locale.primary,
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
                      final languageCode =
                          CacheHelper.getData(key: AppConstant.languageKey);
                      return Container(
                        margin: languageCode == 'ar'
                            ? EdgeInsets.only(right: 16.w)
                            : EdgeInsets.only(left: 16.w),
                        child: BuildPosts(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => CategoryDetailsScreen(
                                categoryIndex: 1,
                                postIndex: index,
                              ),
                            ),
                          ),
                          imageHeight: 160.h,
                          imageWidth: 150.w,
                          width: 150.w,
                          height: 283.h,
                          borderRadius: BorderRadius.zero,
                          title: primaryPosts[index].title,
                          description: primaryPosts[index].description,
                          price: primaryPosts[index].price,
                          image: primaryPosts[index].images[0],
                          educationLevel: reversedLevels[
                              primaryPosts[index].educationLevel]!,
                          location: primaryPosts[index].city,
                          numberOfWatcher: primaryPosts[index].views,
                          numberOfBooks: primaryPosts[index].numberOfBooks,
                          timeSince: primaryPosts[index].createdAt,
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
                        categoryIndex: 2,
                        category: locale.preparatory,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 283.h,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: preparatoryPosts.length,
                    itemBuilder: (context, index) {
                      final languageCode =
                          CacheHelper.getData(key: AppConstant.languageKey);
                      return Container(
                        margin: languageCode == 'ar'
                            ? EdgeInsets.only(right: 16.w)
                            : EdgeInsets.only(left: 16.w),
                        child: BuildPosts(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => CategoryDetailsScreen(
                                categoryIndex: 2,
                                postIndex: index,
                              ),
                            ),
                          ),
                          imageHeight: 160.h,
                          imageWidth: 150.w,
                          width: 150.w,
                          height: 283.h,
                          borderRadius: BorderRadius.zero,
                          title: preparatoryPosts[index].title,
                          description: preparatoryPosts[index].description,
                          price: preparatoryPosts[index].price,
                          image: preparatoryPosts[index].images[0],
                          educationLevel: reversedLevels[
                              preparatoryPosts[index].educationLevel]!,
                          location: preparatoryPosts[index].city,
                          numberOfWatcher: preparatoryPosts[index].views,
                          numberOfBooks: preparatoryPosts[index].numberOfBooks,
                          timeSince: preparatoryPosts[index].createdAt,
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
                              categoryIndex: 3,
                              category: locale.secondary,
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
                      final languageCode =
                          CacheHelper.getData(key: AppConstant.languageKey);
                      return Container(
                        margin: languageCode == 'ar'
                            ? EdgeInsets.only(right: 16.w)
                            : EdgeInsets.only(left: 16.w),
                        child: BuildPosts(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => CategoryDetailsScreen(
                                      categoryIndex: 3,
                                      postIndex: index,
                                    )),
                          ),
                          imageHeight: 160.h,
                          imageWidth: 150.w,
                          width: 150.w,
                          height: 283.h,
                          borderRadius: BorderRadius.zero,
                          title: secondaryPosts[index].title,
                          description: secondaryPosts[index].description,
                          price: secondaryPosts[index].price,
                          image: secondaryPosts[index].images[0],
                          educationLevel: reversedLevels[
                              secondaryPosts[index].educationLevel]!,
                          location: secondaryPosts[index].city,
                          numberOfWatcher: secondaryPosts[index].views,
                          numberOfBooks: secondaryPosts[index].numberOfBooks,
                          timeSince: secondaryPosts[index].createdAt,
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
                              categoryIndex: 4,
                              category: locale.general,
                            )),
                  ),
                ),
                SizedBox(
                  height: 283.h,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: generalPosts.length,
                    itemBuilder: (context, index) {
                      final languageCode =
                          CacheHelper.getData(key: AppConstant.languageKey);
                      return Container(
                        margin: languageCode == 'ar'
                            ? EdgeInsets.only(right: 16.w)
                            : EdgeInsets.only(left: 16.w),
                        child: BuildPosts(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => CategoryDetailsScreen(
                                      categoryIndex: 4,
                                      postIndex: index,
                                    )),
                          ),
                          imageHeight: 160.h,
                          imageWidth: 150.w,
                          width: 150.w,
                          height: 283.h,
                          borderRadius: BorderRadius.zero,
                          title: generalPosts[index].title,
                          description: generalPosts[index].description,
                          price: generalPosts[index].price,
                          image: generalPosts[index].images[0],
                          educationLevel: reversedLevels[
                              generalPosts[index].educationLevel]!,
                          location: generalPosts[index].city,
                          numberOfWatcher: generalPosts[index].views,
                          numberOfBooks: generalPosts[index].numberOfBooks,
                          timeSince: generalPosts[index].createdAt,
                          cardElevation: 0,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
