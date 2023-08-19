import 'dart:convert';

import 'package:food_delivery/Cache%20Helper/cache_helper.dart';

import '../API/api_end_points.dart';
import 'package:http/http.dart' as http;

class GetProfile{
  static  getProfile()async{
    final myToken = await CacheHelper.getFromSharedPreferences('token');
    final id = await CacheHelper.getFromSharedPreferences('id');
    print(id);
    final response = await http.get(
        Uri.parse(APIEndPoints.baseURL+APIEndPoints.profileEndPoint+id.toString()),
        headers: {
          'Authorization':'Bearer $myToken'
        }
    );
    //return ProductModel.fromJson(json.decode(response.body));
   // print(response.body);
    return jsonDecode(response.body.toString());
  }
}