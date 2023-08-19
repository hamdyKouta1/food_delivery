import 'package:flutter/cupertino.dart';
import 'package:food_delivery/Cache%20Helper/cache_helper.dart';
import 'package:get/get.dart';

class SetLocationController extends GetxController {
  String? location = '';
  TextEditingController locationController = TextEditingController();

  setLocation() async {
    location = locationController.text;
    await CacheHelper.saveToSharedPreferences('location', location);
    Get.back();
    update();
  }
}
