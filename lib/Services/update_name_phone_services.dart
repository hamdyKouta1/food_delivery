import 'dart:convert';

import 'package:food_delivery/Screens/Athuntication/SignUp/Sign_up_process/sign_up_process.dart';
import 'package:food_delivery/Screens/Athuntication/SignUp/Upload_photo/upload_photo.dart';
import 'package:food_delivery/Screens/home/Main%20View/main_view_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../API/api_end_points.dart';
import '../Cache Helper/cache_helper.dart';
import '../Screens/Athuntication/SignUp/Payment_method/payment_method.dart';
import '../Screens/Athuntication/SignUp/Upload_preview/preview_photo.dart';

class UpdateInfoServices {
  static updateNamePhone({
    String? name,
    String? phone,

  }) async {
    bool failed = false;
    List returnThis = [];
    final myToken = await CacheHelper.getFromSharedPreferences('token');
    final id = await CacheHelper.getFromSharedPreferences('id');

    try {
      final response = await http.post(
          Uri.parse(APIEndPoints.baseURL + APIEndPoints.updateInfo + id.toString()),
          headers: {'Authorization': 'Bearer $myToken'},
          body: {'name': '$name', 'mobile': '$phone'});
          print(response.statusCode);
          print(response.body);


      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        Get.to(PaymentMethodScreen());
        return data;
      } else {
        failed = true;
        returnThis = [failed, 'Error'];
        return returnThis;
      }
    } catch (e) {
      print('failed');
      failed = true;
      returnThis = [failed, e.toString()];
      return returnThis;
    }
  }

  static updatePic({
    var imagePath
  }) async {
    bool failed = false;
    List returnThis = [];
    final myToken = await CacheHelper.getFromSharedPreferences('token');
    final id = await CacheHelper.getFromSharedPreferences('id');
    print(id);
    print(myToken);

    try {

      final request = http.MultipartRequest('POST',  Uri.parse(APIEndPoints.baseURL + APIEndPoints.updateInfo + id.toString()),)
        ..headers['Authorization'] = 'Bearer $myToken'
        ..files.add(await http.MultipartFile.fromPath('avatar', imagePath.path));
      final response = await request.send();
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        print('Photo uploaded successfully');
        print('Response: $responseBody');
        Get.to(PreviewPhotoScreen(
          myImagePath: imagePath,
        ));
        return responseBody;
      } else {
        failed = true;
        returnThis = [failed, 'Large file'];
        return returnThis;
      }
    } catch (e) {
      print('failed');
      failed = true;
      returnThis = [failed, e.toString()];
      return returnThis;
    }
  }
}
