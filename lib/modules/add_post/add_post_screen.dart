import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/add_post/add_post_cubit.dart';
import 'package:kotobekia/controller/add_post/add_post_states.dart';
import 'package:kotobekia/modules/add_post/drop_down_button.dart';
import 'package:kotobekia/shared/component/authentication/default_button_in_app.dart';
import 'package:kotobekia/shared/component/authentication/default_text_form_in_app.dart';
import 'package:kotobekia/shared/component/dialogue_message.dart';
import 'package:kotobekia/shared/component/snakbar_message.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});
  final formKey = GlobalKey<FormState>();
// to be able to manipulate the text and clear it when the user press the free button
  final priceTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final sentMessageSnackBar = locale!.choose_all_message;
    final selectImagesMessage = locale.images_not_choesen_message;

    // to be able to match the backend requirements
    final grades = {
      locale.grade_one: 'grade_one',
      locale.grade_two: 'grade_two',
      locale.grade_three: 'grade_three',
      locale.grade_four: 'grade_four',
      locale.grade_five: 'grade_five',
      locale.grade_six: 'grade_six',
    };

    final semesterDropDownItems = {
      locale.first: 'first',
      locale.second: 'second',
      locale.both: 'both'
    };

    final educationTypeDropDownItems = {
      locale.general_type: 'general',
      locale.azhar: 'azhar',
      locale.any_type: 'other',
    };

    final educationLevelsDropDownItems = {
      locale.kindergarten: '655b4ec133dd362ae53081f7',
      locale.primary: '655b4ecd33dd362ae53081f9',
      locale.preparatory: '655b4ee433dd362ae53081fb',
      locale.secondary: '655b4efb33dd362ae53081fd',
      locale.general: '655b4f0a33dd362ae53081ff'
    };

    final regionsDropDownItems = {
      locale.cairo: 'cairo',
      locale.giza: 'giza',
      locale.alexandria: 'alexandria',
      locale.dakahlia: 'dakahlia',
      locale.sharqia: 'sharqia',
      locale.monufia: 'monufia',
      locale.qalyubia: 'qalyubia',
      locale.beheira: 'beheira',
      locale.port_said: 'port_said',
      locale.damietta: 'damietta',
      locale.ismailia: 'ismailia',
      locale.suez: 'suez',
      locale.kafr_el_sheikh: 'kafr_el_sheikh',
      locale.fayoum: 'fayoum',
      locale.beni_suef: 'beni_suef',
      locale.matruh: 'matruh',
      locale.north_sinai: 'north_sinai',
      locale.south_sinai: 'south_sinai',
      locale.minya: 'minya',
      locale.asyut: 'asyut',
      locale.sohag: 'sohag',
      locale.qena: 'qena',
      locale.red_sea: 'red_sea',
      locale.luxor: 'luxor',
      locale.aswan: 'aswan',
    };

    return BlocConsumer<AddPostCubit, AddPostStates>(
      listener: (context, state) {
        if (state is SendNewPostSuccess) {
          snackBarMessage(
              context: context,
              message: locale.add_new_message,
              snackbarState: SnackbarState.inValid,
              duration: const Duration(seconds: 2));
        }
        if (state is SendNewPostInternetFailure) {
          buildDialogue(context: context, message: state.message);
        }
      },
      builder: (context, state) {
        final addPostCubit = AddPostCubit.get(context);

        return Scaffold(
          body: Container(
            color: ColorConstant.backgroundColor,
            padding: EdgeInsets.only(top: 50.h, right: 16.w, left: 16.w),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      addPostCubit.pickImages(context, locale.choose_only_5);
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
                                  width:
                                      MediaQuery.of(context).size.width / 2.6,
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
                                  locale.upload_images,
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
                    locale.maximum_images,
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
                        BuildDropDownButton(
                          icon: SolarIconsOutline.mapPoint,
                          dropDownHint: locale.your_city,
                          items: regionsDropDownItems.keys.toList(),
                          text: '',
                          errorMessage: locale.city_error_message,
                          onSelect: (value) {
                            addPostCubit
                                .changeRegion(regionsDropDownItems[value]!);
                          },
                          onSave: (value) {
                            addPostCubit
                                .changeRegion(regionsDropDownItems[value]!);
                          },
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          locale.post_title,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        BuildDefaultTextField(
                          inputType: TextInputType.text,
                          withText: false,
                          hintText: locale.title_hint,
                          backGroundColor: ColorConstant.whiteColor,
                          context: context,
                          width: double.infinity,
                          height: 50.h,
                          maxLenght: 35,
                          isObscured: false,
                          onSaved: (value) {
                            if (value != null) {
                              addPostCubit.changeTitle(value);
                            }
                          },
                          onValidate: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return locale.title_error_message;
                            }
                            if (value.trim().length < 5) {
                              return locale.title_error_message_2;
                            }
                            return null;
                          },
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
                        SizedBox(
                          height: 4.h,
                        ),
                        BuildDefaultTextField(
                          inputType: TextInputType.text,
                          withText: false,
                          hintText: locale.description_hint,
                          backGroundColor: ColorConstant.whiteColor,
                          context: context,
                          width: double.infinity,
                          height: 50.h,
                          maxLenght: 300,
                          maxLines: 3,
                          isObscured: false,
                          onSaved: (value) {
                            addPostCubit.changeDescription(value!);
                          },
                          onValidate: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return locale.description_error_message;
                            } else if (value.trim().length < 60) {
                              return locale.description_error_message_2;
                            }
                            return null;
                          },
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
                          height: 4.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: [
                            BuildDefaultTextField(
                              controller: priceTextEditingController,
                              isEnabled: addPostCubit.index == 0,
                              onChange: (value) {
                                addPostCubit.changePrice(value);
                              },
                              inputType: TextInputType.number,
                              withText: false,
                              hintText: '',
                              backGroundColor: ColorConstant.whiteColor,
                              context: context,
                              width: MediaQuery.of(context).size.width / 2.6,
                              height: 50.h,
                              maxLenght: 5,
                              isObscured: false,
                              onSaved: (value) {
                                addPostCubit.changePrice(value!);
                              },
                              onValidate: (value) {
                                if (value == null ||
                                    value.trim().isEmpty &&
                                        addPostCubit.index == 0) {
                                  return locale.price_error_message;
                                } else if (!checkPrice(
                                      numberOfBooks:
                                          addPostCubit.enteredBooksCount,
                                      bookPrice: addPostCubit.enteredPrice,
                                    ) &&
                                    addPostCubit.index == 0) {
                                  return '';
                                }
                                return null;
                              },
                            ),
                            Text(locale.or),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.6,
                              height: 40.h,
                              child: Container(
                                decoration: addPostCubit.index == 1
                                    ? BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        border: Border.all(
                                            color: ColorConstant.blackColor))
                                    : null,
                                child: BuildDefaultButton(
                                  onTap: () {
                                    if (addPostCubit.index == 0) {
                                      priceTextEditingController.clear();
                                      addPostCubit.togglePriceButton(1);
                                    } else {
                                      addPostCubit.togglePriceButton(0);
                                    }
                                  },
                                  text: locale.free,
                                  color: ColorConstant.primaryColor,
                                  elevation: 1,
                                  context: context,
                                  withBorder: false,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        if (!checkPrice(
                              numberOfBooks: addPostCubit.enteredBooksCount,
                              bookPrice: addPostCubit.enteredPrice,
                            ) &&
                            addPostCubit.index == 0)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Text(
                              locale.overpriced_message,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: ColorConstant.dangerColor,
                                      fontSize: 12.sp),
                            ),
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
                          height: 4.h,
                        ),
                        BuildDefaultTextField(
                          inputType: TextInputType.number,
                          withText: false,
                          hintText: '',
                          backGroundColor: ColorConstant.whiteColor,
                          context: context,
                          width: MediaQuery.of(context).size.width / 2.6,
                          height: 50.h,
                          maxLenght: 3,
                          isObscured: false,
                          onChange: (value) {
                            addPostCubit.changeBooksCount(value);
                          },
                          onSaved: (value) {
                            addPostCubit.changeBooksCount(value!);
                          },
                          onValidate: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return locale.books_count_error_message;
                            }
                            return null;
                          },
                        ),
                        BuildDropDownButton(
                          dropDownHint: locale.your_education_level,
                          errorMessage: locale.level_error_message,
                          items: educationLevelsDropDownItems.keys.toList(),
                          text: locale.education_level,
                          onSelect: (value) {
                            if (value != null) {
                              addPostCubit.changeEducationLevel(
                                  educationLevelsDropDownItems[value]!);
                            }
                          },
                          onSave: (value) {
                            if (value != null) {
                              addPostCubit.changeEducationLevel(
                                  educationLevelsDropDownItems[value]!);
                            }
                          },
                        ),
                        BuildDropDownButton(
                          dropDownHint: locale.your_grade,
                          errorMessage: locale.grade_error_message,
                          items:
                              // addPostCubit.isPrimary
                              //     ?
                              grades.keys.toList()
                          // :
                          // grades.keys.toList().sublist(0, 3)
                          ,
                          text: locale.grade,
                          onSelect: (value) {
                            addPostCubit.changeGrade(grades[value]!);
                          },
                          onSave: (value) {
                            if (value != null) {
                              addPostCubit.changeGrade(grades[value]!);
                            }
                          },
                        ),
                        BuildDropDownButton(
                          dropDownHint: locale.your_education_type,
                          errorMessage: locale.type_error_message,
                          items: educationTypeDropDownItems.keys.toList(),
                          text: locale.education_type,
                          onSelect: (value) {
                            addPostCubit.changeEducationType(
                                educationTypeDropDownItems[value]!);
                          },
                          onSave: (value) {
                            addPostCubit.changeEducationType(
                                educationTypeDropDownItems[value]!);
                          },
                        ),
                        BuildDropDownButton(
                          dropDownHint: locale.your_semester,
                          errorMessage: locale.semester_error_message,
                          items: semesterDropDownItems.keys.toList(),
                          text: locale.term,
                          onSelect: (value) {
                            addPostCubit
                                .changeSemester(semesterDropDownItems[value]!);
                          },
                          onSave: (value) {
                            addPostCubit
                                .changeSemester(semesterDropDownItems[value]!);
                          },
                        ),
                        BuildDropDownButton(
                          errorMessage: locale.edition_error_message,
                          dropDownHint: locale.your_book_edition,
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
                  // Text(
                  //   locale.location_on_map,
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .titleMedium!
                  //       .copyWith(fontWeight: FontWeight.w500),
                  // ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   margin: EdgeInsets.only(bottom: 8.h),
                  //   decoration: BoxDecoration(
                  //     color: ColorConstant.whiteColor,
                  //     borderRadius: BorderRadius.circular(14),
                  //     border: Border.all(
                  //       color: const Color(0xFFC8C5C5),
                  //     ),
                  //   ),
                  //   height: 147.h,
                  //   width: double.infinity,
                  //   child: addPostCubit.locationImageUrl != null
                  //       ? Image.network('src')
                  //       : Icon(
                  //           SolarIconsOutline.mapPoint,
                  //           size: 40.h,
                  //           color: ColorConstant.secondaryColor,
                  //         ),
                  // ),
                  SizedBox(
                    height: 24.h,
                  ),
                  addPostCubit.isAddingPost
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: ColorConstant.primaryColor,
                          ),
                        )
                      : BuildDefaultButton(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              submit(
                                addPostCubit: addPostCubit,
                                context: context,
                                title: addPostCubit.enteredTitle,
                                description: addPostCubit.enteredDescription,
                                price: addPostCubit.index == 0
                                    ? addPostCubit.enteredPrice
                                    : '0',
                                educationLevel: addPostCubit.educationLevel,
                                educationType:
                                    addPostCubit.enteredEducationType,
                                grade: addPostCubit.enteredGrade,
                                region: addPostCubit.enteredRegion,
                                semester: addPostCubit.enteredSemester,
                                bookEdition: addPostCubit.enteredBookEdition,
                                booksCount: addPostCubit.enteredBooksCount,
                                message: sentMessageSnackBar,
                                selectImagesMessage: selectImagesMessage,
                                locale: locale,
                              );
                            }
                          },
                          text: locale.submit,
                          color: ColorConstant.primaryColor,
                          elevation: 3,
                          context: context,
                          withBorder: false,
                        ),
                  SizedBox(
                    height: 50.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void submit(
      {required AddPostCubit addPostCubit,
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
      required String message,
      required String selectImagesMessage,
      required AppLocalizations locale}) {
    if (addPostCubit.selectedImages.isEmpty) {
      snackBarMessage(
          context: context,
          message: selectImagesMessage,
          snackbarState: SnackbarState.error,
          duration: const Duration(seconds: 2));
      return;
    }

    print('title $title');
    print('description $description');
    print('grade $grade');
    print('educationlevel $educationLevel');
    print('semester $semester');
    print('educationtype $educationType');
    print('booksCount $booksCount');
    print('region $region');
    print('price $price');
    print('bookEdition $bookEdition');

    addPostCubit.sendNewPost(
      title: title,
      description: description,
      price: price,
      educationLevel: educationLevel,
      educationType: educationType,
      grade: grade,
      cityLocation: region,
      semester: semester,
      images: addPostCubit.selectedImages,
      bookEdition: bookEdition,
      numberOfBooks: booksCount,
      context: context,
      noInternet: locale.no_internet,
      weakInternet: locale.weak_internet,
    );
  }

  bool checkPrice({required String numberOfBooks, required String bookPrice}) {
    int? number = int.tryParse(numberOfBooks);

    int? price = int.tryParse(bookPrice) ?? 1;

    var limit = 0;
    if (number != null) {
      limit = number * 30;
    }
    return price <= limit;
  }
}
