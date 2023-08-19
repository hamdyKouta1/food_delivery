import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Widgets/custom_gradient_button.dart';
import 'package:food_delivery/custom_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Constants/Data.dart';
import '../../../Constants/MainColor.dart';
import '../../../Constants/app_colors.dart';
import '../../../Widgets/Custom_rounded_container_with_color.dart';

import '../../../Widgets/custom_people_card.dart';
import '../../../Widgets/custom_recangular_card.dart';
import '../../../Widgets/custom_text_change_font.dart';

class VoucherPromoScreen extends StatelessWidget {
  const VoucherPromoScreen({
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
                                      onPressed: () {},
                                      icon: Icon(
                                        CustomIcons.iconPath,
                                        color: AppColors.lightOrange,
                                      ))),
                              SizedBox(
                                height: 10.h,
                              ),
                              CustomTextLibreFranklin(
                                  subText: 'Voucher Promo',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ],
                          ),
                          SizedBox(
                              width: Get.width,
                              height: Get.height - 240.h,
                              child: ListView.builder(
                                primary: false,
                                physics: const ScrollPhysics(),
                                itemCount: voucher.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 0),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: SizedBox(
                                          width: Get.width,
                                          //height: 140.h,
                                          child: Image.asset(voucher[index])),
                                    ),
                                  );
                                },
                              )),
                          Center(
                              child: CustomGradientButton(
                                  widget: Center(
                                      child: CustomTextLibreFranklin(
                                          subText: 'Check Out',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.white)),
                                  width: Get.width,
                                  height: 70.h))
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
