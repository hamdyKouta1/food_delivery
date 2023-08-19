import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Constants/MainColor.dart';
import '../Constants/app_colors.dart';
import 'Custom_rounded_container_with_color.dart';
import 'custom_shadow.dart';
import 'custom_text_change_font.dart';

class CustomRectCard extends StatelessWidget {
  const CustomRectCard({
    required this.image,
    required this.food,
    required this.info,
    required this.price,
    Key? key,
  }) : super(key: key);
  final String price;
  final String food;
  final String info;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ShadowWidget(
        widget: CustomRoundedContainer(
            width: Get.width,
            height: 100.h,
            color: AppColors.white,
            widget: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                      width: 70.w,
                      height: 70.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: image.contains('http')
                          ? Image.network(
                              image,
                              fit: BoxFit.fill,
                            )
                          : Image.asset('assets/images/food.png')),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 140.w,
                          child: CustomTextLibreFranklin(
                              maxLines: 1,
                              subText: food,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black)),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                          width: 150.w,
                          child: CustomTextLibreFranklin(
                              maxLines: 2,
                              subText: info,
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: AppColors.grey)),
                    ],
                  ),
                  CustomTextLibreFranklin(
                      subText: price,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: AppColors.priceColor),
                  SizedBox(
                    width: 5.w,
                  ),
                ])),
        height: 200);
  }
}
