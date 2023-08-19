import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Constants/TextColor.dart';
import 'package:food_delivery/Widgets/custom_rounded_container_with_no_minheight.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Constants/MainColor.dart';
import '../Constants/app_colors.dart';
import 'Custom_rounded_container_with_color.dart';
import 'custom_shadow.dart';
import 'custom_text_change_font.dart';

class CustomDraggableRectCard extends StatelessWidget {
  const CustomDraggableRectCard({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.info,
    required this.price,
    Key? key,
  }) : super(key: key);
  final String price;
  final String title;
  final String subTitle;
  final String info;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ShadowWidget(
        widget: CustomRoundedContainer(
            width: Get.width,
            height: 100.h,
            color: AppColors.white,
            widget: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: Get.width - 50,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: 70.w,
                            height: 70.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.network(
                              image,
                              fit: BoxFit.cover,
                            )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 120,
                                child: CustomTextLibreFranklin(
                                    subText: title,
                                    maxLines: 1,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black)),
                            SizedBox(
                              height: 7.h,
                            ),
                            SizedBox(
                              width: 120,
                              child: CustomTextLibreFranklin(
                                subText: subTitle,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: AppColors.grey,
                                maxLines: 1,
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Center(
                              child: SizedBox(
                                  width: Get.width - 300.w,
                                  child: CustomTextLibreFranklin(
                                      subText: info,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.black)),
                            ),
                          ],
                        ),
                        CustomRoundedContainerNoMinHeight(
                          width: 80.w,
                          height: 45.h,
                          color: AppColors.selectedTab,
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.gradientColor1,
                                size: 17,
                              ),
                              CustomTextLibreFranklin(
                                  subText: price,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.gradientColor1),
                            ],
                          ),
                        ),
                      ]),
                ),
              ],
            )),
        height: 200);
  }
}
