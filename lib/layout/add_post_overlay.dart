import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/add_post/add_post_cubit.dart';
import 'package:kotobekia/controller/add_post/add_post_states.dart';
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

    return BlocConsumer<AddPostCubit, AddPostStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final addPostCubit = AddPostCubit.get(context);

        return Container(
          color: ColorConstant.backgroundColor,
          child: ListView(
            padding: EdgeInsets.only(top: 50.h, right: 16.w, left: 16.w),
            physics: const BouncingScrollPhysics(),
            children: [
              GestureDetector(
                onTap: () {
                  addPostCubit.pickImages(context);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: ColorConstant.mutedColor),
                    color: ColorConstant.lightGreyColor,
                  ),
                  child: addPostCubit.selectedImages.isNotEmpty
                      ? Wrap(
                          clipBehavior: Clip.hardEdge,
                          alignment: WrapAlignment.center,
                          children: List.generate(
                            addPostCubit.selectedImages.length,
                            (index) => Container(
                              width: MediaQuery.of(context).size.width / 2.6,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 6.w, vertical: 6.h),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14)),
                              child: Image.file(
                                addPostCubit.selectedImages[index],
                                fit: BoxFit.cover,
                                width: 100.w,
                                height: 100.h,
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
                        items: addPostCubit.regionsDropDownItem.map((region) {
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
                            addPostCubit.changeRegion(value);
                          }
                        },
                        onSaved: (value) {
                          if (value != null) {
                            addPostCubit.changeRegion(value);
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
                          addPostCubit.changeTitle(value!);
                        },
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              value.trim().length < 5) {
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
                          addPostCubit.changeDescription(value!);
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
                            addPostCubit.changePrice(value!);
                          },
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty ||
                                value.trim().length > 3 ||
                                int.parse(value) > 400) {
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
                            addPostCubit.changeBooksCount(value!);
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
                      dropDownValue: addPostCubit.educationLevel,
                      items: addPostCubit.educationLevelsDropDownItems,
                      text: locale.education_level,
                      onSelect: (value) {
                        if (value != null) {
                          // enteredEducationLevel = value;
                          addPostCubit.changeEducationLevel(value);
                        }
                      },
                      onSave: (value) {
                        if (value != null) {
                          // enteredEducationLevel = value;
                          addPostCubit.changeEducationLevel(value);
                        }
                      },
                    ),
                    BuildDropDownButton(
                      dropDownValue: addPostCubit.modifiedGradeDropDownItems[2],
                      items: addPostCubit.educationLevel == 'إبتدائي'
                          ? addPostCubit.modifiedGradeDropDownItems
                          : addPostCubit.gradeDropDownItems,
                      text: locale.grade,
                      onSelect: (value) {},
                      onSave: (value) {
                        if (value != null) {
                          addPostCubit.changeGrade(value);
                        }
                      },
                    ),
                    BuildDropDownButton(
                      dropDownValue: addPostCubit.educationTypeDropDownItems[0],
                      items: addPostCubit.educationTypeDropDownItems,
                      text: locale.education_type,
                      onSelect: (value) {
                        addPostCubit.changeEducationType(value!);
                      },
                      onSave: (value) {
                        addPostCubit.changeEducationType(value!);
                      },
                    ),
                    BuildDropDownButton(
                      dropDownValue: addPostCubit.termDropDownItems[0],
                      items: addPostCubit.termDropDownItems,
                      text: locale.term,
                      onSelect: (value) {
                        addPostCubit.changeSemester(value!);
                      },
                      onSave: (value) {
                        addPostCubit.changeSemester(value!);
                      },
                    ),
                    BuildDropDownButton(
                      dropDownValue: addPostCubit.yearsDropDownItems[1],
                      items: addPostCubit.yearsDropDownItems,
                      text: locale.education_year,
                      onSelect: (value) {
                        addPostCubit.changeBookEdition(value!);
                      },
                      onSave: (value) {
                        addPostCubit.changeBookEdition(value!);
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
                child: addPostCubit.locationImageUrl != null
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
              addPostCubit.isAddingPost
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
                            addPostCubit: addPostCubit,
                            context: context,
                            title: addPostCubit.enteredTitle,
                            description: addPostCubit.enteredDescription,
                            price: addPostCubit.enteredPrice,
                            educationLevel: addPostCubit.educationLevel,
                            educationType: addPostCubit.enteredEducationType,
                            grade: addPostCubit.enteredGrade,
                            region: addPostCubit.enteredRegion,
                            semester: addPostCubit.enteredSemester,
                            bookEdition: addPostCubit.enteredBookEdition,
                            booksCount: addPostCubit.enteredBooksCount,
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
    required AddPostCubit addPostCubit,
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
    if (addPostCubit.selectedImages.isEmpty) {
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
      print('title $title');
      print('description $description');
      print('grade $grade');
      print('educationlevel $educationLevel');
      print('semester $semester');
      print('educationtype $educationType');
      print('booksCount $booksCount');
      print('region $region');
      print('price $price');
      print('bookedition $bookEdition');

      addPostCubit.sendNewPost(
        title: title,
        description: description,
        price: price,
        educationLevel: levels[educationLevel]!,
        educationType: educationType,
        grade: grade,
        cityLocation: region,
        semester: semester,
        images: addPostCubit.selectedImages,
        bookEdition: bookEdition,
        numberOfBooks: booksCount,
      );
      Navigator.pop(context);
    }
  }
}
