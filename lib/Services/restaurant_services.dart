import 'dart:convert';
import 'package:http/http.dart' as http;
import '../API/api_end_points.dart';
import '../Cache Helper/cache_helper.dart';

class GetRestaurant{
  static getRestaurant()async{
    final myToken = await CacheHelper.getFromSharedPreferences('token');
    final response = await http.get(
        Uri.parse(APIEndPoints.baseURL+APIEndPoints.restaurantEndPoint),
    headers: {
        'Authorization':'Bearer $myToken'

    });
    //return ProductModel.fromJson(json.decode(response.body));
    return json.decode(response.body);
  }
}