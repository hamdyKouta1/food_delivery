import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Widgets/Custom_rounded_container_with_color.dart';
import 'package:get/get.dart';
import '../../../../Constants/MainColor.dart';
import '../../../../Widgets/custom_shadow.dart';
import '../../../Constants/app_colors.dart';
import '../../../Widgets/custom_text_change_font.dart';

import 'package:food_delivery/custom_icons.dart';

class PaymentEditScreen extends StatelessWidget {
  const PaymentEditScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: Get.width,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/Pattern.png'),
              ),
              Center(
                child: SizedBox(
                  width: Get.width - 50.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /********Title And Search*******/
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 60.h,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomRoundedContainer(
                                width: 50,
                                height: 48,
                                color: AppColors.lightOrangeBackground,
                                widget: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    CustomIcons.iconPath,
                                    color: AppColors.lightOrange,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              CustomTextLibreFranklin(
                                  subText: 'Payment',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          SizedBox(
                              width: Get.width,
                              height: Get.height - 380.h,
                              child: Column(
                                children: [
                                  CustomPaymentEditCard(
                                    imagePath: 'assets/images/paypalLogo.png',
                                    imageSize: 30,
                                    cardNumber: '2121 6352 8465 ****',
                                    color: AppColors.white,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  CustomPaymentEditCard(
                                    imagePath: 'assets/images/visaLogo.png',
                                    imageSize: 75,
                                    cardNumber: '2121 6352 8465 ****',
                                    color: AppColors.nonActiveTap,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  CustomPaymentEditCard(
                                    imagePath: 'assets/images/PayoneerLogo.png',
                                    imageSize: 40,
                                    cardNumber: '2121 6352 8465 ****',
                                    color: AppColors.nonActiveTap,
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ],
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: imageSize.h,
                        child: Image.asset(imagePath),
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
        ));
  }
}
