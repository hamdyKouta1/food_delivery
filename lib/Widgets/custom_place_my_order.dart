import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Constants/MainColor.dart';
import '../Constants/TextColor.dart';
import '../Constants/app_colors.dart';
import 'Custom_rounded_container_with_color.dart';
import 'custom_gradient_button.dart';
import 'custom_row_detials.dart';
import 'custom_text_change_font.dart';

class CustomPlaceMyOrder extends StatelessWidget {
  const CustomPlaceMyOrder({
    required this.subTotal,
    required this.deliveryCharge,
    required this.discount,
    required this.total,
    required this.placeMyOrder,
    Key? key,
  }) : super(key: key);
  final String subTotal;
  final String deliveryCharge;
  final String discount;
  final String total;
  final Function placeMyOrder;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomGradientButton(
        width: Get.width,
        height: 230.h,
        widget: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              image: AssetImage(
                  "assets/images/buttonPattern.png"),
              fit: BoxFit.contain,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 15.h,
              ),
              CustomRowDetailsPrice(
                title: 'sub-Total',
                price: subTotal,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomRowDetailsPrice(
                title: 'Delivery Charge',
                price: deliveryCharge,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomRowDetailsPrice(
                title: 'Discount',
                price: discount,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomRowDetailsPrice(
                title: 'Total',
                price: total,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {
                  placeMyOrder();
                },
                child: CustomRoundedContainer(
                  width: Get.width - 25.w,
                  height: 60.h,
                  color: AppColors.white,
                  widget: Center(
                    child: CustomTextLibreFranklin(
                        subText: 'Place My Order',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.gradientColor1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
