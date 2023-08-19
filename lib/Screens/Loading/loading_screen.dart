import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Screens/home/Main%20View/main_view_screen.dart';
import 'package:get/get.dart';
import '../../Cache Helper/cache_helper.dart';
import '../Athuntication/SignIn/sign_in_screen.dart';
import '../NO Connection/no_connection_screen.dart';
import '../OnBoarding/OnBoarding_first/on_boarding_first_screen.dart';
import '../OnBoarding/OnBoarding_second/on_boarding_second_screen.dart';
import 'internet_check_controller.dart';



class LoadingScreen extends StatefulWidget {
   LoadingScreen({Key? key, required this.firstRun}) : super(key: key);
  final bool firstRun;
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

var token = CacheHelper.getFromSharedPreferences('token');


startTimer(firstRun) {
  print(token);
  final   connection = Get.put(ConnectionStatusSingleton());
  Timer(const Duration(seconds: 3), () async {

    if(connection.connectivity.value == 1){
      if(!firstRun){
        if (await token != null) {
          Get.offAll(const ViewScreen());
        } else {
          Get.to(SignInScreen());
        }
      }else{
        Get.offAll(OnBoardingSecondScreen());
      }
    }else{
      Get.offAll(const NoConnectionScreen());
    }
  });
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    startTimer(widget.firstRun);
  }

  @override
  Widget build(BuildContext context) {
    return  OnBoardingFirstScreen();
  }
}
