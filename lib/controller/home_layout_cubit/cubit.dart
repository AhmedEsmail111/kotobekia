import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kotobekia/controller/home_layout_cubit/states.dart';
import 'package:kotobekia/models/post_model/post_model.dart';
import 'package:kotobekia/shared/constants/api/api_constant.dart';
import 'package:kotobekia/shared/network/remote/remote.dart';

final dateTime = DateTime.now();

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(InitialHomeState());

  static HomeCubit get(context) => BlocProvider.of(context);
  var currentIndex = 0;

  void changeBottomNavBarIndex(index) {
    currentIndex = index;
    print('current $index');
    emit(ChangeBottomNavBarHomeState());
  }

  void getHomePosts() async {
    emit(GetHomeDataLoadingHomeState());
    final response = await DioHelper.getHomePostsData(
        methodUrl: ApiConstant.getHomePostMethodUrl);
    if (response.data == null) {
      emit(GetHomeDataFailureHomeState());
    }else{

    }
    emit(GetHomeDataSuccessHomeState());
  }

  bool isAddingPost = false;
  void sendNewPost({
    required String title,
    required String description,
    required String price,
    required String educationLevel,
    required String educationType,
    required String grade,
    // String cityLocation,
    required String bookEdition,
    required String location,
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
        location: location,
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
  // void getSpecificCategory({required String level}) async {
  //   emit(GetSpecificCategoryLoadingHomeState());

  //   final response = await DioHelper.getSpecificCategory(
  //       methodUrl: 'api/v1/levels/specific/$level');

  //   if (response.data == null) {
  //     emit(GetSpecificCategoryFailureHomeState());
  //     return;
  //   }
  // }

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
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //       content: Text(
        //     'من فضلك قم بإختيار 5 صور فقط',
        //     textAlign: TextAlign.center,
        //   )),
        // );
      }
    }

    images = [];
    for (int i = 0; i < pickedImages.length; i++) {
      images.add(File(pickedImages[i].path));
    }
    changeSelectedImages(images);
  }

  void changeModalBottomSheet() {
    emit(ChangeModalBottomSheetHomeState());
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
    emit(UserSelectingImagesHomeState());
  }

// change the selected level so that we can change how many grade there are
  var educationLevel = 'ثانوي';
  void changeEducationLevel(String level) {
    educationLevel = level;
    emit(UserChangingEducationLevelHomeState());
  }
}
