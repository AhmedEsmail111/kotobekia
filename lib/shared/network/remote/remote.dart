import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:kotobekia/shared/constants/api/api_constant.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: ApiConstant.baseurl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getHomePostsData({
    required String methodUrl,
    Map<String, dynamic>? query,
  }) async {
    return await dio!.get(
      methodUrl,
      queryParameters: query,
    );
  }

  static Future<Response> sendNewPostData({
    required String title,
    required String description,
    required String price,
    required String educationLevel,
    required String educationType,
    required String grade,
    required String bookEdition,
    required String location,
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
      MapEntry('grade', ''),
      MapEntry('bookEdition', bookEdition),
      MapEntry('educationTerm', ''),
      MapEntry('educationType', ''),
      MapEntry('educationLevel', educationLevel),
      MapEntry('location', location),
      MapEntry('numberOfBooks', numberOfBooks),
      const MapEntry('city', 'cairo'),
    ]);
    final kImages = [];
    for (int i = 0; i < images.length; i++) {
      final type = await detectImageFormat(images[i]);
      print(type);
      final fileName = images[i].path.split('/').last;
      final image = await images[i].readAsBytes();
      kImages.add(image);

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

    print(formData.files[0].value.filename);
    print(formData.fields);
    print(formData.files);
    print(formData.files[0].value);
    print(formData.files[0].value.filename);
    print(formData.files[0].value.headers);

    return await dio!.post(ApiConstant.addNewPostUrlMethod, data: formData);
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
}

Future<String> detectImageFormat(File imageFile) async {
  final List<int> bytes = await imageFile.readAsBytes();

  if (isJpeg(bytes)) {
    return 'jpeg';
  } else if (isPng(bytes)) {
    return 'png';
  }

  // Default to 'jpeg' if the format is not recognized
  return 'jpeg';
}

bool isJpeg(List<int> bytes) {
  // JPEG files start with the signature FF D8 FF
  return bytes.length >= 3 &&
      bytes[0] == 0xFF &&
      bytes[1] == 0xD8 &&
      bytes[2] == 0xFF;
}

bool isPng(List<int> bytes) {
  // PNG files start with the signature 89 50 4E 47 0D 0A 1A 0A
  return bytes.length >= 8 &&
      bytes[0] == 0x89 &&
      bytes[1] == 0x50 &&
      bytes[2] == 0x4E &&
      bytes[3] == 0x47 &&
      bytes[4] == 0x0D &&
      bytes[5] == 0x0A &&
      bytes[6] == 0x1A &&
      bytes[7] == 0x0A;
}
