import 'dart:convert';
import 'dart:developer';

import 'package:food_delivery/Screens/Athuntication/SignUp/Sign_up_process/sign_up_process.dart';
import 'package:food_delivery/Screens/home/Main%20View/main_view_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../API/api_end_points.dart';
import '../Cache Helper/cache_helper.dart';
import 'fire_base_services.dart';

Services service = Services();

class SignUpServices {
  static signUpUser({
    String? name,
    String? email,
    String? password,
  }) async {
    bool failed = false;
    List returnThis = [];

    try {
      final response = await http.post(
          Uri.parse(APIEndPoints.baseURL + APIEndPoints.signUpEndPoint),
          body: {
            'name': '$name',
            'email': '$email',
            'password': '$password',
            'mobile': '000000000'
          });
      print(response.statusCode);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);

        await CacheHelper.saveToSharedPreferences('token', data['token']);
        await CacheHelper.saveToSharedPreferences('id', data['data']['id']);
        await CacheHelper.saveToSharedPreferences('email', email);
        await CacheHelper.saveToSharedPreferences(
            'support', "support1@gmail.com");
        String greatPath = "people-support";
        await service.cloudStore.collection(greatPath).add({
          'name': name,
          'email': email,
        });
        Get.offAll(SignUpProcessScreen());
        return data;
      } else {
        failed = true;
        returnThis = [failed, 'This Account is used by another User'];
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
