import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_delivery/Constants/TextColor.dart';
import 'package:food_delivery/Screens/home/Order%20Details/order_details_controller.dart';
import 'package:food_delivery/Screens/home/Payments%20Confirm/payment_screen.dart';
import 'package:food_delivery/custom_icons.dart';
import 'package:get/get.dart';
import '../../../API/api_end_points.dart';
import '../../../Constants/MainColor.dart';
import '../../../Constants/app_colors.dart';
import '../../../Widgets/custom_order_quantity_card.dart';
import '../../../Widgets/custom_place_my_order.dart';
import '../../../Widgets/custom_text_change_font.dart';

class OrderDetailsScreen extends StatelessWidget {
  OrderDetailsScreen({
    Key? key,
  }) : super(key: key);
  @immutable
  OrderDetailsController oController = Get.put(OrderDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Obx(() => oController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: AppColors.gradientColor1,
                color: AppColors.gradientColor2,
              ),
            )
          : SizedBox(
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
                                    SizedBox(
                                      height: 18.h,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        oController.getOrder();
                                      },
                                      onDoubleTap: () {},
                                      child: CustomTextLibreFranklin(
                                          subText: 'Order Details',
                                          fontSize: 32,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                GetBuilder<OrderDetailsController>(
                                  builder:(controller) => SizedBox(
                                  width: Get.width,
                                  height: Get.height - 430.h,
                                  child: oController
                                          .isListEmpty.value
                                      ? SizedBox()
                                      : ListView.builder(
                                          primary: false,
                                          physics: const ScrollPhysics(),
                                          itemCount: oController
                                              .foodsOrderListOfModel.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Column(
                                              children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius.all(
                                                              Radius.circular(
                                                                  15)),
                                                      color: AppColors.priceColor,
                                                    ),
                                                    child: Slidable(
                                                      endActionPane: ActionPane(
                                                          motion:
                                                              const BehindMotion(),
                                                          children: [
                                                            SlidableAction(
                                                              borderRadius: const BorderRadius
                                                                      .only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          15),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          15)),
                                                              icon: CustomIcons
                                                                  .iconTrash,
                                                              foregroundColor:
                                                                  Colors.white,
                                                              backgroundColor:
                                                              AppColors.priceColor,
                                                              onPressed:
                                                                  (BuildContext
                                                                      context) {
                                                                oController
                                                                    .updateOnRemove(
                                                                        index);
                                                              },
                                                              spacing: 0,
                                                            ),
                                                          ]),
                                                      child: GetBuilder<
                                                          OrderDetailsController>(
                                                        builder: (controller) =>
                                                            CustomOrderQuantityCard(
                                                          title: oController
                                                              .foodsOrderListOfModel[
                                                                  index]
                                                              .name,
                                                          subTitle: oController
                                                              .foodsOrderListOfModel[
                                                                  index]
                                                              .description,
                                                          price: (double.parse(oController
                                                                      .foodsOrderListOfModel[
                                                                          index]
                                                                      .price) *
                                                                  double.parse(oController
                                                                      .orderListOfModel[
                                                                          index]
                                                                      .quantity))
                                                              .toStringAsFixed(
                                                                  2),
                                                          imagePath:
                                                              "${APIEndPoints.baseURL}${oController.foodsOrderListOfModel[index].pic.substring(7)}",
                                                          minFunc: () {
                                                            oController.minFunc(
                                                                index,
                                                                int.parse(oController
                                                                    .orderListOfModel[
                                                                        index]
                                                                    .quantity));
                                                          },
                                                          plusFunc: () {
                                                            oController.plusFunc(
                                                                index,
                                                                int.parse(oController
                                                                    .orderListOfModel[
                                                                        index]
                                                                    .quantity),
                                                                20,
                                                                context);
                                                          },
                                                          quantity: int.parse(
                                                              oController
                                                                  .orderListOfModel[
                                                                      index]
                                                                  .quantity),
                                                        ),
                                                      ),
                                                    )),
                                                SizedBox(
                                                  height: 10.h,
                                                )
                                              ],
                                            );
                                          },
                                        ),
                                ),),
                                SizedBox(
                                  height: 1.h,
                                ),
                                GetBuilder<OrderDetailsController>(
                                  builder: (controller) => CustomPlaceMyOrder(
                                      subTotal: oController.subTotal
                                          .toStringAsFixed(2),
                                      deliveryCharge: '10',
                                      discount: (.05 * oController.subTotal)
                                          .toStringAsFixed(2),
                                      total: (oController.subTotal +
                                              10 -
                                              (.05 * oController.subTotal))
                                          .toStringAsFixed(2),
                                      placeMyOrder: () {
                                        Get.to( PaymentConfirmScreen(
                                            subtotal: oController.subTotal
                                            .toStringAsFixed(2),
                                            total: (oController.subTotal +
                                        10 - (.05 * oController.subTotal))
                                            .toStringAsFixed(2),
                                            delivery: '10',
                                          discount: (.05 * oController.subTotal)
                                              .toStringAsFixed(2),

                                        ));
                                      }),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
    );
  }
}
