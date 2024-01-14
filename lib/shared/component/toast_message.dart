import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kotobekia/shared/styles/colors.dart';

void buildToastMessage(
    {required String message,
    required ToastGravity gravity,
    toast = Toast.LENGTH_SHORT}) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
      msg: message,
      toastLength: toast,
      gravity: gravity,
      timeInSecForIosWeb: 2,
      backgroundColor: ColorConstant.lightGreyColor,
      textColor: ColorConstant.blackColor,
      fontSize: 16.sp);
}
