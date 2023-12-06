import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
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

import '../../shared/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final w = MediaQuery
        .of(context)
        .size
        .width;
    final h = MediaQuery
        .of(context)
        .size
        .height;

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
                hintStyle: Theme
                    .of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(
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
              final model = homeCubit.postModel;
              return ConditionalBuilder(
                builder: (context) {
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
                          title: model!.result![0].educationLevel!,
                          numberOfBooks: model.result![0].posts!.length,
                          onTap: () =>
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) =>
                                    const CategoryBooksScreen(
                                      indexCategory: 0,
                                    )),
                              ),
                        ),
                        SizedBox(
                          height: 283.h,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: model.result![0].posts!.length,
                            itemBuilder: (context, index) {
                              final languageCode =
                              CacheHelper.getData(key: AppConstant.languageKey);
                              return Container(
                                margin: languageCode == 'ar'
                                    ? EdgeInsets.only(right: 16.w)
                                    : EdgeInsets.only(left: 16.w),
                                child: BuildPosts(
                                  onTap: () =>
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (ctx) =>
                                              CategoryDetailsScreen(
                                                index: 0,
                                                indexCategory: index,
                                              ),
                                        ),
                                      ),
                                  imageHeight: 150.h,
                                  imageWidth: 151.w,
                                  width: 150.w,
                                  height: 283.h,
                                  borderRadius: BorderRadius.zero,
                                  title: model.result![0].posts![index].title!,
                                  description: model.result![0].posts![index]
                                      .description!,
                                  price: model.result![0].posts![index].price!,
                                  image: model.result![0].posts![index]
                                      .images![0],
                                  educationLevel: model.result![0]
                                      .educationLevel!,
                                  location: model.result![0].posts![index]
                                      .location!,
                                  numberOfWatcher: model.result![0]
                                      .posts![index].views!,
                                  numberOfBooks:
                                  model.result![0].posts![index].numberOfBooks!,
                                  cardElevation: 0,
                                ),
                              );
                            },
                          ),
                        ),
                        BuildRowAboveCard(
                          title: model.result![1].educationLevel!,
                          numberOfBooks: model.result![1].posts!.length,
                          onTap: () =>
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) =>
                                    const CategoryBooksScreen(
                                      indexCategory: 1,
                                    )),
                              ),
                        ),
                        SizedBox(
                          height: 283.h,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: model.result![1].posts!.length,
                            itemBuilder: (context, index) {
                              final languageCode =
                              CacheHelper.getData(key: AppConstant.languageKey);
                              return Container(
                                margin: languageCode == 'ar'
                                    ? EdgeInsets.only(right: 16.w)
                                    : EdgeInsets.only(left: 16.w),
                                child: BuildPosts(
                                  onTap: () =>
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (ctx) =>
                                              CategoryDetailsScreen(
                                                index: 1,
                                                indexCategory: index,
                                              ),
                                        ),
                                      ),
                                  imageHeight: 150.h,
                                  imageWidth: 151.w,
                                  width: 150.w,
                                  height: 283.h,
                                  borderRadius: BorderRadius.zero,
                                  title: model.result![1].posts![index].title!,
                                  description: model.result![1].posts![index]
                                      .description!,
                                  price: model.result![1].posts![index].price!,
                                  image: model.result![1].posts![index]
                                      .images![0],
                                  educationLevel: model.result![1]
                                      .educationLevel!,
                                  location: model.result![1].posts![index]
                                      .location!,
                                  numberOfWatcher: model.result![1]
                                      .posts![index].views!,
                                  numberOfBooks:
                                  model.result![1].posts![index].numberOfBooks!,
                                  cardElevation: 0,
                                ),
                              );
                            },
                          ),
                        ),
                        BuildRowAboveCard(
                          title: model.result![2].educationLevel!,
                          numberOfBooks: model.result![2].posts!.length,
                          onTap: () =>
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) =>
                                    const CategoryBooksScreen(
                                      indexCategory: 2,
                                    )),
                              ),
                        ),
                        SizedBox(
                          height: 283.h,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: model.result![2].posts!.length,
                            itemBuilder: (context, index) {
                              final languageCode =
                              CacheHelper.getData(key: AppConstant.languageKey);
                              return Container(
                                margin: languageCode == 'ar'
                                    ? EdgeInsets.only(right: 16.w)
                                    : EdgeInsets.only(left: 16.w),
                                child: BuildPosts(
                                  onTap: () =>
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (ctx) =>
                                              CategoryDetailsScreen(
                                                index: 2,
                                                indexCategory: index,
                                              ),
                                        ),
                                      ),
                                  imageHeight: 150.h,
                                  imageWidth: 151.w,
                                  width: 150.w,
                                  height: 283.h,
                                  borderRadius: BorderRadius.zero,
                                  title: model.result![2].posts![index].title!,
                                  description: model.result![2].posts![index]
                                      .description!,
                                  price: model.result![2].posts![index].price!,
                                  image: model.result![2].posts![index]
                                      .images![0],
                                  educationLevel: model.result![2]
                                      .educationLevel!,
                                  location: model.result![2].posts![index]
                                      .location!,
                                  numberOfWatcher: model.result![2]
                                      .posts![index].views!,
                                  numberOfBooks:
                                  model.result![2].posts![index].numberOfBooks!,
                                  cardElevation: 0,
                                ),
                              );
                            },
                          ),
                        ),
                        BuildRowAboveCard(
                          title: model.result![3].educationLevel!,
                          numberOfBooks: model.result![3].posts!.length,
                          onTap: () =>
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) =>
                                    const CategoryBooksScreen(
                                      indexCategory: 3,
                                    )),
                              ),
                        ),
                        SizedBox(
                          height: 283.h,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: model.result![3].posts!.length,
                            itemBuilder: (context, index) {
                              final languageCode =
                              CacheHelper.getData(key: AppConstant.languageKey);
                              return Container(
                                margin: languageCode == 'ar'
                                    ? EdgeInsets.only(right: 16.w)
                                    : EdgeInsets.only(left: 16.w),
                                child: BuildPosts(
                                  onTap: () =>
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (ctx) =>
                                              CategoryDetailsScreen(
                                                index: 3,
                                                indexCategory: index,
                                              ),
                                        ),
                                      ),
                                  imageHeight: 150.h,
                                  imageWidth: 151.w,
                                  width: 150.w,
                                  height: 283.h,
                                  borderRadius: BorderRadius.zero,
                                  title: model.result![3].posts![index].title!,
                                  description: model.result![3].posts![index]
                                      .description!,
                                  price: model.result![3].posts![index].price!,
                                  image: model.result![3].posts![index]
                                      .images![0],
                                  educationLevel: model.result![3]
                                      .educationLevel!,
                                  location: model.result![3].posts![index]
                                      .location!,
                                  numberOfWatcher: model.result![3]
                                      .posts![index].views!,
                                  numberOfBooks:
                                  model.result![3].posts![index].numberOfBooks!,
                                  cardElevation: 0,
                                ),
                              );
                            },
                          ),
                        ),
                        BuildRowAboveCard(
                          title: model.result![4].educationLevel!,
                          numberOfBooks: model.result![4].posts!.length,
                          onTap: () =>
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) =>
                                    const CategoryBooksScreen(
                                      indexCategory: 4,
                                    )),
                              ),
                        ),
                        SizedBox(
                          height: 283.h,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: model.result![4].posts!.length,
                            itemBuilder: (context, index) {
                              final languageCode =
                              CacheHelper.getData(key: AppConstant.languageKey);
                              return Container(
                                margin: languageCode == 'ar'
                                    ? EdgeInsets.only(right: 16.w)
                                    : EdgeInsets.only(left: 16.w),
                                child: BuildPosts(
                                  onTap: () =>
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (ctx) =>
                                              CategoryDetailsScreen(
                                                index: 4,
                                                indexCategory: index,
                                              ),
                                        ),
                                      ),
                                  imageHeight: 150.h,
                                  imageWidth: 151.w,
                                  width: 150.w,
                                  height: 283.h,
                                  borderRadius: BorderRadius.zero,
                                  title: model.result![4].posts![index].title!,
                                  description: model.result![4].posts![index]
                                      .description!,
                                  price: model.result![4].posts![index].price!,
                                  image: model.result![4].posts![index]
                                      .images![0],
                                  educationLevel: model.result![4]
                                      .educationLevel!,
                                  location: model.result![4].posts![index]
                                      .location!,
                                  numberOfWatcher: model.result![4]
                                      .posts![index].views!,
                                  numberOfBooks:
                                  model.result![4].posts![index].numberOfBooks!,
                                  cardElevation: 0,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
                fallback: (context) {
                  return const Center(child: CircularProgressIndicator(
                    strokeWidth: 10,
                    color: ColorConstant.primaryColor,));
                },
                condition: model!=null,
              );
            }));
  }
}
