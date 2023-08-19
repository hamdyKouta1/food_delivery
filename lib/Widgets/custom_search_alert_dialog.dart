import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Constants/MainColor.dart';
import 'package:food_delivery/Constants/TextColor.dart';
import 'package:food_delivery/Widgets/custom_search_field.dart';
import 'package:food_delivery/Widgets/custom_text_change_font.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Constants/app_colors.dart';

class CustomSearchAlert extends StatelessWidget {
  CustomSearchAlert({
    Key? key,
    required this.textEditingController,
    required this.setLocationFunc,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final Function setLocationFunc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800.h,
      child: AlertDialog(
        backgroundColor: Colors.white,
        title: CustomTextLibreFranklin(
          subText: 'Please Enter Your Location',
          fontWeight: FontWeight.w800,
          fontSize: 18,
          color: Colors.black,
        ),
        content: CustomSearchField(
            label: 'Enter Location',
            icon: Icons.location_pin,
            iconColor: AppColors.gradientColor1,
            iconSize: 15,
            hintFontColor: AppColors.lightOrange,
            fillColor: AppColors.lightOrangeBackground,
            myController: textEditingController,
            borderWidth: 1,
            borderRadius: 15,
            hintFontSize: 18,
            hintFontWeight: FontWeight.w600,
            hintFontHeight: 1.5,
            textFontSize: 20,
            textFontWeight: FontWeight.w800,
            textFontHeight: 1.5,
            textFontColor: Colors.black),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              setLocationFunc();
            },
            child: Text(
              'Set',
              style: TextStyle(color: AppColors.gradientColor1),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Cancel', style: TextStyle(color: AppColors.gradientColor2)),
          ),
        ],
      ),
    );
  }
}
