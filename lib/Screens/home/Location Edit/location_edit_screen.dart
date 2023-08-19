import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Widgets/Custom_rounded_container_with_color.dart';
import 'package:get/get.dart';
import '../../../../Constants/MainColor.dart';
import '../../../../Widgets/custom_shadow.dart';
import '../../../Constants/app_colors.dart';
import '../../../Widgets/custom_edit_location_card.dart';
import '../../../Widgets/custom_edit_payment_card.dart';
import '../../../Widgets/custom_set_location_card.dart';
import '../../../Widgets/custom_text_change_font.dart';

import 'package:food_delivery/custom_icons.dart';

import '../My Map/map_screen.dart';

class LocationEditScreen extends StatelessWidget {
  const LocationEditScreen({
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
                                  subText: 'Location',
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
                              child: Column(
                                children: [
                                  const CustomChangeLocationCard(
                                    info:
                                        '8502 Preston Rd. Inglewood, Maine 98380',
                                    cardTitle: 'Deliver To',
                                    imagePath: 'assets/images/locationIcon.png',
                                    imageSize: 25,
                                  ),
                                  CustomSetNewLocationCard(
                                    info:
                                        '8502 Preston Rd. Inglewood, Maine 98380',
                                    cardTitle: 'Deliver To',
                                    imagePath: 'assets/images/locationIcon.png',
                                    imageSize: 25,
                                    setLocationFunc: () {
                                      Get.to(MapScreen());
                                    },
                                  )
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
