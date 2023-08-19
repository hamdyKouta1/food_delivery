import 'package:food_delivery/Screens/Support/add_new_item.dart';
import 'package:food_delivery/Screens/home/Chat/chat_screen.dart';
import 'package:food_delivery/Screens/home/Home/home_screen.dart';
import 'package:food_delivery/Screens/home/Order%20Details/order_details_screen.dart';
import 'package:food_delivery/Screens/home/Profile/profile_screen.dart';
import 'package:get/get.dart';

import '../../../Cache Helper/cache_helper.dart';

class MainViewController extends GetxController{

  int myPageNumber=0;
  var email;


  @override
  void onInit() {
    getEmail();
  }

  getEmail()async{
     email = await CacheHelper.getFromSharedPreferences('email');
     print(email);
     update();
  }

  updateMyNumber(index){
    myPageNumber=index;
    update();
  }

  returnScreen(int selectedPage){
    switch(myPageNumber){
      case 0:{
        return  HomeScreen();
      }
      case 1:{
        return  ProfileScreen();
      }
      case 2:{
        return email.contains("support")? AddNewItemScreen() : OrderDetailsScreen();
      }
      case 3:{
        return  ChatScreen();
      }
    }
  }
}