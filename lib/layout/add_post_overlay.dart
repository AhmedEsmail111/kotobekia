import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/home/home_cubit.dart';
import 'package:kotobekia/controller/home/home_state.dart';
import 'package:kotobekia/layout/drop_down_button.dart';
import 'package:kotobekia/models/post_model/post_model.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

final formKey = GlobalKey<FormState>();

class BuildAddPostOverlay extends StatelessWidget {
  const BuildAddPostOverlay({super.key});
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    // vars to collect the entered data by the user
    var enteredTitle = '';

    var enteredDescription = '';

    var enteredPrice = '';

    var enteredRegion = '';

    var enteredEducationLevel = '';

    var enteredGrade = '';

    var enteredEducationType = '';

    var enteredSemester = '';

    var enteredBookEdition = '';

    var enteredBooksCount = '';
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final homeCubit = HomeCubit.get(context);

        return Container(
          color: ColorConstant.backgroundColor,
          child: ListView(
            padding: EdgeInsets.only(top: 50.h, right: 16.w, left: 16.w),
            physics: const BouncingScrollPhysics(),
            children: [
              GestureDetector(
                onTap: () {
                  homeCubit.pickImages(context);
                },
                child: Container(
                  height: 75.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: ColorConstant.mutedColor),
                    color: ColorConstant.lightGreyColor,
                  ),
                  child: homeCubit.selectedImages.isNotEmpty
                      ? ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            homeCubit.selectedImages.length,
                            (index) => Container(
                              width: MediaQuery.of(context).size.width / 5,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorConstant.mutedColor),
                                  borderRadius: BorderRadius.circular(14)),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 2.w, vertical: 2.h),
                              child: Image.file(
                                homeCubit.selectedImages[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              SolarIconsOutline.uploadMinimalistic,
                              color: ColorConstant.primaryColor,
                              size: 30.h,
                            ),
                            Text(
                              locale!.upload_images,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ],
                        ),
                ),
              ),
              Text(
                locale!.maximum_images,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp,
                      color: ColorConstant.overGreyColor,
                    ),
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: DropdownButtonFormField(
                        menuMaxHeight: 300.h,
                        icon: Icon(
                          SolarIconsOutline.altArrowDown,
                          size: 16.h,
                          color: ColorConstant.iconColor,
                        ),
                        decoration: InputDecoration(
                          fillColor: ColorConstant.whiteColor,
                          filled: true,
                          border: InputBorder.none,
                          hintText: locale.your_city,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.w500),
                          prefixIcon: Icon(
                            SolarIconsOutline.mapPoint,
                            size: 16.h,
                            color: ColorConstant.iconColor,
                          ),
                        ),
                        items: homeCubit.regionsDropDownItem.map((region) {
                          return DropdownMenuItem(
                            value: region,
                            child: Container(
                              height: 50,
                              alignment: Alignment.topCenter,
                              child: RichText(
                                text: TextSpan(
                                  text: region,
                                  style: DefaultTextStyle.of(context).style,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            enteredRegion = value;
                          }
                        },
                        onSaved: (value) {
                          if (value != null) {
                            enteredRegion = value;
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'من فضلك اختر المافظة التابع لها';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      locale.post_title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: TextFormField(
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.w500),
                        maxLines: 1,
                        // maxLength: 30,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'مجموعة كتب الأضواء',
                          hintStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: ColorConstant.extraGreyColor,
                                  ),
                          border: InputBorder.none,
                          fillColor: ColorConstant.whiteColor,
                          filled: true,
                        ),
                        onSaved: (value) {
                          enteredTitle = value!;
                        },
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              value.trim().length < 12) {
                            return 'من فضلك أدخل عنوان صحيح';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      locale.post_description,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: TextFormField(
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.w500),
                        maxLines: 3,
                        // maxLength: 120,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintMaxLines: 3,
                          hintText:
                              '5 كتب عبارة عن كتاب العربي وكتاب الإنجليزي والتاريخ والجغرافيا والفلسفة',
                          hintStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: ColorConstant.extraGreyColor,
                                  ),
                          border: InputBorder.none,
                          fillColor: ColorConstant.whiteColor,
                          filled: true,
                        ),
                        onSaved: (value) {
                          enteredDescription = value!;
                        },
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              value.trim().length < 12) {
                            return 'من فضلك أدخل وصف صحيح';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      locale.price,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.8,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: TextFormField(
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            fillColor: ColorConstant.whiteColor,
                            filled: true,
                          ),
                          onSaved: (value) {
                            enteredPrice = value!;
                          },
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty ||
                                value.trim().length > 3 ||
                                int.parse(value) > 500) {
                              return ' أدخل سعر مناسب';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Text(
                      locale.advice_for_price,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontSize: 13.sp),
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      locale.books_count,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.8,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: TextFormField(
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            fillColor: ColorConstant.whiteColor,
                            filled: true,
                          ),
                          maxLines: 1,
                          onSaved: (value) {
                            enteredBooksCount = value!;
                          },
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty ||
                                value.trim().length > 2) {
                              return 'أدخل عدد الكتب';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    BuildDropDownButton(
                      dropDownValue: homeCubit.educationLevelsDropDownItems[3],
                      items: homeCubit.educationLevelsDropDownItems,
                      text: locale.education_level,
                      onSelect: (value) {
                        if (value != null) {
                          enteredEducationLevel = value;
                          homeCubit.changeEducationLevel(value);
                        }
                      },
                      onSave: (value) {
                        enteredEducationLevel = value!;
                      },
                    ),
                    BuildDropDownButton(
                      dropDownValue: homeCubit.educationLevel == 'إبتدائي'
                          ? homeCubit.modifiedGradeDropDownItems[2]
                          : homeCubit.gradeDropDownItems[2],
                      items: homeCubit.educationLevel == 'إبتدائي'
                          ? homeCubit.modifiedGradeDropDownItems
                          : homeCubit.gradeDropDownItems,
                      text: locale.grade,
                      onSelect: (value) {},
                      onSave: (value) {
                        enteredGrade = value!;
                      },
                    ),
                    BuildDropDownButton(
                      dropDownValue: homeCubit.educationTypeDropDownItems[0],
                      items: homeCubit.educationTypeDropDownItems,
                      text: locale.education_type,
                      onSelect: (value) {},
                      onSave: (value) {
                        enteredEducationType = value!;
                      },
                    ),
                    BuildDropDownButton(
                      dropDownValue: homeCubit.termDropDownItems[0],
                      items: homeCubit.termDropDownItems,
                      text: locale.term,
                      onSelect: (value) {},
                      onSave: (value) {
                        enteredSemester = value!;
                      },
                    ),
                    BuildDropDownButton(
                      dropDownValue: homeCubit.yearsDropDownItems[1],
                      items: homeCubit.yearsDropDownItems,
                      text: locale.education_year,
                      onSelect: (value) {},
                      onSave: (value) {
                        enteredBookEdition = value!;
                      },
                    )
                  ],
                ),
              ),
              Text(
                locale.location_on_map,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 8.h),
                decoration: BoxDecoration(
                  color: ColorConstant.whiteColor,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: const Color(0xFFC8C5C5),
                  ),
                ),
                height: 147.h,
                width: double.infinity,
                child: homeCubit.locationImageUrl != null
                    ? Image.network('src')
                    : Icon(
                        SolarIconsOutline.mapPoint,
                        size: 40.h,
                        color: ColorConstant.secondaryColor,
                      ),
              ),
              SizedBox(
                height: 10.h,
              ),
              homeCubit.isAddingPost
                  ? const CircularProgressIndicator(
                      color: ColorConstant.primaryColor,
                    )
                  : Container(
                      clipBehavior: Clip.hardEdge,
                      margin: EdgeInsets.only(bottom: 10.h),
                      height: 45.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstant.primaryColor,
                        ),
                        onPressed: () {
                          submit(
                            homeCubit: homeCubit,
                            context: context,
                            title: enteredTitle,
                            description: enteredDescription,
                            price: enteredPrice,
                            educationLevel: enteredEducationLevel,
                            educationType: enteredEducationType,
                            grade: enteredGrade,
                            region: enteredRegion,
                            semester: enteredSemester,
                            bookEdition: enteredBookEdition,
                            booksCount: enteredBooksCount,
                          );
                        },
                        child: Text(
                          locale.submit,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: ColorConstant.whiteColor),
                        ),
                      ),
                    )
            ],
          ),
        );
      },
    );
  }

  void submit({
    required HomeCubit homeCubit,
    required BuildContext context,
    required String title,
    required String description,
    required String price,
    required String educationLevel,
    required String educationType,
    required String grade,
    required String region,
    required String semester,
    required String bookEdition,
    required String booksCount,
  }) {
    print(homeCubit.isAddingPost);
    if (homeCubit.selectedImages.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'من فضلك قم بإختيار  صور الإعلان',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      homeCubit.sendNewPost(
        title: title,
        description: description,
        price: price,
        educationLevel: levels[educationLevel]!,
        educationType: educationType,
        grade: grade,
        location: region,
        semester: semester,
        images: homeCubit.selectedImages,
        bookEdition: bookEdition,
        numberOfBooks: booksCount,
      );
      Navigator.pop(context);
    }
  }
}
