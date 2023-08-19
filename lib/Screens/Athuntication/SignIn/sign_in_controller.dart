import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Cache%20Helper/cache_helper.dart';
import 'package:food_delivery/Models/log_in_model.dart';
import 'package:food_delivery/Services/login_services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../Constants/TextColor.dart';
import '../../../Constants/app_colors.dart';

class SignInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();

  bool seePassword = false;
  final isLoading = false.obs;

  toggle() {
    seePassword = !seePassword;
    update();
  }

  signIn(LogInModel model, context) async {
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

      final auth = await LoginServices.logInUser(
          email: model.email!, password: model.password!);

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

      isLoading.value = false;
    }
  }

  clearController() {
    emailController.clear();
    passController.clear();
  }

  signInWithGoogle() async {
    final acc = await googleSignIn.signIn();
    final accAuth = await acc!.authentication;
    final credential = GoogleAuthProvider.credential(
        idToken: accAuth.idToken, accessToken: accAuth.accessToken);
    auth.signInWithCredential(credential).then((value) {});
  }
}
