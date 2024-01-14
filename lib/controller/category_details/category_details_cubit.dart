import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kotobekia/controller/category_details/category_details_states.dart';
import 'package:kotobekia/shared/component/toast_message.dart';
import 'package:kotobekia/shared/constants/api/api_constant.dart';
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:kotobekia/shared/helper/functions.dart';
import 'package:kotobekia/shared/network/local/local.dart';
import 'package:kotobekia/shared/network/remote/remote.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoryDetailsCubit extends Cubit<CategoryDetailsStates> {
  CategoryDetailsCubit() : super(InitialCategoryDetailsState());

  static CategoryDetailsCubit get(context) => BlocProvider.of(context);

  void sharePost(String postUrl) {
    final url = Uri.parse('${AppConstant.baseShareUrl}/post/$postUrl');
    Share.shareUri(url);
  }

  void handleCall(String phoneNumber) async {
    final phoneUrl = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(phoneUrl)) {
      await launchUrl(phoneUrl);
    } else {
      print('Could not launch $phoneUrl');
    }
  }

  void reportPost(String postId, String userId, String feedback) async {
    if (HelperFunctions.hasUserRegistered()) {
      try {
        emit(ReportPostLoadingState());
        final response = await DioHelper.postData(
            url: ApiConstant.reportMethodUrl,
            data: {
              "report_type": "post",
              "report_id": postId,
              "reported_user_id": userId,
              "user_feedback": feedback,
            },
            token: CacheHelper.getData(key: AppConstant.token));

        if (response.statusCode == 200) {
          buildToastMessage(
            message:
                "we'll process your report and keep you updated,thanks for helping make Kotoby safe",
            gravity: ToastGravity.CENTER,
            toast: Toast.LENGTH_LONG,
          );
          print('sent report successfully');
          emit(ReportPostSuccessState());
        } else {
          print('error sending report');
          emit(ReportPostFailureState());
        }
      } catch (error) {
        print(error);
        emit(ReportPostFailureState());
      }
    }
  }
}
