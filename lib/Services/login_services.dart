
import 'dart:convert';

import 'package:food_delivery/Screens/home/Main%20View/main_view_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../API/api_end_points.dart';
import '../Cache Helper/cache_helper.dart';


class LoginServices {
  static logInUser( {String ?email, String? password}) async {
    bool failed=false;
    List returnThis=[];

    try{

      final response = await http.post(
          Uri.parse(APIEndPoints.baseURL+APIEndPoints.logInEndPoint),
          body: {
            'email' : '$email',
            'password' : '$password'
          }
      );
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        await CacheHelper.saveToSharedPreferences('token', data['token']);
        await CacheHelper.saveToSharedPreferences('id', data['user']['id']);
        await CacheHelper.saveToSharedPreferences('email',email);
        await CacheHelper.saveToSharedPreferences(
            'support', "support1@gmail.com");
        Get.offAll(const ViewScreen());
      }else {
        print('not Found');
        failed =true;
        returnThis=[failed ,'Invalid Email or Password'];
        return returnThis;
      }
    }catch(e){
      print(e.toString());
      print('failed');
      failed =true;
      returnThis=[failed,e.toString()];
     return returnThis;
    }

  }
}
