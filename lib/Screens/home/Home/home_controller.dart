import 'package:food_delivery/Models/JasonModel/DataFood.dart';
import 'package:food_delivery/Models/JasonModel/DataRes.dart';
import 'package:food_delivery/Models/JasonModel/ProductModel.dart';
import 'package:food_delivery/Screens/home/Home/nearest_and_popular_screen.dart';
import 'package:food_delivery/Screens/home/Home/nearest_restaurant_screen.dart';
import 'package:food_delivery/Screens/home/Home/popular_menu_screen.dart';
import 'package:food_delivery/Screens/home/Home/search_screen.dart';
import 'package:food_delivery/Services/food_services.dart';
import 'package:food_delivery/Services/get_product_services.dart';
import 'package:get/get.dart';

import '../../../Services/restaurant_services.dart';
import '../Restaurent Details/detial_menu_screen.dart';

class HomeController extends GetxController {
  int myPageNumber = 0;

  dynamic restaurants;
  List counterForRes = [];
  List restaurantListOfModel = [];

  List products = [];
  List productsListOfModel = [];
  List counterForProductList = [];

  dynamic foods;
  List foodsListOfModel = [];

  @override
  void onInit() {
    super.onInit();
    products.clear();
    productsListOfModel.clear();
    restaurantListOfModel.clear();
    foodsListOfModel.clear();
    getFood();
    getRestaurant();
  }

  updateMyNumber(index) {
    myPageNumber = index;
    update();
  }


  returnScreen(int selectedPage) {
    switch (myPageNumber) {
      case 0:
        {
          return NearestAndPopularScreen();
        }
      case 1:
        {
          return NearestRestaurantScreen();
        }
      case 2:
        {
          return PopularMenuScreen();
        }
      case 3:
        {
          return const SearchScreen();
        }
    }
  }

  getProducts() async {
    products = await GetProducts.getProducts();
    for (int i = 0; i < products.length; i++) {
      productsListOfModel.add(ProductModel.fromJson(products[i]));
      counterForProductList.add(i);
    }
    update();
  }
getRestaurant() async {

    restaurants = await GetRestaurant.getRestaurant();
    for (int i = 0; i < restaurants['data'].length; i++) {
      restaurantListOfModel
          .add(DataRestaurantModel.fromJson(restaurants['data'][i]));
      counterForRes.add(i);
    }
    print("HI Res");
    update();
  }

 getFood() async {
    foods = await GetFood.getFood();
    for (int i = 0; i < foods['data'].length; i++) {
      foodsListOfModel.add(DataFoodModel.fromJson(foods['data'][i]));
    }
    update();
  }

   getAll(){
    getFood();
    getRestaurant();
  }

  selectedCard(DataRestaurantModel sendModel) {
    Get.to(DetailsMenuScreen(
      myModel: (sendModel),
    ));
  }
}
