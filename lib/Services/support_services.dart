import 'dart:convert';

import 'package:food_delivery/Screens/Support/add_new_item.dart';
import 'package:food_delivery/Screens/home/Main%20View/main_view_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import '../API/api_end_points.dart';
import '../Cache Helper/cache_helper.dart';

class SupportControllerServices {
  static addRes(
      {var name,
      var address,
      var long,
      var lat,
      var tag1,
      var tag2,
      var imagePath}) async {
    bool failed = false;
    List returnThis = [];
    final myToken = await CacheHelper.getFromSharedPreferences('token');
    // final id = await CacheHelper.getFromSharedPreferences('id');

    print(myToken);

    try {
      final request = http.MultipartRequest('POST',
          Uri.parse(APIEndPoints.baseURL + APIEndPoints.createResEndPoint))
        ..headers['Authorization'] = 'Bearer $myToken'
        ..fields['verified'] = "true"
        ..fields['delivery_time'] = "10~15"
        ..fields['name'] = name
        ..fields['address'] = address
        ..fields['long'] = long
        ..fields['lat'] = lat
        ..fields['tags1'] = tag1
        ..fields['tags2'] = tag2
        ..files.add(await http.MultipartFile.fromPath('pic', imagePath.path))
        ..files.add(
            await http.MultipartFile.fromPath('cover_photo', imagePath.path));
      final response = await request.send();
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        print('Photo uploaded successfully');
        print('Response: $responseBody');
        Get.offAll(ViewScreen());
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

  static addFood(
      {var name,
        var description,
        var price,
        var restaurantId,
        var catId,
        var imagePath}) async {
    bool failed = false;
    List returnThis = [];
    final myToken = await CacheHelper.getFromSharedPreferences('token');
    // final id = await CacheHelper.getFromSharedPreferences('id');

    print(myToken);

    try {
      final request = http.MultipartRequest('POST',
          Uri.parse(APIEndPoints.baseURL + APIEndPoints.createFoodEndPoint))
        ..headers['Authorization'] = 'Bearer $myToken'
        ..fields['name'] = name
        ..fields['description'] = description
        ..fields['price'] = price
        ..fields['restaurent_id'] = restaurantId
        ..fields['cat_id'] = catId
        ..files.add(await http.MultipartFile.fromPath('pic', imagePath.path));
      final response = await request.send();
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        print('Photo uploaded successfully');
        print('Response: $responseBody');
        Get.offAll(ViewScreen());
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

  static  removeFood(id)async{
    final myToken = await CacheHelper.getFromSharedPreferences('token');
    final response = await http.delete(
        Uri.parse(APIEndPoints.baseURL+APIEndPoints.foodEndPoint+id.toString()),
        headers: {
          'Authorization':'Bearer $myToken'

        });
    return json.decode(response.body);
  }
  static  removeRes(id)async{
    final myToken = await CacheHelper.getFromSharedPreferences('token');
    final response = await http.delete(
        Uri.parse(APIEndPoints.baseURL+APIEndPoints.restaurantEndPoint+id.toString()),
        headers: {
          'Authorization':'Bearer $myToken'
        });
    return json.decode(response.body);
  }

}
