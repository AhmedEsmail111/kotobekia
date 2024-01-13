import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/category_details/category_details_cubit.dart';
import 'package:kotobekia/controller/category_details/category_details_states.dart';
import 'package:kotobekia/models/post_model/post_model.dart';
import 'package:kotobekia/modules/category_details/contact_card.dart';
import 'package:kotobekia/modules/category_details/details_card.dart';
import 'package:kotobekia/modules/category_details/important_info_flag.dart';
import 'package:kotobekia/shared/component/back_button.dart';
import 'package:kotobekia/shared/component/fave_icon.dart';
import 'package:kotobekia/shared/component/home/add_section.dart';
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:kotobekia/shared/network/local/local.dart';
import 'package:kotobekia/shared/styles/colors.dart';

import 'interaction_card.dart';
import 'row_details.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    this.postType,
    required this.price,
    required this.grade,
    required this.bookEdition,
    required this.educationLevel,
    this.postStatus,
    required this.views,
    required this.feedback,
    required this.numberOfBooks,
    required this.semester,
    required this.educationType,
    required this.location,
    required this.city,
    this.identificationNumber,
    required this.createdAt,
    this.updatedAt,
    required this.postId,
    required this.user,
  });
  // final int postIndex;
  // final int categoryIndex;
  final String id;
  final String title;
  final String description;
  final List<String> images;
  final String? postType;
  final int price;
  final String grade;
  final String bookEdition;
  final String educationLevel;
  final String? postStatus;
  final int views;
  final String feedback;
  final int numberOfBooks;
  final String semester;
  final String educationType;
  final String location;
  final String city;
  final String? identificationNumber;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int postId;
  final CreatedBy user;
  @override
  Widget build(BuildContext context) {
    print(CacheHelper.getData(key: AppConstant.userId));
    final locale = AppLocalizations.of(context);
    bool? isFavorite;
    //  to show returned education level based on the user's locale
    final reversEducationLevels = {
      '655b4ec133dd362ae53081f7': locale!.kindergarten,
      '655b4ecd33dd362ae53081f9': locale.primary,
      '655b4ee433dd362ae53081fb': locale.preparatory,
      '655b4efb33dd362ae53081fd': locale.secondary,
      '655b4f0a33dd362ae53081ff': locale.general,
    };

    //  to show returned grade based on the user's locale
    final reversedGrades = {
      'grade_one': locale.grade_one,
      'grade_two': locale.grade_two,
      'grade_three': locale.grade_three,
      'grade_four': locale.grade_four,
      'grade_five': locale.grade_five,
      'grade_six': locale.grade_six,
    };
    //  to show returned semester based on the user's locale
    final reversedSemesters = {
      'first': locale.first,
      'second': locale.second,
      'both': locale.both,
    };
//  to show returned education type based on the user's locale
    final reversedEducationType = {
      'general': locale.general_type,
      'azhar': locale.azhar,
      'other': locale.any_type,
    };

    return BlocConsumer<CategoryDetailsCubit, CategoryDetailsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final categoryDetailsCubit = CategoryDetailsCubit.get(context);
        return Scaffold(
          backgroundColor: ColorConstant.backgroundColor,
          appBar: AppBar(
              leading: const BuildBackButton(
                hasBackground: false,
              ),
              title: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              )),
          body: SingleChildScrollView(
            // physics: const BouncingScrollPhysics(),
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
                        height: 50.h,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFD7D7D8).withOpacity(0.5)),
                          margin: EdgeInsets.all(8.w),
                          height: 30.h,
                          alignment: Alignment.center,
                          child: Text(
                            '${images.length} ${locale.images}',
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
                        child: BuildFaveIcon(
                          id: id,
                          hasBackBackground: true,
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
                    itemCount: images.length,
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
                      description: description,
                      cityLocation: city,
                      price: price,
                      timeSince: createdAt,
                      title: title,
                    ),
                    const Positioned(child: BuildImportantInfoFlag())
                  ],
                ),
                BuildRowDetails(
                  isLast: false,
                  isFirst: true,
                  firstText: locale.education_level,
                  secondText: reversEducationLevels[educationLevel]!,
                ),
                BuildRowDetails(
                  isLast: false,
                  firstText: locale.grade,
                  secondText: reversedGrades[grade] ?? '',
                ),
                BuildRowDetails(
                  isLast: false,
                  firstText: locale.education_type,
                  secondText: reversedEducationType[educationType] ?? '',
                ),
                BuildRowDetails(
                  isLast: false,
                  firstText: locale.education_year,
                  secondText: bookEdition,
                ),
                BuildRowDetails(
                  firstText: locale.term,
                  secondText: reversedSemesters[semester] ?? '',
                ),
                SizedBox(
                  height: 4.h,
                ),
                BuildInteractionCard(
                  postId: id,
                  userId: user.id,
                  feedback: feedback,
                ),
                if (user.id != CacheHelper.getData(key: AppConstant.userId))
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: BuildContactCard(name: user.fullName),
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
