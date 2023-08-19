import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../../Cache Helper/cache_helper.dart';
import '../../../Constants/app_colors.dart';
import '../../../Services/support_services.dart';

class AddFoodController extends GetxController{
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController resId = TextEditingController();
  TextEditingController catId = TextEditingController();
  File? imagePath;
  final imagePicker = ImagePicker();
  final isLoading = false.obs;

  Future<void> openGallery(context) async {
    // isLoading.value=true;
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    imagePath = File(image!.path);
    await CacheHelper.saveToSharedPreferences('imageFilefood', imagePath);
  }
  createFood(context) async {
    isLoading.value=true;
    final auth = await SupportControllerServices.addFood(
        name: name.text,
        description: description.text,
        price: price.text.toString(),
        restaurantId: resId.text.toString(),
        catId: catId.text,
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