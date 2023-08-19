import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Screens/Athuntication/SignIn/sign_in_screen.dart';
import 'package:get/get.dart';
import '../../../../Constants/app_colors.dart';
import '../../../../Widgets/custom_gradient_title.dart';
import '../../../../Widgets/custom_sub_title.dart';
import '../../../../Widgets/custom_text_button.dart';

class ResetSuccessNotificationScreen extends StatelessWidget {
  const ResetSuccessNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/Pattern.png'),
              ),
              Positioned(
                width: Get.width,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 220.h,
                      ),
                      Image.asset('assets/images/congrats.png'),
                      const CustomGradientTitle(
                        text: 'Congrats!',
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                      ),
                      const CustomSubTitle(
                        subText: 'Password reset successful',
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                      ),
                      SizedBox(
                        height: 300.h,
                      ),
                      Center(
                          child: SizedBox(
                            width: Get.width - 50,
                            height: Get.height,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.offAll(SignInScreen());
                                  },
                                  child: const CustomTextButton(
                                    width: 170,
                                    height: 60,
                                    text: 'Back',
                                    textSize: 16,
                                    textFontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                          ],
                        ),
                      ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
