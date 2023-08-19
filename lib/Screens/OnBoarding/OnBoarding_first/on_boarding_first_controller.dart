import 'dart:async';

import 'package:get/get.dart';

import '../../../Cache Helper/cache_helper.dart';

class OnBoardingController extends GetxController{
final width=150.obs;
final height=150.obs;



animation(){
  width.value=220;
  height.value=220;
  print('******************************************');
  //CacheHelper.clearFromSharedPreferences();

}

startTimer() {
  Timer(const Duration(seconds: 1), () async {
    animation();
  });
}
@override
  void onInit() {
    super.onInit();
  startTimer();
//
  }
}