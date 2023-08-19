

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Custom_rounded_container_with_color.dart';
import 'custom_shadow.dart';
import 'custom_text_change_font.dart';

class CustomPaymentEditCard extends StatelessWidget {
  const CustomPaymentEditCard({
    required this.imagePath,
    required this.cardNumber,
    required this.color,
    required this.imageSize,

    Key? key,
  }) : super(key: key);
  final String imagePath;
  final String cardNumber;
  final Color color;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return ShadowWidget(
        height: 130.h,
        widget: Center(
          child: GestureDetector(
              onTap: () {},
              child: CustomRoundedContainer(
                width: Get.width,
                height: 120.h,
                color: color,
                widget: SizedBox(
                  width: Get.width - 80,
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: imageSize.h,
                        child: Image.asset(
                            imagePath),
                      ),
                      CustomTextLibreFranklin(
                          subText: cardNumber,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ],
                  ),
                ),
              )),
        )
    );
  }
}
