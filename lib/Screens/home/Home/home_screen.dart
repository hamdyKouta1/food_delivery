import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Screens/home/Home/search_screen.dart';
import 'package:food_delivery/Screens/home/Notification/notification_screen.dart';
import 'package:get/get.dart';
import '../../../Constants/app_colors.dart';
import '../../../Widgets/Custom_rounded_container_with_color.dart';
import '../../../Widgets/custom_search_field.dart';
import '../../../Widgets/custom_shadow.dart';
import '../../../Widgets/custom_text_change_font.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);
  HomeController hController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
   // hController.getProducts();
   // hController.getRestaurant();

 //   print(hController.products.length);
    TextEditingController fortest = TextEditingController();

    return SingleChildScrollView(
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
                                               Get.to(const NotificationScreen());
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
                                                myController: fortest,
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
                                             Get.to(const SearchScreen());
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
                                height: 30.h,
                              ),
                            ],
                          ),
                          /********Title And Search*******/

                          /********Main Popular Nearest Popular Menu*******/
                          GetBuilder<HomeController>(
                              builder: (controller) => controller
                                  .returnScreen(hController.myPageNumber))

                          /********Main Popular Nearest Popular Menu*******/

/*****************************************************************************************************/
                        ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
