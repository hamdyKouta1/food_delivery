import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Constants/MainColor.dart';
import '../Constants/TextColor.dart';
import '../Constants/app_colors.dart';
import 'custom_shadow.dart';
import 'custom_text_change_font.dart';

class CustomQuantityBar extends StatelessWidget {
  const CustomQuantityBar({
    required this.title,
    required this.quantity,
    required this.plus,
    required this.min,
    Key? key,
  }) : super(key: key);
  final String title;
  final int quantity;
  final Function plus, min;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextLibreFranklin(
            subText: title,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black),
        SizedBox(
          height: 15.h,
        ),
        ShadowWidget(
          height: 85.h,
          widget: Container(
            width: Get.width - 80.w,
            height: 80.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.w), color: AppColors.selectedTab),
            child: Row(
              children: [
                SizedBox(
                  width: 15.w,
                ),
                GestureDetector(
                  onTap: () {
                    plus();
                  },
                  child: Container(
                    width: 50.w,
                    height: Get.height,
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          //                   <--- right side
                          color: AppColors.shadow,
                          width: .8,
                        ),
                      ),
                    ),
                    child: const Icon(CupertinoIcons.plus),
                  ),
                ),
                Expanded(
                    child: Center(
                      child: CustomTextLibreFranklin(
                          subText: "$quantity",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.gradientColor2),
                    )),
                GestureDetector(
                  onTap: () {
                    min();
                  },
                  child: Container(
                    width: 50.w,
                    height: Get.height,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          //                   <--- right side
                          color: AppColors.shadow,
                          width: 1,
                        ),
                      ),
                    ),
                    child: const Icon(CupertinoIcons.minus),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        )
      ],
    );
  }
}