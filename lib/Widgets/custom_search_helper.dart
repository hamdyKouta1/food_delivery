
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Constants/MainColor.dart';
import '../Constants/app_colors.dart';
import 'custom_rounded_container_with_no_minheight.dart';
import 'custom_text_change_font.dart';

class CustomSearchHelper extends StatelessWidget {
  const CustomSearchHelper({
    required this.name,
    required this.width,
    required this.onTapFunc,
    Key? key,
  }) : super(key: key);
  final String name;
  final double width;
  final Function onTapFunc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){onTapFunc();},
      child: CustomRoundedContainerNoMinHeight(
          width: width.w,
          height: 60.h,
          color: AppColors.lightGold,
          widget: CustomTextLibreFranklin(
              subText: name,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.priceColor)),
    );
  }
}