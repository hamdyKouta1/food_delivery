import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Constants/MainColor.dart';
import 'package:food_delivery/Constants/TextColor.dart';
import 'package:food_delivery/Widgets/custom_gradient_button.dart';
import 'package:food_delivery/Widgets/custom_rounded_container_with_no_minheight.dart';
import 'package:food_delivery/Widgets/custom_search_field.dart';
import 'package:food_delivery/Widgets/custom_text_change_font.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Constants/app_colors.dart';
import '../../../Widgets/custom_sub_title.dart';
import '../Google Map/gogle_map_screen.dart';

class MapScreen extends StatelessWidget {
  MapScreen({Key? key}) : super(key: key);
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const MapSample(),
          Positioned(
              height: Get.height,
              right: 25.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      SizedBox(
                        width: Get.width - 50.w,
                        height: 120.h,
                        child: CustomSearchField(
                            label: 'search a Location',
                            icon: Icons.location_pin,
                            iconColor: AppColors.lightOrange,
                            iconSize: 18,
                            hintFontColor: AppColors.lightOrange,
                            fillColor: AppColors.white,
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
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomLocationCardOfMap(
                        myLocation:
                            '4517 Washington Ave. Manchester, Kentucky 39495',
                        setLocationFunction: () {
                          Get.back();
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class CustomLocationCardOfMap extends StatelessWidget {
  CustomLocationCardOfMap({
    required this.myLocation,
    required this.setLocationFunction,
    Key? key,
  }) : super(key: key);
  final String myLocation;
  final Function setLocationFunction;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainerNoMinHeight(
      width: Get.width,
      height: 250.h,
      color: AppColors.white,
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomTextLibreFranklin(
            subText: 'Your Location',
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: AppColors.lightSubTextTitleColor,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 15.w,
              ),
              Image.asset(
                'assets/images/Pin Logo.png',
                width: 25,
                height: 25,
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: CustomTextLibreFranklin(
                    maxLines: 2,
                    color: AppColors.black,
                    subText: myLocation,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 15.w,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          GestureDetector(
            onTap: () {
              setLocationFunction();
            },
            child: CustomGradientButton(
              width: Get.width - 50.w,
              height: 80.h,
              widget: Center(
                child: CustomTextLibreFranklin(
                    color: AppColors.white,
                    subText: 'Set Location',
                    fontSize: 14,
                    fontWeight: FontWeight.w800),
              ),
            ),
          )
        ],
      ),
    );
  }
}
