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

class CustomDraggableHeaderForProducts extends StatelessWidget {
  const CustomDraggableHeaderForProducts({
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
                width: 110.w,
                height: 50.h,
                color: AppColors.selectedTab,
                widget: CustomTextLibreFranklin(
                    subText: 'Popular',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.gradientColor1)),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: CustomRoundedContainerNoMinHeight(
                      width: 55.w,
                      height: 50.h,
                      color: AppColors.selectedTab,
                      widget: Icon(
                        Icons.location_on_rounded,
                        color: AppColors.gradientColor1,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CustomRoundedContainerNoMinHeight(
                      width: 55.w,
                      height: 50.h,
                      color: AppColors.lightRed,
                      widget: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 15.h),
        CustomTextLibreFranklin(
            maxLines: 3,
            subText: title,
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: AppColors.black),
        SizedBox(height: 15.h),
        Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.add_location_outlined,
                    color: AppColors.gradientColor1,
                    size: 22,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CustomTextLibreFranklin(
                      subText: '$distance Km',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightSubTextTitleColor),
                  SizedBox(
                    width: 10.w,
                  ),
                  Icon(
                    Icons.star,
                    color: AppColors.gradientColor1,
                    size: 22,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CustomTextLibreFranklin(
                      subText: '$rating Rating',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightSubTextTitleColor),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 15.h),
        SizedBox(
          width: Get.width,
          child: CustomTextLibreFranklin(
              maxLines: 5,
              subText: info,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.black),
        )
      ],
    );
  }
}
