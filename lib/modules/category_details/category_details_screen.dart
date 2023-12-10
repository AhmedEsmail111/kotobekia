import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/home/home_cubit.dart';
import 'package:kotobekia/controller/home/home_state.dart';
import 'package:kotobekia/models/post_model/post_model.dart';
import 'package:kotobekia/modules/category_details/contact_card.dart';
import 'package:kotobekia/modules/category_details/details_card.dart';
import 'package:kotobekia/modules/category_details/important_info_flag.dart';
import 'package:kotobekia/shared/component/back_button.dart';
import 'package:kotobekia/shared/component/home/add_section.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

import 'interaction_card.dart';
import 'row_details.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({
    super.key,
    required this.postIndex,
    required this.categoryIndex,
  });
  final int postIndex;
  final int categoryIndex;
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (ctx, state) {},
      builder: (ctx, state) {
        final homeCubit = HomeCubit.get(context);
        final homePostsModel = homeCubit.homePostsModel;
        final postDetails = Post(
          title: homePostsModel!.result[categoryIndex].posts[postIndex].title,
          images: homePostsModel.result[categoryIndex].posts[postIndex].images,
          price: homePostsModel.result[categoryIndex].posts[postIndex].price,
          grade: homePostsModel.result[categoryIndex].posts[postIndex].grade,
          educationLevel: homePostsModel
              .result[categoryIndex].posts[postIndex].educationLevel,
          location:
              homePostsModel.result[categoryIndex].posts[postIndex].location,
          numberOfBooks: homePostsModel
              .result[categoryIndex].posts[postIndex].numberOfBooks,
          views: homePostsModel.result[categoryIndex].posts[postIndex].views,
          description:
              homePostsModel.result[categoryIndex].posts[postIndex].description,
          createdAt:
              homePostsModel.result[categoryIndex].posts[postIndex].createdAt,
          educationType: homePostsModel
              .result[categoryIndex].posts[postIndex].educationType,
          bookEdition:
              homePostsModel.result[categoryIndex].posts[postIndex].bookEdition,
          semester:
              homePostsModel.result[categoryIndex].posts[postIndex].semester,
          id: homePostsModel.result[categoryIndex].posts[postIndex].id,
          postId: homePostsModel.result[categoryIndex].posts[postIndex].postId,
          city: homePostsModel.result[categoryIndex].posts[postIndex].city,
        );
        return Scaffold(
          backgroundColor: ColorConstant.backgroundColor,
          appBar: AppBar(
              leading: const BuildBackButton(
                hasBackground: false,
              ),
              title: Text(
                postDetails.title,
                style: Theme.of(context).textTheme.bodyLarge,
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
                  height: 190.h,
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
                        height: 45.h,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFD7D7D8)
                              //  const Color.fromARGB(210, 243, 243, 239),
                              ),
                          margin: EdgeInsets.all(4.w),
                          width: 42.w,
                          height: 30.h,
                          alignment: Alignment.center,
                          child: Text(
                            '${postDetails.images.length} ${locale!.images}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14)),
                      width: 85.h,
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Image.network(
                        'https://www.cairo24.com/UploadCache/libfiles/109/8/600x338o/558.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    BuildCardDetails(
                      description: postDetails.description,
                      location: postDetails.city,
                      price: postDetails.price,
                      timeSince: postDetails.createdAt,
                      title: postDetails.title,
                    ),
                    const Positioned(child: BuildImportantInfoFlag())
                  ],
                ),
                BuildRowDetails(
                  isLast: false,
                  isFirst: true,
                  firstText: locale.education_level,
                  secondText: reversedLevels[postDetails.educationLevel]!,
                ),
                BuildRowDetails(
                  isLast: false,
                  firstText: locale.grade,
                  secondText: postDetails.grade,
                ),
                BuildRowDetails(
                  isLast: false,
                  firstText: locale.education_type,
                  secondText: postDetails.educationType,
                ),
                BuildRowDetails(
                  isLast: false,
                  firstText: locale.education_year,
                  secondText: postDetails.bookEdition,
                ),
                BuildRowDetails(
                  firstText: locale.term,
                  secondText: postDetails.semester,
                ),
                SizedBox(
                  height: 4.h,
                ),
                BuildInteractionCard(
                  postIdUrl: postDetails.id,
                ),
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
      },
    );
  }
}
