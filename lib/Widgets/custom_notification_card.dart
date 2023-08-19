import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Constants/MainColor.dart';
import '../Constants/app_colors.dart';
import 'Custom_rounded_container_with_color.dart';
import 'custom_shadow.dart';
import 'custom_text_change_font.dart';

class CustomNotificationCard extends StatelessWidget {
  const CustomNotificationCard({
    required this.icon,
    required this.title,
    required this.info,
    required this.color,
    Key? key,
  }) : super(key: key);
  final String title;
  final String info;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ShadowWidget(
        widget: CustomRoundedContainer(
            width: Get.width,
            height: 100.h,
            color: AppColors.white,
            widget: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  SizedBox(
                      width: 50.w,
                      height: 50.h,
                      child: CircleAvatar(
                          radius: 20,
                          backgroundColor: color,
                          child: Center(
                              child: Icon(
                            icon,
                            size: 30,
                            color: Colors.white,
                          )))),
                  SizedBox(
                    width: 20.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextLibreFranklin(
                          subText: title,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomTextLibreFranklin(
                          subText: info,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: AppColors.grey),
                    ],
                  ),
                ])),
        height: 200);
  }
}
