

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Screens/home/Main%20View/main_view_screen.dart';
import 'package:food_delivery/Services/support_services.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../../Cache Helper/cache_helper.dart';
import '../../../Constants/app_colors.dart';

class AddResController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController tag1 = TextEditingController();
  TextEditingController tag2 = TextEditingController();
  TextEditingController long = TextEditingController();
  TextEditingController lat = TextEditingController();

  File? imagePath;
  final imagePicker = ImagePicker();
  final isLoading = false.obs;

  Future<void> openGallery(context) async {
    // isLoading.value=true;
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    imagePath = File(image!.path);
    await CacheHelper.saveToSharedPreferences('imageFilefood', imagePath);
  }

  createRes(context) async {
    isLoading.value=true;
   final auth = await SupportControllerServices.addRes(
        name: name.text,
        address: address.text,
        long: long.text.toString(),
        lat: lat.text.toString(),
        tag1: tag1.text,
        tag2: tag2.text,
        imagePath: imagePath
    );
    if (auth[0] == true) {
      final snackBar = SnackBar(
        content: Text(
          auth[1],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.gradientColor1,
      );
      isLoading.value=false;
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      isLoading.value=false;
    }
  }

}