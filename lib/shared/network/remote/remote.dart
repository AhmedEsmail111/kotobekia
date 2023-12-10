import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:kotobekia/shared/helper/functions.dart';

import '../../constants/api/api_constant.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: ApiConstant.baseurl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required url,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      if (token != null) 'token': token,
    };
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {required url,
      required Map<String, dynamic> data,
      String lang = 'en',
      String? token}) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      if (token != null) 'Authorization': token,
    };
    return await dio!.post(url, data: data);
  }

  static Future<Response> putData(
      {required url,
      required Map<String, dynamic> data,
      String lang = 'en',
      String? token}) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      if (token != null) 'Authorization': token,
    };
    return await dio!.put(url, data: data);
  }

  static Future<Response> sendNewPostData({
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
// create a form data
    final formData = FormData();
    formData.fields.addAll([
      MapEntry('title', title),
      MapEntry('description', description),
      MapEntry('price', price),
      const MapEntry('postType', 'offered'),
      const MapEntry('grade', ''),
      MapEntry('bookEdition', bookEdition),
      const MapEntry('educationTerm', ''),
      const MapEntry('educationType', ''),
      MapEntry('educationLevel', educationLevel),
      const MapEntry('location', 'location'),
      MapEntry('numberOfBooks', numberOfBooks),
      MapEntry('city', cityLocation),
    ]);

    for (int i = 0; i < images.length; i++) {
      final type = await HelperFunctions.detectImageFormat(images[i]);
      print(type);
      final fileName = images[i].path.split('/').last;
      final image = await images[i].readAsBytes();

      formData.files.add(
        MapEntry(
          'images',
          MultipartFile.fromBytes(
            image,
            filename: fileName,
            contentType: MediaType('image', type),
          ),
        ),
      );
    }

    print(formData.files[1]);

    return await dio!.post(ApiConstant.addNewPostUrlMethod, data: formData);
  }
}
