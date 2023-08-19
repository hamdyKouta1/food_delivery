import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Screens/OnBoarding/OnBoarding_first/on_boarding_first_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../../Constants/MainColor.dart';
import '../../../Constants/app_colors.dart';
import '../../../Widgets/custom_gradient_title.dart';
import '../../../Widgets/custom_sub_title.dart';

class OnBoardingFirstScreen extends StatelessWidget {
  OnBoardingFirstScreen({Key? key}) : super(key: key);

  OnBoardingController onBoardingController = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/Pattern.png'),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() =>
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          width: onBoardingController.width.value.toDouble().w,
                          height: onBoardingController.height.value.toDouble().h,
                          child: Image.asset('assets/images/Logox4.png')),
                    ),
                    const CustomGradientTitle(
                      text: 'Food Ninja',
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                    ),
                    const CustomSubTitle(
                      subText: 'Deliver Favorite Food',
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
