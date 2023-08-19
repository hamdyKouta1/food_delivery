import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Screens/home/Home/home_controller.dart';
import 'package:food_delivery/Widgets/custom_title_and_view_more.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../API/api_end_points.dart';
import '../../../Widgets/custom_recangular_card.dart';
import '../Food Details/food_detial_screen.dart';

class PopularMenuScreen extends StatelessWidget {
   PopularMenuScreen({Key? key}) : super(key: key);
HomeController homeController=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTitleAndViewMore(title:'Popular Menu', viewMore: 'back', viewMoreFunc: (){
          homeController.updateMyNumber(0);
        }),

        SizedBox(
          height: 30.h,
        ),
        GetBuilder<HomeController>(
            builder: (controller) => SizedBox(
                width: Get.width,
                child: ListView.builder(
                  // primary: false,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:  controller.foodsListOfModel.isEmpty? controller.foodsListOfModel.length:controller.foodsListOfModel.length,//hController.productsListOfModel.length,
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
      ],
    );

  }
}
