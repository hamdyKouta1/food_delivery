
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

class CustomPaymentConfirmCards extends StatelessWidget {
  const CustomPaymentConfirmCards({
    required this.cardTitle,
    required this.imagePath,
    required this.imageSize,
    required this.info,
    required this.fontWeight,
    required this.editFunc,
    Key? key,
  }) : super(key: key);
  final Function editFunc;
  final String info;
  final String cardTitle;
  final String imagePath;
  final FontWeight fontWeight;
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
            child: SizedBox(
              width: Get.width - 100.w,
              height: 120.h,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextLibreFranklin(
                            subText: cardTitle,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey),
                        GestureDetector(
                          onTap: () {
                            editFunc();
                          },
                          child: CustomTextLibreFranklin(
                              subText: 'Edit',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.gradientColor1),
                        ),

                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox   (
                            height: imageSize.h,
                            child:Image.asset(imagePath)
                        ),
                        SizedBox(width: 15.w,),
                       info.length<25 ? CustomTextLibreFranklin(
                           subText: info,
                           fontSize: 16,
                           fontWeight: fontWeight,
                           color: AppColors.black) : Expanded(
                            child: CustomTextLibreFranklin(
                              subText: info,
                              fontSize: 16,
                              fontWeight: fontWeight,
                              color: AppColors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
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