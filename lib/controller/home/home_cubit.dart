import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotobekia/controller/home/home_state.dart';
import 'package:kotobekia/models/post_model/post_model.dart';
import 'package:kotobekia/modules/add_post/add_post_screen.dart';
import 'package:kotobekia/modules/chat_screen/chat_screen.dart';
import 'package:kotobekia/modules/home/home_screen.dart';
import 'package:kotobekia/modules/profile/profile_screen.dart';
import 'package:kotobekia/modules/user_adds/user_adds_screen.dart';
import 'package:kotobekia/shared/constants/api/api_constant.dart';
import 'package:kotobekia/shared/helper/functions.dart';
import 'package:kotobekia/shared/network/remote/remote.dart';

final dateTime = DateTime.now();

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(InitialHomeState());

  static HomeCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    const HomeScreen(),
    const UserAddsScreen(),
    AddPostScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];
  HomePostsModel? homePostsModel;
  var currentIndex = 0;
  List<Post> kindergartenPosts = [];
  List<Post> primaryPosts = [];
  List<Post> preparatoryPosts = [];
  List<Post> secondaryPosts = [];
  List<Post> generalPosts = [];

  void changeBottomNavBarIndex(index) {
    currentIndex = index;
    print('current $index');
    emit(ChangeBottomNavBarHomeState());
  }

  void getHomePosts(
      {required String noInternet, required String weakInternet}) async {
    if (await HelperFunctions.hasConnection()) {
      try {
        emit(GetHomeDataLoadingHomeState());
        final response =
            await DioHelper.getData(url: ApiConstant.getHomePostMethodUrl);
        if (response.data == null) {
          emit(GetHomeDataFailureHomeState());
          return;
        }

        homePostsModel = HomePostsModel.fromJson(response.data);
        kindergartenPosts = homePostsModel!.result[0].posts
            .where((element) => element.educationLevel == levels[0])
            .toList();
        primaryPosts = homePostsModel!.result[1].posts
            .where((element) => element.educationLevel == levels[1])
            .toList();
        preparatoryPosts = homePostsModel!.result[2].posts
            .where((element) => element.educationLevel == levels[2])
            .toList();

        secondaryPosts = homePostsModel!.result[3].posts
            .where((element) => element.educationLevel == levels[3])
            .toList();

        generalPosts = homePostsModel!.result[4].posts
            .where((element) => element.educationLevel == levels[4])
            .toList();
        emit(GetHomeDataSuccessHomeState());
      } catch (error) {
        if (error is SocketException) {
          emit(GetHomeDataInternetFailureHomeState(message: weakInternet));
        }
        if (error is DioException &&
                error.type == DioExceptionType.connectionError ||
            error is DioException &&
                error.type == DioExceptionType.connectionTimeout ||
            error is DioException &&
                error.type == DioExceptionType.sendTimeout ||
            error is DioException &&
                error.type == DioExceptionType.receiveTimeout) {
          emit(GetHomeDataInternetFailureHomeState(message: weakInternet));
        }
        // else {
        //   emit(GetHomeDataFailureHomeState());
        // }
      }
    } else {
      emit(GetHomeDataInternetFailureHomeState(message: noInternet));
    }
  }

  void changeModalBottomSheet() {
    emit(ChangeModalBottomSheetHomeState());
  }
}
