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
import 'custom_text_button.dart';
import 'custom_text_change_font.dart';

class CustomYourOrderProcessCard extends StatelessWidget {
  const CustomYourOrderProcessCard({
    required this.width,
    required this.title,
    required this.subTitle,
    required this.buttonText,
    required this.price,
    required this.imagePath,
    required this.processFunction,
    Key? key,
  }) : super(key: key);

  final Function processFunction;
  final String imagePath;
  final String price;
  final String title;
  final String subTitle;
  final String buttonText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
            width: width.w,
            //height: 140.h,
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
                          height: 70.w,
                          color: AppColors.white,
                          widget: Container(
                              width: 75.w,
                              height: 70.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: imagePath.contains('http')
                                  ? Image.network(
                                      imagePath,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset('assets/images/food.png')),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        SizedBox(
                          height: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextLibreFranklin(
                                  subText: title,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black),
                              SizedBox(
                                height: 5.h,
                              ),
                              SizedBox(
                                  width: 120.w,
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
                          width: 130.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  processFunction();
                                },
                                child: CustomTextButton(
                                  width: 140.w,
                                  height: 45.h,
                                  text: buttonText,
                                  textSize: 14,
                                  textFontWeight: FontWeight.w500,
                                ),
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
