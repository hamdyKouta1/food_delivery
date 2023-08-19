import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/API/api_end_points.dart';
import 'package:food_delivery/Constants/MainColor.dart';
import 'package:food_delivery/Screens/home/Profile/profile_controller.dart';
import 'package:food_delivery/Widgets/custom_draggable_header_for_profile.dart';
import 'package:food_delivery/Widgets/custom_rounded_container_with_no_minheight.dart';
import 'package:food_delivery/Widgets/custom_shadow_for_navigatebar.dart';
import 'package:food_delivery/Widgets/custom_text_change_font.dart';
import 'package:get/get.dart';
import '../../../Constants/app_colors.dart';
import '../../../Widgets/custom_draggable_scrollable_sheet.dart';
import '../../../Widgets/custom_title_and_view_more.dart';
import '../../../Widgets/custom_your_order_process_card.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    profileController.getProfileInfo();
    return (Stack(
      alignment: Alignment.topCenter,
      children: [
        GetBuilder<ProfileController>(
          builder: (controller) => controller.result != null
            ? Image.network(
                '${APIEndPoints.baseURL}${controller.result}',
                width: Get.width,
                height: Get.height / 2.2.h,
                fit: BoxFit.cover,
              )
            : Image.asset(
                "assets/images/pro.jpg",
                width: Get.width,
                height: Get.height / 2.2.h,
                fit: BoxFit.cover,
              ),
        ),

        CustomDraggableScrollableSheet(
          maxChildSize: .89,
          initialChildSize: .55,
          minChildSize: .55,
          headerHeight: 200,
          headerChild: GetBuilder<ProfileController>(
              builder: (controller) => CustomDraggableHeaderForProfile(
                    title: controller.firstName == null
                        ? "name last"
                        : '${controller.firstName}',
                    info: controller.email == null
                        ? "email@you.com"
                        : '${controller.email}',
                    distance: '19',
                    rating: '4.8',
                  )),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomVoucherCard(
                  numberOfVoucher: 2,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTitleAndViewMore(
                    title: 'Favourite', viewMore: '', viewMoreFunc: () {}),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                    width: Get.width,
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 0),
                          child: SizedBox(
                            height: 130.h,
                            width: Get.width,
                            child: CustomYourOrderProcessCard(
                              width: Get.width,
                              title: 'Spacy fresh crab',
                              subTitle: 'Waroenk kita',
                              price: '35',
                              imagePath: 'assets/images/orderDetails.png',
                              processFunction: () {},
                              buttonText: 'Buy Again',
                            ),
                          ),
                        );
                      },
                    ),
                ),
                SizedBox(height: 10.h,),
                GestureDetector(
                    onTap: () {
                      profileController.logOut();
                    },
                    child: CustomTextLibreFranklin(
                        subText: "Log Out",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange),
                ),
                SizedBox(height: 10.h,),

              ],
            ),
          ),
        ),
      ],
    ));
  }
}

class CustomVoucherCard extends StatelessWidget {
  const CustomVoucherCard({
    required this.numberOfVoucher,
    Key? key,
  }) : super(key: key);
  final int numberOfVoucher;

  @override
  Widget build(BuildContext context) {
    return numberOfVoucher == 0
        ? SizedBox(
            height: 1.h,
          )
        : CustomShadowWidgetNoMinHeight(
            height: 100.h,
            widget: CustomRoundedContainerNoMinHeight(
                width: Get.width,
                height: 90,
                color: AppColors.white,
                widget: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    SizedBox(
                      width: 50.w,
                      height: 50.h,
                      child: Image.asset('assets/images/VoucherIcon.png'),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    CustomTextLibreFranklin(
                        subText: 'You Have $numberOfVoucher Voucher',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black)
                  ],
                )));
  }
}
