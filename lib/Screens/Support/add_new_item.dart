import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Screens/Support/add/add_food.dart';
import 'package:food_delivery/Screens/Support/add/add_res.dart';
import 'package:food_delivery/Screens/Support/add/remove.dart';
import 'package:food_delivery/Widgets/custom_sub_title.dart';
import 'package:food_delivery/Widgets/custom_text_change_font.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../Constants/app_colors.dart';
import '../../../../Widgets/custom_rounded_container_with_no_minheight.dart';
import '../../../../Widgets/custom_shadow.dart';
import 'package:food_delivery/Screens/home/Order%20Details/order_details_controller.dart';

class AddNewItemScreen extends StatelessWidget {
  AddNewItemScreen({
    Key? key,
  }) : super(key: key);
  @immutable
  OrderDetailsController oController = Get.put(OrderDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 30.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 50.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        const CustomSubTitle(
                            subText: 'Add New Restaurant \nFood',
                            fontSize: 25,
                            fontWeight: FontWeight.w800),
                        SizedBox(
                          height: 30.h,
                        ),
                        const CustomSubTitle(
                            subText:
                                'adding new restaurant make your business grow \n\nyour business grow ',
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: 30.h,
                        ),
                      ],
                    ),
                  ),
                ),
                ShadowWidget(
                  height: 200.h,
                  widget: Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(AddRestaurantScreen());
                      },
                      child: CustomRoundedContainerNoMinHeight(
                        height: 200.h,
                        width: Get.width,
                        color: AppColors.white,
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 80.w,
                              height: 80.h,
                              child:
                                  Image.asset('assets/images/dining-room.png'),
                            ),
                            CustomTextLibreFranklin(
                                subText: "add New Restaurant ",
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                ShadowWidget(
                  height: 200.h,
                  widget: Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(AddFoodScreen());
                      },
                      child: CustomRoundedContainerNoMinHeight(
                        height: 200.h,
                        width: Get.width,
                        color: AppColors.white,
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 80.w,
                              height: 80.h,
                              child: Image.asset('assets/images/burger.png'),
                            ),
                            CustomTextLibreFranklin(
                                subText: "add New Food ",
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                ShadowWidget(
                  height: 200.h,
                  widget: Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(RemoveScreen());
                      },
                      child: CustomRoundedContainerNoMinHeight(
                        height: 200.h,
                        width: Get.width,
                        color: AppColors.white,
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 80.w,
                              height: 80.h,
                              child: Image.asset('assets/images/remove.png',fit: BoxFit.cover,),
                            ),
                            CustomTextLibreFranklin(
                                subText: "Remove Food Or Restaurant ",
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
