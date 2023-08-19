import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Constants/MainColor.dart';
import '../Constants/TextColor.dart';
import '../Constants/app_colors.dart';
import '../custom_icons.dart';
import 'Custom_rounded_container_with_color.dart';
import 'custom_gradient_title.dart';
import 'custom_shadow.dart';
import 'custom_text_change_font.dart';

class CustomOrderQuantityCard extends StatelessWidget {
  CustomOrderQuantityCard({
    required this.title,
    required this.subTitle,
    required this.price,
    required this.imagePath,
    required this.minFunc,
    required this.plusFunc,
    required this.quantity,
    Key? key,
  }) : super(key: key);

  final Function minFunc;
  final Function plusFunc;
  final String imagePath;
  final String price;
  final String title;
  final String subTitle;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
            width: Get.width,
            height: 110.h,
            child: ShadowWidget(
              height: 110.h,
              widget: CustomRoundedContainer(
                  width: Get.width,
                  height: 110.h,
                  color: AppColors.white,
                  widget: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 5.w,
                        ),
                        CustomRoundedContainer(
                            width: 75.w,
                            height: 75.h,
                            color: AppColors.white,
                            widget: Image.network(imagePath)),
                        SizedBox(
                          width: 10.w,
                        ),
                        SizedBox(
                          height: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 135.w,
                                  child: CustomTextLibreFranklin(
                                      subText: title,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black)),
                              SizedBox(
                                height: 5.h,
                              ),
                              SizedBox(
                                  width: 135.w,
                                  child: CustomTextLibreFranklin(
                                      subText: subTitle,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w100,
                                      color: AppColors.subTextTitleColor)),
                              SizedBox(
                                height: 5.h,
                              ),
                              CustomGradientTitle(
                                  text: '\$ $price',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 150.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  minFunc();
                                },
                                child: Container(
                                  width: 35.w,
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    color: AppColors.selectedTab,
                                  ),
                                  child: Icon(
                                    CustomIcons.iconMinus,
                                    color: AppColors.gradientColor1,
                                  ),
                                ),
                              ),
                              CustomTextLibreFranklin(
                                  subText: quantity.toString(),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.black),
                              GestureDetector(
                                onTap: () {
                                  plusFunc();
                                },
                                child: Container(
                                    width: 35.w,
                                    height: 35.h,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      color: AppColors.gradientColor1,
                                    ),
                                    child: Icon(
                                      CustomIcons.iconPlus,
                                      color: AppColors.white,
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            )

            // Image.asset(voucher[index]),
            ),
      ),
    );
  }
}
