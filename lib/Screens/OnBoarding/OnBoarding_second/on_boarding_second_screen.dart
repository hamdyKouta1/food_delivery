import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Constants/TextColor.dart';
import 'package:food_delivery/Screens/OnBoarding/OnBoarding_third/on_boarding_third.dart';
import 'package:get/get.dart';
import '../../../Constants/app_colors.dart';
import '../../../Widgets/custom_text_button.dart';
import '../../../Widgets/custom_text_change_font.dart';

class OnBoardingSecondScreen extends StatelessWidget {
  const OnBoardingSecondScreen({Key? key}) : super(key: key);

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
                    Image.asset('assets/images/illustration.png'),
                    SizedBox(height:40.h ,),

                    SizedBox(
                      width: 250.w,
                      child: Column(
                        children:  [
                           CustomTextLibreFranklin(
                              subText: 'Find your Comfort'
                                  '\n          Food here',
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            color: AppColors.subTextTitleColor,
                            ),

                          SizedBox(height:20.h ,),
                           CustomTextLibreFranklin(
                            subText: 'Here You Can find a chef or dish for every'
                                '\n                      taste and color. Enjoy!',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.subTextTitleColor,
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height:45.h ,),
                    GestureDetector(
                      onTap: (){Get.to(OnBoardingThirdScreen());},
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


