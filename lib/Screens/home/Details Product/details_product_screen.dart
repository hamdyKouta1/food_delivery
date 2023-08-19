import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Constants/MainColor.dart';

import 'package:get/get.dart';

import '../../../Constants/app_colors.dart';
import '../../../Widgets/Custom_draggable_header_for_product.dart';
import '../../../Widgets/custom_card.dart';
import '../../../Widgets/custom_draggable_card.dart';
import '../../../Widgets/custom_draggable_scrollable_sheet.dart';
import '../../../Widgets/custom_title_and_view_more.dart';

class DetailsProductScreen extends StatelessWidget {
  const DetailsProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              'assets/images/photoRestaurant.png',
              width: Get.width,
              height: Get.height / 2.2.h,
              fit: BoxFit.cover,
            ),
            CustomDraggableScrollableSheet(
              maxChildSize: .95,
              initialChildSize: .65,
              minChildSize: .65,
              headerChild: const CustomDraggableHeaderForProducts(
                title: 'Wijie Bar and Resto',
                info:
                    'Most whole Alaskan Red King Crabs get broken down into legs, claws, and lump meat. We offer all of these options as well in our online shop, but there is nothing like getting the whole . . . .',
                distance: '19',
                rating: '4.8',
              ),
              headerHeight: 300.h,
              child: Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTitleAndViewMore(
                    title: 'Nearest Restaurant',
                    viewMoreFunc: () {},
                    viewMore: 'View More',
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    color: AppColors.white,
                    child: CarouselSlider(

                      options: CarouselOptions(

                        height: 188.h,
                       // aspectRatio: 3/ 3,
                        viewportFraction: 0.4,
                      ),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return const Padding(
                              padding: EdgeInsets.only(top:2,bottom: 2),
                              child: CustomCard(
                                image: 'assets/images/Resturant Image.png',
                                restaurantName: 'Vegan Resto',
                                time: '12 Mins',
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomTitleAndViewMore(
                    title: 'Testimonials',
                    viewMoreFunc: () {},
                    viewMore: '',
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  SizedBox(
                      width: Get.width,
                      height: 200,
                      child: ListView.builder(
                        primary: false,
                        physics: const ScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            child: SizedBox(
                                height: 150.h,
                                child: const CustomDraggableRectCard(
                                  image: 'assets/images/food.png',
                                  info:
                                      'This Is great, So delicious! You Must Here, With Your family . . ',
                                  title: 'Dianne Russell',
                                  price: '5',
                                  subTitle: '12 April 2021',
                                )),
                          );
                        },
                      )),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

