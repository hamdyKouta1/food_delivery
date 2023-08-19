import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Widgets/custom_gradient_title.dart';
import 'package:food_delivery/Widgets/custom_text_button.dart';
import 'package:food_delivery/Widgets/custom_title_and_view_more.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Constants/MainColor.dart';
import '../../../Constants/TextColor.dart';
import '../../../Constants/app_colors.dart';
import '../../../Widgets/Custom_rounded_container_with_color.dart';
import '../../../Widgets/custom_rounded_container_with_no_minheight.dart';
import '../../../Widgets/custom_search_field.dart';
import '../../../Widgets/custom_search_helper.dart';
import '../../../Widgets/custom_shadow.dart';
import '../../../Widgets/custom_text_change_font.dart';
import '../Main View/main_view_screen.dart';
import '../Notification/notification_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

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
                                                  color:
                                                      AppColors.gradientColor1,
                                                ))),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: Get.height - 330.h,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: SizedBox(
                                                    width: Get.width - 50.w,
                                                    height: 60.h,
                                                    child: CustomSearchField(
                                                      label:
                                                          '   What do you want to Order?',
                                                      icon: Icons.search,
                                                      hintFontColor:
                                                          AppColors.lightOrange,
                                                      fillColor: AppColors
                                                          .lightOrangeBackground,
                                                      myController: fortest,
                                                      iconColor:
                                                          AppColors.lightOrange,
                                                      iconSize: 30,
                                                      borderWidth: 1,
                                                      textFontSize: 18,
                                                      textFontWeight:
                                                          FontWeight.w800,
                                                      textFontHeight: 1.5,
                                                      textFontColor:
                                                          AppColors.lightOrange,
                                                      borderRadius: 15,
                                                      hintFontSize: 12,
                                                      hintFontWeight:
                                                          FontWeight.w400,
                                                      hintFontHeight: 1,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 30.h,
                                          ),
                                          CustomTitleAndViewMore(
                                              title: 'Type',
                                              viewMore: '',
                                              viewMoreFunc: () {}),
                                          SizedBox(
                                            height: 30.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              CustomSearchHelper(
                                                onTapFunc: () {},
                                                name: 'Restaurant',
                                                width: 130,
                                              ),
                                              CustomSearchHelper(
                                                onTapFunc: () {},
                                                name: 'Menu',
                                                width: 100,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 30.h,
                                          ),
                                          CustomTitleAndViewMore(
                                              title: 'Location',
                                              viewMore: '',
                                              viewMoreFunc: () {}),
                                          SizedBox(
                                            height: 30.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              CustomSearchHelper(
                                                onTapFunc: () {},
                                                name: '1 Km',
                                                width: 100,
                                              ),
                                              CustomSearchHelper(
                                                onTapFunc: () {},
                                                name: '> 10 Km',
                                                width: 120,
                                              ),
                                              CustomSearchHelper(
                                                onTapFunc: () {},
                                                name: '< 10 Km',
                                                width: 120,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 30.h,
                                          ),
                                          CustomTitleAndViewMore(
                                              title: 'Food',
                                              viewMore: '',
                                              viewMoreFunc: () {}),
                                          SizedBox(
                                            height: 30.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              CustomSearchHelper(
                                                onTapFunc: () {},
                                                name: 'Cake',
                                                width: 100,
                                              ),
                                              CustomSearchHelper(
                                                onTapFunc: () {},
                                                name: 'soup',
                                                width: 120,
                                              ),
                                              CustomSearchHelper(
                                                onTapFunc: () {},
                                                name: 'Main Course',
                                                width: 140,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              CustomSearchHelper(
                                                onTapFunc: () {},
                                                name: 'Appetizer',
                                                width: 100,
                                              ),
                                              CustomSearchHelper(
                                                onTapFunc: () {},
                                                name: 'Dessert',
                                                width: 120,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    CustomTextButton(
                                        width: Get.width,
                                        height: 80.h,
                                        text: 'Search',
                                        textSize: 14,
                                        textFontWeight: FontWeight.w600),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: CustomGradientTitle(
                                            text: 'back',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400))
                                  ],
                                )
                              ],
                            ),

/*****************************************************************************************************/
                          ]),
                    ),
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
