
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Models/JasonModel/DataOrder.dart';
import 'package:food_delivery/Services/make_oreder_service.dart';
import 'package:food_delivery/Widgets/check_out.dart';
import 'package:get/get.dart';
import '../../../Models/JasonModel/DataFood.dart';
import '../../../Services/food_services.dart';
import '../../../Widgets/cutom_alert_dialog.dart';

class YourOrderController extends GetxController{

  int quantity=1;
  double price=35.3;
  double  subTotal=0.0;
  dynamic orders,foods;
  List orderListOfModel= [];
  List foodsOrderListOfModel= [];
  final isLoading=false.obs;
  final isListEmpty=false.obs;
  TextEditingController fortest =TextEditingController();





  @override
  void onInit() {
    getOrder();
  }
  checkOut(context){
    showDialog<String>(
        context: context,
        builder: (BuildContext context) =>
            const CustomAlertDialogCheckOut(
              text: "Thanks For Using Food Delivery",
              subText:' Your Order Is on its Way' ,
            )
    );
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
