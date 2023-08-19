import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Constants/MainColor.dart';
import '../Constants/TextColor.dart';
import '../Constants/app_colors.dart';
import 'Custom_rounded_container_with_color.dart';
import 'custom_shadow.dart';
import 'custom_text_change_font.dart';

class CustomChangeLocationCard extends StatelessWidget {
  const CustomChangeLocationCard({
    required this.cardTitle,
    required this.imagePath,
    required this.imageSize,
    required this.info,
    Key? key,
  }) : super(key: key);
  final String info;
  final String cardTitle;
  final String imagePath;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return ShadowWidget(
      height: 135,
      widget: Center(
        child: CustomRoundedContainer(
          width: Get.width,
          height: 130.h,
          color: AppColors.white,
          widget: Center(
            child: Container(
              constraints: BoxConstraints(minHeight: 120.h),
              width: Get.width - 100.w,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //  SizedBox(height: 1.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextLibreFranklin(
                            subText: cardTitle,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: imageSize.h, child: Image.asset(imagePath)),
                        SizedBox(
                          width: 270.w,
                          child: CustomTextLibreFranklin(
                              subText: info,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
