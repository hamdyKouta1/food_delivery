import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Constants/TextColor.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Constants/MainColor.dart';
import '../Constants/app_colors.dart';
import 'Custom_rounded_container_with_color.dart';
import 'custom_shadow.dart';
import 'custom_text_change_font.dart';

class CustomLoadingCard extends StatelessWidget {
  const CustomLoadingCard({
    Key? key,
  }) : super(key: key);

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
                    width: 10.w,
                  ),
                  SizedBox(
                      width: 70.w,
                      height: 70.h,
                      child: CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColors.lightSubTextTitleColor)),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 20.h,
                          width: 140.w,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              color: AppColors.lightSubTextTitleColor)),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                          width: 150.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              color: AppColors.lightSubTextTitleColor)),
                    ],
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                ])),
        height: 200);
  }
}
