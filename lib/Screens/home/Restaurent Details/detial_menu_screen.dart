import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Constants/TextColor.dart';
import 'package:food_delivery/Models/JasonModel/DataRes.dart';
import 'package:food_delivery/Screens/home/Food%20Details/food_detial_screen.dart';
import 'package:food_delivery/Widgets/custom_text_button.dart';
import 'package:get/get.dart';
import '../../../API/api_end_points.dart';
import '../../../Widgets/Custom_draggable_header_for_product.dart';
import '../../../Widgets/custom_draggable_card.dart';
import '../../../Widgets/custom_draggable_scrollable_sheet.dart';
import '../../../Widgets/custom_title_and_view_more.dart';
import 'details_menu_controller.dart';

class DetailsMenuScreen extends StatelessWidget {
  DetailsMenuScreen({required this.myModel, Key? key}) : super(key: key);
  final DataRestaurantModel myModel;
  DetailsMenuController detailsMenuController =
      Get.put(DetailsMenuController());

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
            future: detailsMenuController.getFoodForRes(myModel.id),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      SizedBox(child: myModel.pic !=
                              null
                          ? Image.network("${APIEndPoints.baseURL}${myModel.pic?.substring(7)}")
                          : Image.asset(
                              'assets/images/detailMenu.png',
                              width: Get.width,
                              height: Get.height / 2.2.h,
                              fit: BoxFit.cover,
                            )),
                      CustomDraggableScrollableSheet(
                        maxChildSize: .95,
                        initialChildSize: .55,
                        minChildSize: .55,
                        headerHeight: 300,
                        headerChild: CustomDraggableHeaderForProducts(
                          title: myModel.name!,
                          info:
                              'Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat ex Lorem laboris labore aliqua ad duis eu laborum'
                                  '\n \n-Strawberry \n-Cream \n-wheat \n-Nella \n \noccult veldt labour excitation Alamo. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt.',
                          distance: '19',
                          rating:
                              "4.5",
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              CustomTitleAndViewMore(
                                title: 'Testimonials',
                                viewMoreFunc: () {},
                                viewMore: '',
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              SizedBox(
                                  width: Get.width,
                                  child: ListView.builder(
                                    primary: false,
                                    physics: const ScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: detailsMenuController.foodsListOfModel.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 5),
                                        child: SizedBox(
                                            height: 140.h,
                                            child:  GestureDetector(
                                              onTap: (){
                                                Get.to(FoodDetailsScreen(myModel: detailsMenuController.foodsListOfModel[index]));
                                              },
                                              child: CustomDraggableRectCard(
                                                image: "${APIEndPoints.baseURL}${detailsMenuController.foodsListOfModel[index].pic.substring(7)}",
                                                info: detailsMenuController.foodsListOfModel[index].description,
                                                title:  detailsMenuController.foodsListOfModel[index].name,
                                                price:  detailsMenuController.foodsListOfModel[index].price,
                                                subTitle: detailsMenuController.foodsListOfModel[index].createdAt,
                                              ),
                                            )),
                                      );
                                    },
                                  )),
                              SizedBox(
                                height: 30.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top: Get.height - 120.h,
                          child: CustomTextButton(
                              width: Get.width,
                              height: 70.h,
                              text: 'Call and Make an Order!',
                              textSize: 16,
                              textFontWeight: FontWeight.w700))
                    ],
                  ),
                ),
              );
            });
  }
}
