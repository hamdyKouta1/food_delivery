import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Constants/TextColor.dart';
import 'package:food_delivery/custom_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Constants/MainColor.dart';
import '../Constants/app_colors.dart';
import 'Custom_rounded_container_with_color.dart';
import 'custom_shadow.dart';
import 'custom_text_change_font.dart';

class CustomChatHeader extends StatelessWidget {
  const CustomChatHeader({
    required this.image,
    required this.name,
    required this.state,
    Key? key,
  }) : super(key: key);
  final String name;
  final String state;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ShadowWidget(
        widget: CustomRoundedContainer(
            width: Get.width,
            height: 50.h,
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
                          subText: name,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Icon(CupertinoIcons.circle_fill,
                              size: 7,
                              color: state == 'Online'
                                  ? Colors.green
                                  : Colors.grey),
                          SizedBox(
                            width: 5.w,
                          ),
                          CustomTextLibreFranklin(
                              subText: state,
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: AppColors.grey),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 40.w,
                  ),
                  SizedBox(
                      width: 50.w,
                      height: 50.h,
                      child: CustomRoundedContainer(
                        widget: Center(
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.call,
                                  size: 25,
                                  color: AppColors.gradientColor1,
                                ))),
                        width: 60.w,
                        height: 10.h,
                        color: AppColors.selectedTab,
                      ))
                ])),
        height: 200);
  }
}
