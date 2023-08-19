import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Models/JasonModel/ProductModel.dart';

import 'package:food_delivery/Services/get_product_services.dart';
import 'package:get/get.dart';

import '../../../Constants/TextColor.dart';
import '../../../Constants/app_colors.dart';
import '../../../Models/JasonModel/DataFood.dart';
import '../../../Models/JasonModel/DataRes.dart';
import '../../../Services/food_services.dart';
import '../../../Services/make_oreder_service.dart';
import '../../../Services/restaurant_services.dart';
import '../../../Widgets/cutom_alert_dialog.dart';

class FoodDetailsController extends GetxController{


  dynamic restaurants;
  dynamic checked1=true, checked2=true,checked3=true;
  dynamic foods;

  List foodsListOfModel=[];
  List restaurantListOfModel=[];

  int quantity=1;
  double price=35.3;

  plusFunc(int storeQuantity,context){
    if(quantity < storeQuantity){
      quantity = quantity + 1;
    }
    else if(quantity== storeQuantity) {
      showDialog<String>(
          context: context,
          builder: (BuildContext context) =>
              CustomAlertDialog(
                storeQuantity: storeQuantity,)
      );
    }
    update();
  }
  minFunc(){
    if (quantity>0) {
      quantity = quantity - 1;
    }
    update();
  }
  getFoodForRes(resId)async{
    foodsListOfModel.clear();
    foods=await GetFood.getFood();
    print(foods['data']);
    for(int i=0; i<foods['data'].length;i++){
      if(foods['data'][i]['restaurent_id']==resId.toString()) {
        foodsListOfModel.add(DataFoodModel.fromJson(foods['data'][i]));
      }
    }
    update();
  }
  yummy(){
    quantity=1;
    update();
  }
  makeOrder(String id,String q,DataFoodModel myModel,context)async{
    if(int.parse(q) > 0){
      var stateCode = await OrderServices.makeOrder(foodId: id, quantity: q);
      if (stateCode == 200) {
        final snackBar = SnackBar(
          content: Text(
            quantity == 1
                ? 'one ${myModel.name} has been added to your order'
                : 'a $quantity ${myModel.name} has been added to your order',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColors.gradientColor1,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }else{
      final snackBar = SnackBar(
        content: const Text(
        'please select one or more to send the order',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.gradientColor1,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

}
