import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Models/JasonModel/DataFood.dart';
import 'package:food_delivery/Widgets/custom_text_button.dart';
import 'package:get/get.dart';
import '../../../API/api_end_points.dart';
import '../../../Widgets/Custom_draggable_header_for_product.dart';
import '../../../Widgets/custom_checked_tag.dart';
import '../../../Widgets/custom_draggable_scrollable_sheet.dart';
import '../../../Widgets/custom_quantity_bar.dart';
import '../../../Widgets/custom_title_and_view_more.dart';
import 'food_details_controller.dart';

class FoodDetailsScreen extends StatelessWidget {
  FoodDetailsScreen({required this.myModel, Key? key}) : super(key: key);
  final DataFoodModel myModel;
  FoodDetailsController foodDetailsController =
      Get.put(FoodDetailsController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: foodDetailsController.getFoodForRes(myModel.id),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  SizedBox(
                      child: myModel.pic != null
                          ? Image.network(
                              "${APIEndPoints.baseURL}${myModel.pic?.substring(7)}")
                          : Image.asset(
                              'assets/images/detailMenu.png',
                              width: Get.width,
                              height: Get.height / 2.2.h,
                              fit: BoxFit.cover,
                            )),
                  CustomDraggableScrollableSheet(
                    maxChildSize: .95,
                    initialChildSize: .62,
                    minChildSize: .62,
                    headerHeight: 300,
                    headerChild: CustomDraggableHeaderForProducts(
                      title: myModel.name!,
                      info:
                          'Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat ex Lorem laboris labore aliqua ad duis eu laborum'
                          '\n \n-Strawberry \n-Cream \n-wheat \n-Nella \n \noccult veldt labour excitation Alamo. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt.',
                      distance: '19',
                      rating: "4.5",
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomTitleAndViewMore(
                            title: 'Details',
                            viewMoreFunc: () {},
                            viewMore: '',
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                              width: Get.width,
                              child: Column(
                                children: [
                                  GetBuilder<FoodDetailsController>(
                                      builder: (controller) =>
                                          CustomQuantityBar(
                                            title: 'Quantity',
                                            quantity: controller.quantity,
                                            plus: () {
                                              controller.plusFunc(18, context);
                                            },
                                            min: () {
                                              controller.minFunc();
                                            },
                                          ),
                                  ),
                                  SizedBox(
                                    width: Get.width - 100,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        GetBuilder<FoodDetailsController>(
                                            builder: (controller) =>
                                                (LabeledCheckbox(
                                                  label: 'Combo ',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                  value: controller.checked3,
                                                  onTapMe: () {
                                                    controller.checked3 =
                                                        !controller.checked3;

                                                    controller.update();
                                                  },
                                                ))),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        GetBuilder<FoodDetailsController>(
                                            builder: (controller) =>
                                                (LabeledCheckbox(
                                                  label: 'Extra Chess',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                  value: controller.checked1,
                                                  onTapMe: () {
                                                    controller.checked1 =
                                                        !controller.checked1;
                                                    controller.update();
                                                  },
                                                ))),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        GetBuilder<FoodDetailsController>(
                                            builder: (controller) =>
                                                (LabeledCheckbox(
                                                  label: 'Add Onion',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                  value: controller.checked2,
                                                  onTapMe: () {
                                                    controller.checked2 =
                                                        !controller.checked2;
                                                    controller.update();
                                                  },
                                                ))),
                                      ],
                                    ),
                                  ),
                                ],
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
                      child: GetBuilder<FoodDetailsController>(
                          builder: (controller) => GestureDetector(
                                onTap: () {
                                  controller.quantity == 0
                                      ? controller.yummy()
                                      : controller.makeOrder(
                                          myModel.id!.toString(),
                                          controller.quantity.toString(),
                                          myModel,
                                          context);
                                },
                                child: CustomTextButton(
                                    width: Get.width - 100.w,
                                    height: 70.h,
                                    text: controller.quantity == 0
                                        ? "Yummy !"
                                        : "${double.parse(myModel.price!) * controller.quantity} \$",
                                    textSize: 16,
                                    textFontWeight: FontWeight.w700),
                              )))
                ],
              ),
            ),
          );
        });
  }
}


