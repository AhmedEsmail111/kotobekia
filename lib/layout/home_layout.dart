import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kotobekia/controller/home_layout_cubit/cubit.dart';
import 'package:kotobekia/controller/home_layout_cubit/states.dart';
import 'package:kotobekia/layout/drop_down_button.dart';
import 'package:kotobekia/models/post.dart';
import 'package:kotobekia/modules/main_page/main_categories_page.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});
  @override
  State<HomeLayout> createState() {
    return _HomeLayoutState();
  }
}

class _HomeLayoutState extends State<HomeLayout> {
  final formKey = GlobalKey<FormState>();
  //  a scaffold key to use in opening a modal bottom sheet
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // initialize an image picker object
  final imagePicker = ImagePicker();
// vars to collect the entered data by the user
  List<File> images = [];
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

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    final h = MediaQuery.of(context).size.height;

    final locale = AppLocalizations.of(context);

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final homeCubit = HomeCubit.get(context);

        return Scaffold(
          key: scaffoldKey,
          body: const MainCategoriesPage(),
          bottomNavigationBar: ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            child: BottomNavigationBar(
              elevation: 4,
              backgroundColor: whiteColor,
              currentIndex: homeCubit.currentIndex,
              onTap: (index) {
                homeCubit.changeBottomNavBarIndex(index);
              },
              selectedLabelStyle:
                  Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: w / 30,
                      ),
              unselectedLabelStyle:
                  Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: w / 30,
                      ),
              selectedItemColor: primaryColor,
              selectedIconTheme: Theme.of(context).iconTheme.copyWith(
                    color: primaryColor,
                  ),
              unselectedIconTheme: Theme.of(context).iconTheme,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  label: locale!.home,
                  icon: const Icon(
                    SolarIconsOutline.home,
                  ),
                ),
                BottomNavigationBarItem(
                  label: locale!.my_posts,
                  icon: const Icon(
                    SolarIconsOutline.widget_4,
                  ),
                ),
                BottomNavigationBarItem(
                  label: '',
                  icon: IconButton(
                    icon: Icon(
                      SolarIconsOutline.addSquare,
                      size: 30.h,
                      color: primaryColor,
                    ),
                    onPressed: () {
                      homeCubit.changeModalBottomSheet();
                      scaffoldKey.currentState!
                          .showBottomSheet((context) => modalBottomSheet());
                    },
                  ),
                ),
                BottomNavigationBarItem(
                  label: locale!.messages,
                  icon: const Icon(SolarIconsOutline.letter),
                ),
                BottomNavigationBarItem(
                  label: locale!.account,
                  icon: const Icon(
                    SolarIconsOutline.user,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget modalBottomSheet() {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final homeCubit = HomeCubit.get(context);
        return Container(
          color: backgroundColor,
          child: ListView(
            padding: EdgeInsets.only(top: 50.h, right: 16.w, left: 16.w),
            physics: const BouncingScrollPhysics(),
            children: [
              GestureDetector(
                onTap: () {
                  pickeImages().then((value) {
                    homeCubit.changeSelectedImages(images);
                  });
                },
                child: Container(
                  height: 75.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: mutedColor),
                    color: lightGreyColor,
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
                                  border: Border.all(color: mutedColor),
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
                              color: primaryColor,
                              size: 30.h,
                            ),
                            Text(
                              'قم بتحميل الصور',
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
                'الحد الأقصى للصور هو 5 صور',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp,
                      color: overGreyColor,
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
                          color: iconColor,
                        ),
                        decoration: InputDecoration(
                          fillColor: whiteColor,
                          filled: true,
                          border: InputBorder.none,
                          hintText: 'إختر محافظتك',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.w500),
                          prefixIcon: Icon(
                            SolarIconsOutline.mapPoint,
                            size: 16.h,
                            color: iconColor,
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
                      'عنوان البوست',
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
                                    color: extraGreyColor,
                                  ),
                          border: InputBorder.none,
                          fillColor: whiteColor,
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
                      'الوصف',
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
                                    color: extraGreyColor,
                                  ),
                          border: InputBorder.none,
                          fillColor: whiteColor,
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
                      'السعر',
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
                            fillColor: whiteColor,
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
                      'الهدف من التطبيق هو نشر المعرفة بالمجان ف كن ذا أثر',
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
                      'عدد الكتب',
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
                            fillColor: whiteColor,
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
                      text: 'المرحلة التعليمية',
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
                      text: 'السنة الدراسية',
                      onSelect: (value) {},
                      onSave: (value) {
                        enteredGrade = value!;
                      },
                    ),
                    BuildDropDownButton(
                      dropDownValue: homeCubit.educationTypeDropDownItems[0],
                      items: homeCubit.educationTypeDropDownItems,
                      text: 'نوع التعليم',
                      onSelect: (value) {},
                      onSave: (value) {
                        enteredEducationType = value!;
                      },
                    ),
                    BuildDropDownButton(
                      dropDownValue: homeCubit.termDropDownItems[0],
                      items: homeCubit.termDropDownItems,
                      text: 'الفصل الدراسي',
                      onSelect: (value) {},
                      onSave: (value) {
                        enteredSemester = value!;
                      },
                    ),
                    BuildDropDownButton(
                      dropDownValue: homeCubit.yearsDropDownItems[1],
                      items: homeCubit.yearsDropDownItems,
                      text: 'سنة إصدار الكتاب',
                      onSelect: (value) {},
                      onSave: (value) {
                        enteredBookEdition = value!;
                      },
                    )
                  ],
                ),
              ),
              Text(
                'اضغط لمعرفة موقعك على الخريطة',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 8.h),
                decoration: BoxDecoration(
                  color: whiteColor,
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
                        color: secondaryColor,
                      ),
              ),
              SizedBox(
                height: 10.h,
              ),
              homeCubit.isAddingPost
                  ? const CircularProgressIndicator(
                      color: primaryColor,
                    )
                  : Container(
                      clipBehavior: Clip.hardEdge,
                      margin: EdgeInsets.only(bottom: 10.h),
                      height: 45.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                        ),
                        onPressed: () {
                          submit(homeCubit);
                        },
                        child: Text(
                          'نشر',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: whiteColor),
                        ),
                      ),
                    )
            ],
          ),
        );
      },
    );
  }

  Future<void> pickeImages() async {
    final pickedImages = await imagePicker.pickMultiImage(
      imageQuality: 40,
    );

    if (pickedImages.isEmpty) {
      return;
    }
    if (pickedImages.length > 5) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
            'من فضلك قم بإختيار 5 صور فقط',
            textAlign: TextAlign.center,
          )),
        );
      }
    }
    setState(() {
      images = [];
      for (int i = 0; i < pickedImages.length; i++) {
        images.add(File(pickedImages[i].path));
      }
    });

    print(images);
  }

  void submit(HomeCubit homeCubit) {
    if (images.isEmpty) {
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
        title: enteredTitle,
        description: enteredDescription,
        price: enteredPrice,
        educationLevel: levels[enteredEducationLevel]!,
        educationType: enteredEducationType,
        grade: enteredGrade,
        location: enteredRegion,
        semester: enteredSemester,
        images: images,
        bookEdition: enteredBookEdition,
        numberOfBooks: enteredBooksCount,
      );
    }
    Navigator.pop(context);
  }
}
