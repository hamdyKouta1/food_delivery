import 'package:flutter/material.dart';
import 'package:food_delivery/Constants/MainColor.dart';
import 'package:food_delivery/Models/JasonModel/DataOrder.dart';
import 'package:food_delivery/Services/make_oreder_service.dart';
import 'package:get/get.dart';

import '../../../Constants/TextColor.dart';
import '../../../Models/JasonModel/DataFood.dart';
import '../../../Services/food_services.dart';
import '../../../Widgets/custom_text_change_font.dart';
import '../../../Widgets/cutom_alert_dialog.dart';

class OrderDetailsController extends GetxController{

  int quantity=1;
  double price=35.3;
  double  subTotal=0.0;
  dynamic orders,foods;
  List orderListOfModel= [];
  List foodsOrderListOfModel= [];
  final isLoading=false.obs;
  final isListEmpty=false.obs;





  @override
  void onInit() {
    getOrder();
  }
  updateOnRemove(index){
    isListEmpty.value=false;
    foodsOrderListOfModel.removeAt(index);
    orderListOfModel.removeAt(index);
    subTotal=0;
    for(int j=0; j< foodsOrderListOfModel.length;j++){
      subTotal+=(double.parse(foodsOrderListOfModel[j].price)*double.parse(orderListOfModel[j].quantity));
    }
    if(foodsOrderListOfModel.isEmpty){
      isListEmpty.value=true;
    }
    update();
  }
  plusFunc(i,quantity,int storeQuantity,context){
    subTotal=0;
    if(quantity < storeQuantity){
      quantity = quantity + 1;
      orderListOfModel[i].quantity=quantity.toString();
    }
   else if(quantity== storeQuantity) {
      showDialog<String>(
          context: context,
          builder: (BuildContext context) =>
              CustomAlertDialog(
                storeQuantity: storeQuantity,)
      );
    }
    for(int j=0; j< foodsOrderListOfModel.length;j++){
      subTotal+=(double.parse(foodsOrderListOfModel[j].price)*double.parse(orderListOfModel[j].quantity));
    }
    update();
  }
  minFunc(i,quantity){
    subTotal=0;
    if (quantity>1) {
      quantity = quantity - 1;
      orderListOfModel[i].quantity=quantity.toString();
    }
    for(int j=0; j< foodsOrderListOfModel.length;j++){
      subTotal+=(double.parse(foodsOrderListOfModel[j].price)*double.parse(orderListOfModel[j].quantity));
    }
    update();
  }
  getOrder()async{
    subTotal=0;
    isLoading.value=true;
    orders= await OrderServices.getOrder();
    orderListOfModel.clear();
    foodsOrderListOfModel.clear();
    orderListOfModel.add(DataOrderModel.fromJson(orders['data'][0]));
    bool flag=false;
    for(int i=1; i < orders['data'].length ;i++){
      flag=false;
      for (int j=0; j< orderListOfModel.length;j++){
        if(orderListOfModel[j].time.toString()==orders['data'][i]['time'].toString()) {
          flag=true;
          break;
        }
      }
      if(!flag){
        orderListOfModel.add(DataOrderModel.fromJson(orders['data'][i]));
      }
    }
    for(int j=0; j< orderListOfModel.length;j++){
        dynamic res = await getFoodForRes(orderListOfModel[j].foodId);
        if(res['data'].length==0){
        }else{
          foodsOrderListOfModel.add(DataFoodModel.fromJson(res['data'][0]));
        }
    }
    for(int j=0; j< foodsOrderListOfModel.length;j++){
      subTotal+=(double.parse(foodsOrderListOfModel[j].price)*double.parse(orderListOfModel[j].quantity));
    }
    isLoading.value=false;
    update();
  }
  getFoodForRes(resId)async{
    foods=await GetFood.getOneFood(resId);
    return (foods);
  }
  getTotal({required double itemPrice}){
    subTotal += itemPrice;
    update();
  }

}
