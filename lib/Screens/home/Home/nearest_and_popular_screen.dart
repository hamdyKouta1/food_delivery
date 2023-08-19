import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/API/api_end_points.dart';
import 'package:food_delivery/Screens/home/Home/home_controller.dart';
import 'package:food_delivery/Widgets/custom_text_change_font.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Constants/MainColor.dart';
import '../../../Constants/app_colors.dart';
import '../../../Widgets/CustomLoadingWidget.dart';
import '../../../Widgets/custom_card.dart';
import '../../../Widgets/custom_recangular_card.dart';
import '../../../Widgets/custom_title_and_view_more.dart';
import '../Food Details/food_detial_screen.dart';

class NearestAndPopularScreen extends StatelessWidget {
  NearestAndPopularScreen({Key? key}) : super(key: key);
  HomeController hController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              SizedBox(
                child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                        'assets/images/Promo Advertising.png')),
              ),
              SizedBox(
                height: 40.h,
              ),
              CustomTitleAndViewMore(title: 'Nearest Restaurant',
                  viewMore: 'View More',
                  viewMoreFunc: () {
                    hController.updateMyNumber(1);
                  }),
              SizedBox(
                height: 30.h,
              ),
              GetBuilder<HomeController>(
                  builder: (controller) => Container(
                    color: AppColors.white,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 188.h,
                        // aspectRatio: 3/ 3,
                        viewportFraction: 0.4,
                      ),
                      items: controller.counterForRes.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return  Padding(
                              padding: const EdgeInsets.only(top: 2, bottom: 2),
                              child: GestureDetector(
                                    onTap:(){
                                      controller.selectedCard(controller.restaurantListOfModel[i]);
                                    } ,
                                    child: CustomCard(
                                      image:"${APIEndPoints.baseURL}${controller.restaurantListOfModel[i].pic.substring(7)}",
                                      restaurantName: controller.restaurantListOfModel[i].name,
                                      time:'${controller.restaurantListOfModel[i].deliveryTime} \$',
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  )),
              SizedBox(
                height: 50.h,
              ),
              CustomTitleAndViewMore(title: 'Popular Menu',
                  viewMore: 'View More',
                  viewMoreFunc: () {
                    hController.updateMyNumber(2);
                  }),
              SizedBox(
                height: 10.h,
              ),
              GetBuilder<HomeController>(
                  builder: (controller) => SizedBox(
                  width: Get.width,
                  child: ListView.builder(
                    // primary: false,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.foodsListOfModel.isEmpty? controller.foodsListOfModel.length:5,//hController.productsListOfModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        child:     GestureDetector(
                          onTap: (){
                            Get.to(FoodDetailsScreen(myModel: controller.foodsListOfModel[index]));


                          },
                          child: SizedBox(
                              height: 100.h,
                              child: CustomRectCard(
                                image:"${APIEndPoints.baseURL}${controller.foodsListOfModel[index].pic.substring(7)}",
                                info: controller.foodsListOfModel[index].description,
                                food: controller.foodsListOfModel[index].name,
                                price: ' \$${controller.foodsListOfModel[index].price}',)),
                        ),
                      );
                    },
                  )
              )),
              GestureDetector(
                  onTap: (){
                    hController.updateMyNumber(2);
                  },
                  child: CustomTextLibreFranklin(subText: "View more", fontSize: 18, fontWeight: FontWeight.w600, color: Colors.orange)),
              SizedBox(
                height: 30.h,
              ),

            ],
          );
  }
}
