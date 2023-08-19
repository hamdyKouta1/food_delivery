import 'dart:convert';
import 'package:http/http.dart' as http;
import '../API/api_end_points.dart';

class GetProducts{
static  getProducts()async{
     final response = await http.get(
       Uri.parse(APIEndPoints.baseURLProducts+APIEndPoints.productsEndPoint));
     //return ProductModel.fromJson(json.decode(response.body));
     return json.decode(response.body);
  }
}