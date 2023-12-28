import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/home/home_cubit.dart';
import 'package:kotobekia/controller/home/home_state.dart';
import 'package:kotobekia/modules/category_book/category_book_screen.dart';
import 'package:kotobekia/modules/category_details/category_details_screen.dart';
import 'package:kotobekia/shared/component/home/adds_section.dart';
import 'package:kotobekia/shared/component/home/card_to_posts.dart';
import 'package:kotobekia/shared/component/home/dignity_flag.dart';
import 'package:kotobekia/shared/component/home/row_above_card.dart';
import 'package:kotobekia/shared/component/home/search_container.dart';
import 'package:kotobekia/shared/component/home/text_placeholder.dart';
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:kotobekia/shared/network/local/local.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    if (HomeCubit.get(context).homePostsModel == null) {
      HomeCubit.get(context).getHomePosts(
          noInternet: locale.no_internet, weakInternet: locale.weak_internet);
    }

    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    // final r = w / 1.32;
    // print(r);
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Container(),
        ),
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(
          //     SolarIconsOutline.tuning_2,
          //     size: 19.w,
          //   ),
          // ),
          IconButton(
            padding: CacheHelper.getData(key: AppConstant.languageKey) == 'ar'
                ? EdgeInsets.only(left: 8.w)
                : EdgeInsets.only(right: 8.w),
            onPressed: () {},
            icon: Icon(
              SolarIconsOutline.bell,
              size: 19.w,
            ),
          ),
        ],
        title: const BuildSearchContainer(),
      ),
      body: BlocConsumer<HomeCubit, HomeStates>(
        listener: (ctx, state) {},
        builder: (ctx, state) {
          final homeCubit = HomeCubit.get(context);
          final homePostsModel = homeCubit.homePostsModel;
          final kinderGartenPosts = homeCubit.kindergartenPosts;
          final primaryPosts = homeCubit.primaryPosts;
          final preparatoryPosts = homeCubit.preparatoryPosts;
          final secondaryPosts = homeCubit.secondaryPosts;
          final generalPosts = homeCubit.generalPosts;

          return RefreshIndicator(
            color: ColorConstant.primaryColor,
            onRefresh: () async {
              await homeCubit.getHomePosts(
                noInternet: locale.no_internet,
                weakInternet: locale.weak_internet,
              );
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: state is GetHomeDataLoadingHomeState &&
                      homePostsModel == null
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height / 1.2,
                      width: double.infinity,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: ColorConstant.primaryColor,
                        ),
                      ),
                    )
                  : Column(
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
                          child: state is GetHomeDataInternetFailureHomeState &&
                                  kinderGartenPosts.isEmpty
                              ? BuildTextPlaceHolder(text: state.message)
                              : ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: kinderGartenPosts.length,
                                  itemBuilder: (context, index) {
                                    final languageCode = CacheHelper.getData(
                                        key: AppConstant.languageKey);
                                    return Container(
                                      margin: languageCode == 'ar'
                                          ? EdgeInsets.only(right: 16.w)
                                          : EdgeInsets.only(left: 16.w),
                                      child: BuildPosts(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (ctx) => CategoryDetailsScreen(
                                                id: kinderGartenPosts[index].id,
                                                title: kinderGartenPosts[index]
                                                    .title,
                                                description:
                                                    kinderGartenPosts[index]
                                                        .description,
                                                images: kinderGartenPosts[index]
                                                    .images,
                                                price: kinderGartenPosts[index]
                                                    .price,
                                                grade: kinderGartenPosts[index]
                                                    .grade,
                                                bookEdition:
                                                    kinderGartenPosts[index]
                                                        .bookEdition,
                                                educationLevel:
                                                    kinderGartenPosts[index]
                                                        .educationLevel,
                                                views: kinderGartenPosts[index]
                                                    .views,
                                                numberOfBooks:
                                                    kinderGartenPosts[index]
                                                        .numberOfBooks,
                                                semester: kinderGartenPosts[index]
                                                    .semester,
                                                educationType:
                                                    kinderGartenPosts[index]
                                                        .educationType,
                                                location: kinderGartenPosts[index]
                                                    .location,
                                                city: kinderGartenPosts[index].city,
                                                createdAt: kinderGartenPosts[index].createdAt,
                                                postId: kinderGartenPosts[index].postId,
                                                user: kinderGartenPosts[index].createdBy),
                                          ),
                                        ),
                                        imageHeight: 160.h,
                                        imageWidth: 150.w,
                                        width: 150.w,
                                        height: 283.h,
                                        borderRadius: BorderRadius.zero,
                                        id: kinderGartenPosts[index].id,
                                        title: kinderGartenPosts[index].title,
                                        description: kinderGartenPosts[index]
                                            .description,
                                        price: kinderGartenPosts[index].price,
                                        image:
                                            kinderGartenPosts[index].images[0],
                                        educationLevel: kinderGartenPosts[index]
                                            .educationLevel,
                                        cityLocation:
                                            kinderGartenPosts[index].city,
                                        numberOfWatcher:
                                            kinderGartenPosts[index].views,
                                        numberOfBooks: kinderGartenPosts[index]
                                            .numberOfBooks,
                                        timeSince:
                                            kinderGartenPosts[index].createdAt,
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
                          child: state is GetHomeDataInternetFailureHomeState &&
                                  primaryPosts.isEmpty
                              ? BuildTextPlaceHolder(text: state.message)
                              : ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: primaryPosts.length,
                                  itemBuilder: (context, index) {
                                    final languageCode = CacheHelper.getData(
                                        key: AppConstant.languageKey);

                                    return Container(
                                      margin: languageCode == 'ar'
                                          ? EdgeInsets.only(right: 16.w)
                                          : EdgeInsets.only(left: 16.w),
                                      child: BuildPosts(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (ctx) => CategoryDetailsScreen(
                                                id: primaryPosts[index].id,
                                                title:
                                                    primaryPosts[index].title,
                                                description: primaryPosts[index]
                                                    .description,
                                                images:
                                                    primaryPosts[index].images,
                                                price:
                                                    primaryPosts[index].price,
                                                grade:
                                                    primaryPosts[index].grade,
                                                bookEdition: primaryPosts[index]
                                                    .bookEdition,
                                                educationLevel:
                                                    primaryPosts[index]
                                                        .educationLevel,
                                                views:
                                                    primaryPosts[index].views,
                                                numberOfBooks: primaryPosts[index]
                                                    .numberOfBooks,
                                                semester: primaryPosts[index]
                                                    .semester,
                                                educationType:
                                                    primaryPosts[index]
                                                        .educationType,
                                                location: primaryPosts[index]
                                                    .location,
                                                city: primaryPosts[index].city,
                                                createdAt: primaryPosts[index]
                                                    .createdAt,
                                                postId:
                                                    primaryPosts[index].postId,
                                                user: primaryPosts[index]
                                                    .createdBy),
                                          ),
                                        ),
                                        imageHeight: 160.h,
                                        imageWidth: 150.w,
                                        width: 150.w,
                                        height: 283.h,
                                        borderRadius: BorderRadius.zero,
                                        id: primaryPosts[index].id,
                                        title: primaryPosts[index].title,
                                        description:
                                            primaryPosts[index].description,
                                        price: primaryPosts[index].price,
                                        image: primaryPosts[index].images[0],
                                        educationLevel:
                                            primaryPosts[index].educationLevel,
                                        cityLocation: primaryPosts[index].city,
                                        numberOfWatcher:
                                            primaryPosts[index].views,
                                        numberOfBooks:
                                            primaryPosts[index].numberOfBooks,
                                        timeSince:
                                            primaryPosts[index].createdAt,
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
                          child: state is GetHomeDataInternetFailureHomeState &&
                                  preparatoryPosts.isEmpty
                              ? BuildTextPlaceHolder(text: state.message)
                              : ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: preparatoryPosts.length,
                                  itemBuilder: (context, index) {
                                    final languageCode = CacheHelper.getData(
                                        key: AppConstant.languageKey);
                                    return Container(
                                      margin: languageCode == 'ar'
                                          ? EdgeInsets.only(right: 16.w)
                                          : EdgeInsets.only(left: 16.w),
                                      child: BuildPosts(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (ctx) =>
                                                CategoryDetailsScreen(
                                              id: preparatoryPosts[index].id,
                                              title:
                                                  preparatoryPosts[index].title,
                                              description:
                                                  preparatoryPosts[index]
                                                      .description,
                                              images: preparatoryPosts[index]
                                                  .images,
                                              price:
                                                  preparatoryPosts[index].price,
                                              grade:
                                                  preparatoryPosts[index].grade,
                                              bookEdition:
                                                  preparatoryPosts[index]
                                                      .bookEdition,
                                              educationLevel:
                                                  preparatoryPosts[index]
                                                      .educationLevel,
                                              views:
                                                  preparatoryPosts[index].views,
                                              numberOfBooks:
                                                  preparatoryPosts[index]
                                                      .numberOfBooks,
                                              semester: preparatoryPosts[index]
                                                  .semester,
                                              educationType:
                                                  preparatoryPosts[index]
                                                      .educationType,
                                              location: preparatoryPosts[index]
                                                  .location,
                                              city:
                                                  preparatoryPosts[index].city,
                                              createdAt: preparatoryPosts[index]
                                                  .createdAt,
                                              postId: preparatoryPosts[index]
                                                  .postId,
                                              user: preparatoryPosts[index]
                                                  .createdBy,
                                            ),
                                          ),
                                        ),
                                        imageHeight: 160.h,
                                        imageWidth: 150.w,
                                        width: 150.w,
                                        height: 283.h,
                                        borderRadius: BorderRadius.zero,
                                        id: preparatoryPosts[index].id,
                                        title: preparatoryPosts[index].title,
                                        description:
                                            preparatoryPosts[index].description,
                                        price: preparatoryPosts[index].price,
                                        image:
                                            preparatoryPosts[index].images[0],
                                        educationLevel: preparatoryPosts[index]
                                            .educationLevel,
                                        cityLocation:
                                            preparatoryPosts[index].city,
                                        numberOfWatcher:
                                            preparatoryPosts[index].views,
                                        numberOfBooks: preparatoryPosts[index]
                                            .numberOfBooks,
                                        timeSince:
                                            preparatoryPosts[index].createdAt,
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
                          child: state is GetHomeDataInternetFailureHomeState &&
                                  secondaryPosts.isEmpty
                              ? BuildTextPlaceHolder(text: state.message)
                              : ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: secondaryPosts.length,
                                  itemBuilder: (context, index) {
                                    final languageCode = CacheHelper.getData(
                                        key: AppConstant.languageKey);
                                    return Container(
                                      margin: languageCode == 'ar'
                                          ? EdgeInsets.only(right: 16.w)
                                          : EdgeInsets.only(left: 16.w),
                                      child: BuildPosts(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (ctx) =>
                                                  CategoryDetailsScreen(
                                                    id: secondaryPosts[index]
                                                        .id,
                                                    title: secondaryPosts[index]
                                                        .title,
                                                    description:
                                                        secondaryPosts[index]
                                                            .description,
                                                    images:
                                                        secondaryPosts[index]
                                                            .images,
                                                    price: secondaryPosts[index]
                                                        .price,
                                                    grade: secondaryPosts[index]
                                                        .grade,
                                                    bookEdition:
                                                        secondaryPosts[index]
                                                            .bookEdition,
                                                    educationLevel:
                                                        secondaryPosts[index]
                                                            .educationLevel,
                                                    views: secondaryPosts[index]
                                                        .views,
                                                    numberOfBooks:
                                                        secondaryPosts[index]
                                                            .numberOfBooks,
                                                    semester:
                                                        secondaryPosts[index]
                                                            .semester,
                                                    educationType:
                                                        secondaryPosts[index]
                                                            .educationType,
                                                    location:
                                                        secondaryPosts[index]
                                                            .location,
                                                    createdAt:
                                                        secondaryPosts[index]
                                                            .createdAt,
                                                    postId:
                                                        secondaryPosts[index]
                                                            .postId,
                                                    city: secondaryPosts[index]
                                                        .city,
                                                    user: secondaryPosts[index]
                                                        .createdBy,
                                                  )),
                                        ),
                                        imageHeight: 160.h,
                                        imageWidth: 150.w,
                                        width: 150.w,
                                        height: 283.h,
                                        borderRadius: BorderRadius.zero,
                                        id: secondaryPosts[index].id,
                                        title: secondaryPosts[index].title,
                                        description:
                                            secondaryPosts[index].description,
                                        price: secondaryPosts[index].price,
                                        image: secondaryPosts[index].images[0],
                                        educationLevel: secondaryPosts[index]
                                            .educationLevel,
                                        cityLocation:
                                            secondaryPosts[index].city,
                                        numberOfWatcher:
                                            secondaryPosts[index].views,
                                        numberOfBooks:
                                            secondaryPosts[index].numberOfBooks,
                                        timeSince:
                                            secondaryPosts[index].createdAt,
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
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 283.h,
                          child: state is GetHomeDataInternetFailureHomeState &&
                                  generalPosts.isEmpty
                              ? BuildTextPlaceHolder(text: state.message)
                              : ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: generalPosts.length,
                                  itemBuilder: (context, index) {
                                    final languageCode = CacheHelper.getData(
                                        key: AppConstant.languageKey);
                                    return Container(
                                      margin: languageCode == 'ar'
                                          ? EdgeInsets.only(right: 16.w)
                                          : EdgeInsets.only(left: 16.w),
                                      child: BuildPosts(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (ctx) =>
                                                  CategoryDetailsScreen(
                                                    id: generalPosts[index].id,
                                                    title: generalPosts[index]
                                                        .title,
                                                    description:
                                                        generalPosts[index]
                                                            .description,
                                                    images: generalPosts[index]
                                                        .images,
                                                    price: generalPosts[index]
                                                        .price,
                                                    grade: generalPosts[index]
                                                        .grade,
                                                    bookEdition:
                                                        generalPosts[index]
                                                            .bookEdition,
                                                    educationLevel:
                                                        generalPosts[index]
                                                            .educationLevel,
                                                    views: generalPosts[index]
                                                        .views,
                                                    numberOfBooks:
                                                        generalPosts[index]
                                                            .numberOfBooks,
                                                    semester:
                                                        generalPosts[index]
                                                            .semester,
                                                    educationType:
                                                        generalPosts[index]
                                                            .educationType,
                                                    location:
                                                        generalPosts[index]
                                                            .location,
                                                    createdAt:
                                                        generalPosts[index]
                                                            .createdAt,
                                                    postId: generalPosts[index]
                                                        .postId,
                                                    city: generalPosts[index]
                                                        .city,
                                                    user: generalPosts[index]
                                                        .createdBy,
                                                  )),
                                        ),
                                        imageHeight: 160.h,
                                        imageWidth: 150.w,
                                        width: 150.w,
                                        height: 283.h,
                                        borderRadius: BorderRadius.zero,
                                        id: generalPosts[index].id,
                                        title: generalPosts[index].title,
                                        description:
                                            generalPosts[index].description,
                                        price: generalPosts[index].price,
                                        image: generalPosts[index].images[0],
                                        educationLevel:
                                            generalPosts[index].educationLevel,
                                        cityLocation: generalPosts[index].city,
                                        numberOfWatcher:
                                            generalPosts[index].views,
                                        numberOfBooks:
                                            generalPosts[index].numberOfBooks,
                                        timeSince:
                                            generalPosts[index].createdAt,
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
            ),
          );
        },
      ),
    );
  }
}
