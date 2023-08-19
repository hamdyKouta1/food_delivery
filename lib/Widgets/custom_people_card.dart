import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Constants/MainColor.dart';
import '../Constants/app_colors.dart';
import 'Custom_rounded_container_with_color.dart';
import 'custom_shadow.dart';
import 'custom_text_change_font.dart';

class CustomPeopleCard extends StatelessWidget {
  const CustomPeopleCard({
    required this.image,
    required this.food,
    required this.info,
    required this.time,
    Key? key,
  }) : super(key: key);
  final String time;
  final String food;
  final String info;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ShadowWidget(
        widget: CustomRoundedContainer(
            width: Get.width,
            height: 100.h,
            color: AppColors.white,
            widget: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 70.w, height: 70.h, child: Image.asset(image)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextLibreFranklin(
                          subText: food,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomTextLibreFranklin(
                          subText: info,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: AppColors.grey),
                    ],
                  ),
                  SizedBox(
                    width: 40.w,
                  ),
                  CustomTextLibreFranklin(
                      subText: time,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: AppColors.grey)
                ])),
        height: 200);
  }
}
