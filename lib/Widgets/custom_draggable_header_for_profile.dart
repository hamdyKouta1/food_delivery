import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Constants/MainColor.dart';
import '../Constants/TextColor.dart';
import '../Constants/app_colors.dart';
import 'custom_rounded_container_with_no_minheight.dart';
import 'custom_text_change_font.dart';

class CustomDraggableHeaderForProfile extends StatelessWidget {
  const CustomDraggableHeaderForProfile({
    required this.title,
    required this.info,
    required this.distance,
    required this.rating,
    Key? key,
  }) : super(key: key);
  final String title;
  final String distance;
  final String rating;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.h),
        Center(
            child: CustomRoundedContainerNoMinHeight(
                width: 100.w,
                height: 10.h,
                color: AppColors.draggableContainerSlide,
                widget: const Text(''))),
        SizedBox(height: 15.h),
        Row(
          children: [
            CustomRoundedContainerNoMinHeight(
                width: 120.w,
                height: 50.h,
                color: AppColors.lightGold,
                widget: CustomTextLibreFranklin(
                    subText: 'Member Gold',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.priceColor)),
          ],
        ),
        SizedBox(height: 15.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextLibreFranklin(
                maxLines: 1,
                subText: title,
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: AppColors.black),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                  color: AppColors.gradientColor1,
                ))
          ],
        ),
        SizedBox(height: 1.h),
        SizedBox(
          width: Get.width,
          child: CustomTextLibreFranklin(
              subText: info,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.lightSubTextTitleColor),
        )
      ],
    );
  }
}
