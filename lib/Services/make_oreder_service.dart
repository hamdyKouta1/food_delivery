
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:food_delivery/Screens/home/Main%20View/main_view_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../API/api_end_points.dart';
import '../Cache Helper/cache_helper.dart';


class OrderServices {

  static makeOrder( {String ?foodId, String ? quantity}) async {
    final myToken = await CacheHelper.getFromSharedPreferences('token');

    final response = await http.post(
          Uri.parse(APIEndPoints.baseURL+APIEndPoints.makeOrderEndPoint),
          headers: {
            'Authorization': 'Bearer $myToken'
          },
          body: {
            'food_id' : foodId! ,
            'quantity' : quantity!,
          }
      );
        return (response.statusCode);


  }

  static getOrder()async {
    final myToken = await CacheHelper.getFromSharedPreferences('token');
    final response = await http.get(
          Uri.parse(APIEndPoints.baseURL+APIEndPoints.getOrderEndPoint),
          headers: {
            'Authorization': 'Bearer $myToken'
          },
      );
    print(response.statusCode);
    //debugPrint(response.body.toString());
        return jsonDecode(response.body);
  }

}
