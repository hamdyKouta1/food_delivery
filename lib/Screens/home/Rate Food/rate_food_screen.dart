import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Constants/TextColor.dart';
import 'package:food_delivery/Widgets/custom_chat_header.dart';
import 'package:food_delivery/Widgets/custom_gradient_button.dart';
import 'package:food_delivery/Widgets/custom_shadow.dart';
import 'package:food_delivery/custom_icons.dart';
import 'package:get/get.dart';

import '../../../../Constants/MainColor.dart';
import '../../../../Widgets/Custom_rounded_container_with_color.dart';
import '../../../../Widgets/custom_people_card.dart';
import '../../../../Widgets/custom_text_change_font.dart';
import '../../../Constants/app_colors.dart';
import '../../../Widgets/custom_search_field.dart';

class RateFoodScreen extends StatelessWidget {
  const RateFoodScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController fortest = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: Get.width,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/secPattern.png'),
              ),
              Center(
                child: SizedBox(
                  width: Get.width - 50.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /********Title And Search*******/
                      SizedBox(
                        height: 60.h,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 110.h,
                            ),
                            CircleAvatar(
                              radius: 117.w,
                              backgroundColor: AppColors.gradientColor1,
                              child: CircleAvatar(
                                radius: 110.w,
                                child: ClipOval(
                                  child: Image.asset(
                                      'assets/images/foodPhoto.jpg'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50.h,
                            ),
                            SizedBox(
                              width: Get.width,
                              child: Center(
                                child: CustomTextLibreFranklin(
                                    subText: 'Thank You !',
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black),
                              ),
                            ),
                            CustomTextLibreFranklin(
                                subText: 'Enjoy Your Meal',
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomTextLibreFranklin(
                                subText: 'Please rate your Food',
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightSubTextTitleColor),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      CustomIcons.iconStarShine,
                                      color: AppColors.priceColor,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      CustomIcons.iconStarShine,
                                      color: AppColors.priceColor,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      CustomIcons.iconYellowStar,
                                      color: AppColors.priceColor,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      CustomIcons.iconStarShine,
                                      color: AppColors.lightOrangeBackground,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      CustomIcons.iconStarShine,
                                      color: AppColors.lightOrangeBackground,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 80.h,
                            ),
                            SizedBox(
                              height: 70.h,
                              child: CustomSearchField(
                                label: '   Leave Feedback',
                                icon: CustomIcons.iconEditPen,
                                fillColor: AppColors.white,
                                myController: fortest,
                                iconColor: AppColors.gradientColor1,
                                iconSize: 25,
                                borderWidth: 1,
                                borderRadius: 15,
                                textFontSize: 20,
                                textFontWeight: FontWeight.w700,
                                textFontHeight: 1.5,
                                textFontColor: AppColors.black,
                                hintFontSize: 16,
                                hintFontWeight: FontWeight.w400,
                                hintFontHeight: .5,
                                hintFontColor: AppColors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomGradientButton(
                                    widget: Center(
                                        child: CustomTextLibreFranklin(
                                            subText: 'Submit',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.white)),
                                    width: 300.w,
                                    height: 70.h),
                                ShadowWidget(
                                    height: 70.h,
                                    widget: CustomRoundedContainer(
                                        width: 120.w,
                                        height: 70.h,
                                        color: AppColors.white,
                                        widget: CustomTextLibreFranklin(
                                            subText: 'Skip',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.gradientColor1)))
                              ],
                            )
                          ],
                        ),
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
