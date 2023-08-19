import 'package:flutter/material.dart';
import 'package:food_delivery/Cache%20Helper/cache_helper.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../../../Constants/app_colors.dart';
import '../../../../Services/update_name_phone_services.dart';

class UploadPhotoController extends GetxController {
  File? imagePath;
  final imagePicker = ImagePicker();
  final isLoading = false.obs;

  Future<void> openCamera(context) async {
    isLoading.value = true;
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    imagePath = File(image!.path);
    await CacheHelper.saveToSharedPreferences('imageFile', imagePath);
    updatePic(imagePath!, context);
  }

  Future<void> openGallery(context) async {
    isLoading.value = true;
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    imagePath = File(image!.path);
    await CacheHelper.saveToSharedPreferences('imageFile', imagePath);
    updatePic(imagePath!, context);
  }

  updatePic(File path, context) async {
    if (1 == 2) {
      final snackBar = SnackBar(
        content: const Text(
          'Please Enter Email and Password',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.gradientColor1,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final auth = await UpdateInfoServices.updatePic(imagePath: path);
      if (auth[0] == true) {
        final snackBar = SnackBar(
          content: Text(
            auth[1],
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColors.gradientColor1,
        );
        isLoading.value = false;
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        isLoading.value = false;
      }
    }
  }
}
