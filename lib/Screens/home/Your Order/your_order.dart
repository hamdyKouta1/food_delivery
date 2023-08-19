import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Screens/home/Your%20Order/your_order_controller.dart';
import 'package:food_delivery/Widgets/custom_text_button.dart';
import 'package:food_delivery/Widgets/custom_your_order_process_card.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../API/api_end_points.dart';
import '../../../Constants/MainColor.dart';
import '../../../Constants/TextColor.dart';
import '../../../Constants/app_colors.dart';
import '../../../Widgets/Custom_rounded_container_with_color.dart';
import '../../../Widgets/custom_search_field.dart';
import '../../../Widgets/custom_shadow.dart';
import '../../../Widgets/custom_text_change_font.dart';
import '../Home/search_screen.dart';
import '../Notification/notification_screen.dart';

class YourOrderScreen extends StatelessWidget {
   YourOrderScreen({
    Key? key,
  }) : super(key: key);
  YourOrderController yourOrderController = Get.put(YourOrderController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Obx(
        ()=> yourOrderController.isLoading.value
            ? Center(
          child: CircularProgressIndicator(
            backgroundColor: AppColors.gradientColor1,
            color: AppColors.gradientColor2,
          ),
        )
            : SingleChildScrollView(
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
                    child: Center(
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /********Title And Search*******/
                              Column(
                                children: [
                                  SizedBox(
                                    height: 80.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                       CustomTextLibreFranklin(
                                          subText: 'Find Your \nFavorite Food',
                                          fontSize: 32,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                      ShadowWidget(
                                        height: 50.h,
                                        widget: Center(
                                          child: CircleAvatar(
                                              radius: 20,
                                              backgroundColor: Colors.white,
                                              child: IconButton(
                                                  onPressed: () {
                                                    Get.to(NotificationScreen());
                                                  },
                                                  icon: Icon(
                                                    CupertinoIcons.bell,
                                                    color: AppColors.gradientColor1,
                                                  ))),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          width: Get.width - 120.w,
                                          height: 60.h,
                                          child: CustomSearchField(
                                            label:
                                            '   What do you want to Order?',
                                            icon: Icons.search,
                                            hintFontColor: AppColors.lightOrange,
                                            fillColor:
                                            AppColors.lightOrangeBackground,
                                            myController: yourOrderController.fortest,
                                            iconColor: AppColors.lightOrange,
                                            iconSize: 30,
                                            borderWidth: 1,
                                            textFontSize: 18,
                                            textFontWeight: FontWeight.w800,
                                            textFontHeight: 1.5,
                                            textFontColor: AppColors.lightOrange,
                                            borderRadius: 15,
                                            hintFontSize: 12,
                                            hintFontWeight: FontWeight.w400,
                                            hintFontHeight: 1,
                                          )),
                                      GestureDetector(
                                          onTap: () {
                                            Get.to(SearchScreen());
                                          },
                                          child: CustomRoundedContainer(
                                            width: 60,
                                            height: 58,
                                            color: AppColors.lightOrangeBackground,
                                            widget: Image.asset(
                                                'assets/images/Filter Icon.png'),
                                          )),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 5.h,
                                  ),
                                ],
                              ),
                              /********Title And Search*******/

                              /********Main Popular Nearest Popular Menu*******/
                              Column(
                                  children: [
                                    SizedBox(
                                        width: Get.width,
                                        height: Get.height-350.h,
                                        child:yourOrderController
                                            .isListEmpty.value
                                            ? SizedBox()
                                            : ListView.builder(
                                          primary:false ,
                                          physics: const ScrollPhysics(),
                                          itemCount: yourOrderController.foodsOrderListOfModel.length,
                                          shrinkWrap: true,
                                          itemBuilder: (BuildContext context, int index) {
                                            return   GetBuilder<YourOrderController>(  builder: (controller) =>Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 0),
                                              child: SizedBox(
                                                  height: 100.h,
                                                  child: CustomYourOrderProcessCard(
                                                      width: Get.width,
                                                      title: yourOrderController.foodsOrderListOfModel[index].name,
                                                      subTitle: yourOrderController.foodsOrderListOfModel[index].description,
                                                      price: (double.parse(yourOrderController
                                                          .foodsOrderListOfModel[
                                                      index]
                                                          .price) *
                                                          double.parse(yourOrderController
                                                              .orderListOfModel[
                                                          index]
                                                              .quantity)).toStringAsFixed(2),
                                                    imagePath: "${APIEndPoints.baseURL}${yourOrderController.foodsOrderListOfModel[index].pic.substring(7)}",
                                                    processFunction: (){}, buttonText: 'Process',),

                                            ),
                                            ));
                                          },
                                        ),
                                    )

                                  ],
                                ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Center(child: GestureDetector(
                                  onTap: (){
                                    yourOrderController.checkOut(context);

                                  },
                                  child: CustomTextButton(width: Get.width, height: 80.h, text: 'Check Out', textSize: 16, textFontWeight: FontWeight.w600)))

/*****************************************************************************************************/
                            ]
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