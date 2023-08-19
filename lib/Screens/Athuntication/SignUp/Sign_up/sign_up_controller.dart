import 'package:flutter/material.dart';
import 'package:food_delivery/Models/sign_up_model.dart';
import 'package:food_delivery/Services/signup_services.dart';
import 'package:get/get.dart';
import '../../../../Constants/app_colors.dart';
import '../../../../Services/fire_base_services.dart';

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool seePassword = false;
  bool checked1 = false;
  bool checked2 = false;
  Services service = Services();

  final isLoading = false.obs;

  toggle() {
    seePassword = !seePassword;
    update();
  }

  checking2() {
    checked2 = !checked2;
    update();
  }

  checking1() {
    checked1 = !checked1;
    update();
  }

  signUp(SignUpModel model, context) async {
    if (model.email!.isEmpty || model.password!.isEmpty) {
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

      final auth = await SignUpServices.signUpUser(
        name: model.name!,
        email: model.email!,
        password: model.password!,
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
        clearController();
      }
    }
    isLoading.value = false;
  }

  clearController() {
    nameController.clear();
    emailController.clear();
    passController.clear();
  }
}
