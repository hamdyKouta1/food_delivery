import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Constants/app_colors.dart';
import 'package:food_delivery/Screens/home/Main%20View/main_view_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../API/api_end_points.dart';
import '../../../Widgets/custom_gradient_title.dart';
import '../../../Widgets/custom_recangular_card.dart';
import '../../../Widgets/custom_text_change_font.dart';
import '../../home/Home/remove_controller.dart';

class RemoveScreen extends StatelessWidget {
  RemoveScreen({Key? key}) : super(key: key);
  RemoveController homeController = Get.put(RemoveController());

  @override
  Widget build(BuildContext context) {
    homeController.getRestaurant();
    homeController.getFood();
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    const CustomGradientTitle(
                      text: 'Tap To Remove Restaurant  \nOr Food',
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: AppColors.gradientColor1,
                            width: 2,
                          )),
                      width: Get.width,
                      height: (Get.height / 2) - 140,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextLibreFranklin(
                              subText: "Food",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.red),
                          const SizedBox(
                            height: 5,
                          ),
                          GetBuilder<RemoveController>(
                            builder: (controller) => SizedBox(
                              width: Get.width,
                              height: (Get.height / 2) - 180,
                              child: ListView.builder(
                                // primary: false,
                                physics: const ScrollPhysics(),
                                itemCount: controller.foodsListOfModel.isEmpty
                                    ? controller.foodsListOfModel.length
                                    : controller.foodsListOfModel.length,
                                //hController.productsListOfModel.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    child: GestureDetector(
                                      onTap: () {
                                        homeController.removeFood(
                                            controller.foodsListOfModel[index].id,
                                            index);
                                      },
                                      child: SizedBox(
                                          height: 100.h,
                                          child: CustomRectCard(
                                            image:
                                                "${APIEndPoints.baseURL}${controller.foodsListOfModel[index].pic.substring(7)}",
                                            info: controller.foodsListOfModel[index]
                                                .description,
                                            food: controller
                                                .foodsListOfModel[index].name,
                                            price:
                                                ' \$${controller.foodsListOfModel[index].price}',
                                          )),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: AppColors.gradientColor1,
                              width: 2,
                            )),
                        width: Get.width,
                        height: (Get.height / 2) - 140,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextLibreFranklin(
                                subText: "Restaurant",
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.red),
                            const SizedBox(
                              height: 5,
                            ),
                            GetBuilder<RemoveController>(
                              builder: (controller) => SizedBox(
                                width: Get.width,
                                height: (Get.height / 2) - 180,
                                child: ListView.builder(
                                  // primary: false,
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemCount:
                                      controller.restaurantListOfModel.isEmpty
                                          ? controller.restaurantListOfModel.length
                                          : controller.restaurantListOfModel.length,
                                  //hController.productsListOfModel.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      child: GestureDetector(
                                        onTap: () {
                                          homeController.removeRes(
                                              controller
                                                  .restaurantListOfModel[index].id,
                                              index);
                                        },
                                        child: SizedBox(
                                            height: 100.h,
                                            child: CustomRectCard(
                                              image:
                                                  "${APIEndPoints.baseURL}${controller.restaurantListOfModel[index].pic.substring(7)}",
                                              info: '',
                                              food: controller
                                                  .restaurantListOfModel[index]
                                                  .name,
                                              price: '',
                                            )),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      onTap: (){
                      Get.offAll(ViewScreen());
                      },
                      child: SizedBox(
                        width: 120.w,
                        height: 70,
                        child: Center(
                          child: CustomTextLibreFranklin(
                              subText: "Done",
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColors.gradientColor1),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
    ));
  }
}
