import 'package:food_delivery/Models/JasonModel/ProductModel.dart';

import 'package:food_delivery/Services/get_product_services.dart';
import 'package:get/get.dart';

import '../../../Models/JasonModel/DataFood.dart';
import '../../../Models/JasonModel/DataRes.dart';
import '../../../Services/food_services.dart';
import '../../../Services/restaurant_services.dart';

class DetailsMenuController extends GetxController{


  int myPageNumber=0;

  List products=[];
  dynamic restaurants;

  dynamic foods;
  List foodsListOfModel=[];


  List productsListOfModel=[];
  List restaurantListOfModel=[];
  List counterForProductList=[];

  @override
  void onInit() {
    super.onInit();
    products.clear();
    productsListOfModel.clear();
  }


  getFoodForRes(resId)async{
    foodsListOfModel.clear();
    foods=await GetFood.getFood();
    print(foods['data']);
    for(int i=0; i<foods['data'].length;i++){
      if(foods['data'][i]['restaurent_id']==resId.toString()) {
        foodsListOfModel.add(DataFoodModel.fromJson(foods['data'][i]));
        print('add');
      }else{
        print("not");
      }
    }
    update();



  }
  getProducts()async{
    update();
  }

}
