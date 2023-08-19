import 'package:flutter/material.dart';
import 'package:food_delivery/Models/update_info_model.dart';
import 'package:get/get.dart';
import '../../../../Cache Helper/cache_helper.dart';
import '../../../../Constants/app_colors.dart';
import '../../../../Services/update_name_phone_services.dart';

class SignUpProcessController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  final isLoading = false.obs;

  void saveName() async {
    await CacheHelper.saveToSharedPreferences(
        'firstName', firstNameController.text);
    await CacheHelper.saveToSharedPreferences(
        'lastName', lastNameController.text);
  }

  updateInfo(UpdateInfoModel model, context) async {
    if (model.name!.isEmpty || model.phone!.isEmpty) {
      final snackBar = SnackBar(
        content: const Text(
          'Please Enter Email and Password',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.gradientColor1,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      isLoading.value = true;
      final auth = await UpdateInfoServices.updateNamePhone(
        name: model.name!,
        phone: model.phone!,
      );
      if (auth[0] == true) {
        final snackBar = SnackBar(
          content: Text(
            auth[1],
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColors.gradientColor1,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        lastNameController.clear();
        firstNameController.clear();
        phoneNumberController.clear();
      }
    }

    isLoading.value = false;
  }
}
