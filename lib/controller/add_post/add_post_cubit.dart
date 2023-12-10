import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kotobekia/controller/add_post/add_post_states.dart';
import 'package:kotobekia/shared/component/snakbar_message.dart';
import 'package:kotobekia/shared/network/remote/remote.dart';

final dateTime = DateTime.now();

class AddPostCubit extends Cubit<AddPostStates> {
  AddPostCubit() : super(InitialAddPostState());

  static AddPostCubit get(context) => BlocProvider.of(context);

  Future<void> pickImages(context) async {
    final imagePicker = ImagePicker();
    List<File> images = [];
    final pickedImages = await imagePicker.pickMultiImage(
      imageQuality: 40,
    );

    if (pickedImages.isEmpty) {
      return;
    }
    if (pickedImages.length > 5) {
      if (context.mounted) {
        snakBarMessage(
            context: context,
            message: 'من فضلك قم بإختيار 5 صور فقط',
            snackbarState: SnackbarState.inValid);
      }
    }
    images = [];
    for (int i = 0; i < pickedImages.length; i++) {
      images.add(File(pickedImages[i].path));
    }
    changeSelectedImages(images);
  }

  bool isAddingPost = false;
  void sendNewPost({
    required String title,
    required String description,
    required String price,
    required String educationLevel,
    required String educationType,
    required String grade,
    required String bookEdition,
    required String cityLocation,
    required String semester,
    required List<File> images,
    required String numberOfBooks,
  }) async {
    try {
      isAddingPost = true;
      final response = await DioHelper.sendNewPostData(
        title: title,
        description: description,
        price: price,
        educationLevel: educationLevel,
        educationType: educationType,
        grade: grade,
        bookEdition: bookEdition,
        cityLocation: cityLocation,
        semester: semester,
        images: images,
        numberOfBooks: numberOfBooks,
      );

      isAddingPost = false;

      if (response.statusCode == 200) {
        print('Data and images sent successfully');
        print(response.data);
        print(response.statusCode);
      } else {
        print('Error sending data and images: ${response.statusCode}');
        // Print response data for more details
        print(response.data);
      }
    } catch (error) {
      isAddingPost = false;
      print('Error sending data and images: ${error.toString()}');
    }
  }

  // vars to collect the entered data by the user
  var enteredTitle = '';
  void changeTitle(String value) {
    enteredTitle = value;
    emit(UserChangingTitleAddPostState());
  }

  var enteredDescription = '';
  void changeDescription(String value) {
    enteredDescription = value;
    emit(UserChangingDescriptionAddPostState());
  }

  var enteredPrice = '';
  void changePrice(String value) {
    enteredPrice = value;
    emit(UserChangingPriceAddPostState());
  }

  var educationLevel = 'ثانوي';
  void changeEducationLevel(String value) {
    educationLevel = value;
    emit(UserSelectingImagesAddPostState());
  }

  var enteredRegion = '';
  void changeRegion(String value) {
    enteredRegion = value;
    emit(UserChangingRegionAddPostState());
  }

  var enteredGrade = '';
  void changeGrade(String value) {
    enteredGrade = value;
    emit(UserChangingGradeAddPostState());
  }

  var enteredEducationType = '';
  void changeEducationType(String value) {
    enteredEducationType = value;
    emit(UserChangingEducationTypeAddPostState());
  }

  var enteredSemester = '';
  void changeSemester(String value) {
    enteredSemester = value;
    emit(UserChangingSemesterAddPostState());
  }

  var enteredBookEdition = '';
  void changeBookEdition(String value) {
    enteredBookEdition = value;
    emit(UserChangingBookEditionAddPostState());
  }

  var enteredBooksCount = '';
  void changeBooksCount(String value) {
    enteredBooksCount = value;
    emit(UserChangingBooksCountAddPostState());
  }

  // dropDownItems for the Regions
  final List<String> regionsDropDownItem = [
    'القاهرة',
    'الجيزة',
    'الإسكندرية',
    'الدقهلية',
    'الشرقية',
    'المنوفية',
    'القليوبية',
    'البحيرة',
    'بور سعيد',
    'دمياط',
    'الإسماعلية',
    'السويس',
    'كفر الشيخ.',
    'الفيوم',
    'بني سويف',
    'مطروح',
    'شمال سيناء',
    'جنوب سيناء',
    'المنيا',
    'أسيوط',
    'سوهاج',
    'قنا',
    'البحر الأحمر',
    'الأقصر',
    'أسوان',
    'الواحات',
    'الوادي الجديد',
  ];

  // dropDownItems for the book edition years
  final List<String> yearsDropDownItems = [
    dateTime.year.toString(),
    (dateTime.year - 1).toString(),
    (dateTime.year - 2).toString(),
    (dateTime.year - 3).toString(),
    (dateTime.year - 4).toString(),
    (dateTime.year - 5).toString(),
    (dateTime.year - 6).toString(),
    (dateTime.year - 7).toString(),
    (dateTime.year - 8).toString(),
    (dateTime.year - 9).toString(),
    (dateTime.year - 10).toString(),
    (dateTime.year - 11).toString(),
    (dateTime.year - 12).toString(),
    (dateTime.year - 13).toString(),
  ];

  // dropDownItems for the education levels
  final List<String> educationLevelsDropDownItems = [
    'حضانة',
    'إبتدائي',
    'إعدادي',
    'ثانوي',
    ' غير ذلك',
  ];

  // dropDownItems for the grade
  final List<String> modifiedGradeDropDownItems = [
    'أولى',
    'تانية',
    'تالتة',
    'رابعة',
    'خامسة',
    'ساتة',
  ];
  // dropDownItems for the grade
  final List<String> gradeDropDownItems = [
    'أولى',
    'تانية',
    'تالتة',
  ];
  // dropDownItems for the term
  final List<String> termDropDownItems = [
    'الأول',
    'الثاني',
    'كلاهما',
  ];
  // dropDownItems for the term
  final List<String> educationTypeDropDownItems = [
    'تربية وتعليم',
    'أزهر',
    'غير ذلك',
  ];
  // a url for the location image of the user
  String? locationImageUrl;
  // update the list of images when the user select some
  List<File> selectedImages = [];
  void changeSelectedImages(List<File> images) {
    selectedImages = [];
    selectedImages = images;
    emit(UserSelectingImagesAddPostState());
  }

// change the selected level so that we can change how many grade there are
}
