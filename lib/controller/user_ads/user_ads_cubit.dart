import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotobekia/controller/user_ads/user_ads_states.dart';
import 'package:kotobekia/models/user_ads_model/user_ads_model.dart';
import 'package:kotobekia/shared/constants/api/api_constant.dart';
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:kotobekia/shared/helper/functions.dart';
import 'package:kotobekia/shared/network/local/local.dart';
import 'package:kotobekia/shared/network/remote/remote.dart';

class UserAddsCubit extends Cubit<UserAddsStates> {
  UserAddsCubit() : super(InitialUserAddsState());

  static UserAddsCubit get(context) => BlocProvider.of(context);
  UserAdsModel? userAdsModel;
  void getUserPost() async {
    if (await HelperFunctions.hasConnection() &&
        HelperFunctions.hasUserRegistered()) {
      emit(GetUserAddsLoadingState());
      try {
        final response = await DioHelper.getData(
          url: ApiConstant.getUserPostsMethodUrl,
          token: CacheHelper.getData(key: AppConstant.token),
        );

        if (response.statusCode == 200) {
          userAdsModel = UserAdsModel.fromJson(response.data);
          emit(GetUserAddsSuccessState());
          print('got user add successfully');
        } else {
          print('error while getting user adds');
          emit(GetUserAddsFailureState());
        }
      } catch (error) {
        print(error.toString());
        emit(GetUserAddsFailureState());
      }
    } else {
      emit(GetUserAddsInternetFailureState());
    }
  }
}
