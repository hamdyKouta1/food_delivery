import 'package:food_delivery/Models/JasonModel/DataFood.dart';
import 'package:food_delivery/Models/JasonModel/DataRes.dart';
import 'package:food_delivery/Services/food_services.dart';
import 'package:food_delivery/Services/support_services.dart';
import 'package:get/get.dart';
import '../../../Services/restaurant_services.dart';

class RemoveController extends GetxController {
  int myPageNumber = 0;

  dynamic restaurants;
  List counterForRes = [];
  List restaurantListOfModel = [];

  dynamic foods;
  List foodsListOfModel = [];


  @override
  void onInit() {
    super.onInit();
    restaurantListOfModel.clear();
    foodsListOfModel.clear();
    getFood();
    getRestaurant();
  }




  getRestaurant() async {
    restaurantListOfModel.clear();
    restaurants = await GetRestaurant.getRestaurant();
    for (int i = 0; i < restaurants['data'].length; i++) {
      restaurantListOfModel
          .add(DataRestaurantModel.fromJson(restaurants['data'][i]));
      counterForRes.add(i);
    }
    update();
  }

  getFood() async {
    foodsListOfModel.clear();
    foods = await GetFood.getFood();
    for (int i = 0; i < foods['data'].length; i++) {
      foodsListOfModel.add(DataFoodModel.fromJson(foods['data'][i]));
    }
    update();
  }

  removeFood(id,index)async{
    await SupportControllerServices.removeFood(id);
    foodsListOfModel.removeAt(index);
    getFood();
    update();
  }
  removeRes(id,index)async{

    await SupportControllerServices.removeRes(id);
    restaurantListOfModel.removeAt(index);
    getRestaurant();
    update();
  }

}
