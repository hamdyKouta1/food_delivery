import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Widgets/custom_title_and_view_more.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../API/api_end_points.dart';
import '../../../Constants/MainColor.dart';
import '../../../Widgets/custom_card.dart';
import '../../../Widgets/custom_text_change_font.dart';
import 'home_controller.dart';

class NearestRestaurantScreen extends StatelessWidget {
   NearestRestaurantScreen({Key? key}) : super(key: key);
   HomeController homeController=Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return         Column(
      children: [
        CustomTitleAndViewMore(title: 'Nearest Restaurant', viewMore: 'back', viewMoreFunc: (){
          homeController.updateMyNumber(0);

        }),

        SizedBox(
          height: 30.h,
        ),
        GetBuilder<HomeController>(
            builder: (controller) =>SizedBox(
            width: Get.width,
            child: GridView.builder(
              primary: false,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                childAspectRatio: .9,
              ),
              itemCount:  controller.restaurantListOfModel.length,
              itemBuilder:
                  (BuildContext context, int index) {
                return  GestureDetector(
                  onTap: (){
                    controller.selectedCard(controller.restaurantListOfModel[index]);

                  },
                  child: CustomCard(
                    image:"${APIEndPoints.baseURL}${controller.restaurantListOfModel[index].pic.substring(7)}",
                    restaurantName: controller.restaurantListOfModel[index].name,
                    time:'${controller.restaurantListOfModel[index].deliveryTime} mins',
                  ),
                );
              },
            ),),),
      ],
    );
  }
}
