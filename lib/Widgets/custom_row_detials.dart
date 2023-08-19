
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Constants/MainColor.dart';
import '../Constants/app_colors.dart';
import 'custom_text_change_font.dart';

class CustomRowDetailsPrice extends StatelessWidget {
  const CustomRowDetailsPrice({
    required this.title,
    required this.price,
    required this.fontWeight,
    required this.fontSize,
    Key? key,
  }) : super(key: key);
  final String title;
  final String price;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width - 100.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextLibreFranklin(
              subText: title,
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: AppColors.white),
          CustomTextLibreFranklin(
              subText: '\$$price',
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: AppColors.white)
        ],
      ),
    );
  }
}