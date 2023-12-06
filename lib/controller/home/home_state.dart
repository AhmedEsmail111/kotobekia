import 'package:kotobekia/models/post_model/post_model.dart';

abstract class HomeStates {}

class InitialHomeState extends HomeStates {}

class ChangeBottomNavBarHomeState extends HomeStates {}

class GetHomeDataSuccessHomeState extends HomeStates {
  final PostModel postModel;

  GetHomeDataSuccessHomeState(this.postModel);
}

class GetHomeDataFailureHomeState extends HomeStates {}

class GetHomeDataLoadingHomeState extends HomeStates {}

class GetSpecificCategorySuccessHomeState extends HomeStates {}

class GetSpecificCategoryFailureHomeState extends HomeStates {}

class GetSpecificCategoryLoadingHomeState extends HomeStates {}

class ChangeModalBottomSheetHomeState extends HomeStates {}

class UserSelectingImagesHomeState extends HomeStates {}

class UserChangingEducationLevelHomeState extends HomeStates {}