import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Constants/TextColor.dart';
import 'package:food_delivery/Screens/Athuntication/SignUp/Sign_up/sign_up.dart';
import 'package:food_delivery/Screens/OnBoarding/OnBoarding_second/on_boarding_second_screen.dart';
import 'package:get/get.dart';
import '../../../Constants/app_colors.dart';
import '../../../Widgets/custom_text_button.dart';
import '../../../Widgets/custom_text_change_font.dart';
import '../../Athuntication/SignIn/sign_in_screen.dart';

class OnBoardingThirdScreen extends StatelessWidget {
  const OnBoardingThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/shape2.png'),
                SizedBox(height:110.h ,),
                SizedBox(
                  width: 350.w,
                  child: Column(
                    children:  [
                      CustomTextLibreFranklin(
                        subText: 'Food Ninja is Where Your'
                            '\n      Comfort Food Lives ',
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: AppColors.subTextTitleColor,
                      ),
                      SizedBox(height:20.h ,),
                      CustomTextLibreFranklin(
                        subText: 'Enjoy a fast and smooth food delivery'
                            '\n                      at your doorstep',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.subTextTitleColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(height:45.h ,),
                GestureDetector(
                  onTap: (){Get.to(SignUpScreen());},
                  child: const CustomTextButton(
                    width: 170,
                    height: 60,
                    text: 'Next',
                    textSize: 16,
                    textFontWeight: FontWeight.w800,
                    ),
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}


