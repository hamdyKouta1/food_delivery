import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Screens/home/Location%20Edit/location_edit_screen.dart';
import 'package:food_delivery/Screens/home/Payment%20Edit/payment_edit_screen.dart';
import 'package:food_delivery/Screens/home/Your%20Order/your_order.dart';
import 'package:food_delivery/Screens/home/chat/chat_screen.dart';
import 'package:food_delivery/custom_icons.dart';
import 'package:get/get.dart';
import '../../../Constants/MainColor.dart';
import '../../../Constants/app_colors.dart';
import '../../../Widgets/Custom_rounded_container_with_color.dart';
import '../../../Widgets/custom_payment_confirm_card.dart';
import '../../../Widgets/custom_place_my_order.dart';
import '../../../Widgets/custom_text_change_font.dart';

class PaymentConfirmScreen extends StatelessWidget {
  const PaymentConfirmScreen({

    Key? key,required this.subtotal,required this.total,required this.delivery,required this.discount
  }) : super(key: key);
final String subtotal,total,delivery,discount;

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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /********Title And Search*******/
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
                              CustomRoundedContainer(
                                width: 50,
                                height: 48,
                                color: AppColors.lightOrangeBackground,
                                widget: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    CustomIcons.iconPath,
                                    color: AppColors.lightOrange,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                               CustomTextLibreFranklin(
                                  subText: 'Confirm Order',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ],
                          ),
                          SizedBox(
                              width: Get.width,
                              height: Get.height - 380.h,
                              child: Column(

                                children: [
                                  CustomPaymentConfirmCards(info: '4517 Washington Ave. Manchester,\nKentucky 39495', cardTitle: 'Deliver To', imagePath: 'assets/images/locationIcon.png', fontWeight: FontWeight.w600, editFunc: (){
                                    Get.to(LocationEditScreen());
                                  }, imageSize: 35,),
                                  CustomPaymentConfirmCards(info: '2121 6352 8465 ****', cardTitle: 'Payment Method', imagePath: 'assets/images/paypalLogo.png', fontWeight: FontWeight.w400, editFunc: (){
                                    Get.to(PaymentEditScreen());
                                  }, imageSize: 25,)
                                ],
                              )),
                          CustomPlaceMyOrder(
                              subTotal: subtotal,
                              deliveryCharge: delivery,
                              discount: discount,
                              total: total,
                              placeMyOrder: () {
                                Get.to(YourOrderScreen());
                              }),
                        ],
                      ),
                    ],
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

