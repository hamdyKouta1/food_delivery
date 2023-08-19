import 'dart:convert';
import 'package:http/http.dart' as http;
import '../API/api_end_points.dart';
import '../Cache Helper/cache_helper.dart';

class GetFood{
  static  getFood()async{
    final myToken = await CacheHelper.getFromSharedPreferences('token');
    final response = await http.get(
        Uri.parse(APIEndPoints.baseURL+APIEndPoints.foodEndPoint),
        headers: {
          'Authorization':'Bearer $myToken'

        });
    //return ProductModel.fromJson(json.decode(response.body));
    return json.decode(response.body);
  }
  static  getOneFood(id)async{
    final myToken = await CacheHelper.getFromSharedPreferences('token');
    final response = await http.get(
        Uri.parse(APIEndPoints.baseURL+APIEndPoints.foodEndPoint+id.toString()),
        headers: {
          'Authorization':'Bearer $myToken'

        });
    return json.decode(response.body);
  }
}