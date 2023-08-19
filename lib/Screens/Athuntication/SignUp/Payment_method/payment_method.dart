import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Screens/Athuntication/SignUp/Payment_method/payment_method_controller.dart';
import 'package:food_delivery/Widgets/custom_rounded_container_with_no_minheight.dart';
import 'package:food_delivery/Widgets/custom_sub_title.dart';
import 'package:get/get.dart';
import '../../../../Constants/app_colors.dart';
import '../../../../Widgets/custom_shadow.dart';
import '../../../../Widgets/custom_text_button.dart';
import '../Upload_photo/upload_photo.dart';

class PaymentMethodScreen extends StatelessWidget {
  PaymentMethodScreen({Key? key}) : super(key: key);
  PaymentMethodController paymentMethodController =
      Get.put(PaymentMethodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.appBarIconColor,
            )),
        elevation: 0,
        backgroundColor: AppColors.white,
      ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 30.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 50.w,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          const CustomSubTitle(
                              subText: 'Payment Method',
                              fontSize: 25,
                              fontWeight: FontWeight.w800),
                          SizedBox(
                            height: 30.h,
                          ),
                          const CustomSubTitle(
                              subText:
                                  'This data will be displayed in your account \n\n profile for security',
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                          SizedBox(
                            height: 30.h,
                          ),
                        ]),
                  ),
                ),
                GetBuilder<PaymentMethodController>(
                  builder: (controller) => (Column(
                    children: [
                      ShadowWidget(
                          height: 105.h,
                          widget: Center(
                            child: GestureDetector(
                                onTap: () {
                                  paymentMethodController.activeCard('paypal');
                                },
                                child: CustomRoundedContainerNoMinHeight(
                                  height: 100.h,
                                  width: Get.width,
                                  color: paymentMethodController.colorPaypal,
                                  widget: Image.asset(
                                      'assets/images/paypal-2 (1) 1.png'),
                                )),
                          )),
                      SizedBox(
                        height: 30.h,
                      ),
                      ShadowWidget(
                          height: 105.h,
                          widget: Center(
                              child: GestureDetector(
                                  onTap: () {
                                    paymentMethodController.activeCard('visa');
                                  },
                                  child: CustomRoundedContainerNoMinHeight(
                                    height: 100.h,
                                    width: Get.width,
                                    color: paymentMethodController.colorVisa,
                                    widget: Image.asset(
                                        'assets/images/visa (1) 1.png'),
                                  )))),
                      SizedBox(
                        height: 30.h,
                      ),
                      ShadowWidget(
                        height: 105.h,
                        widget: Center(
                          child: GestureDetector(
                            onTap: () {
                              paymentMethodController.activeCard('Payoneer');
                            },
                            child: CustomRoundedContainerNoMinHeight(
                              height: 100.h,
                              width: Get.width,
                              color: paymentMethodController.colorPayoneer,
                              widget: Image.asset(
                                  'assets/images/Payoneer_logo 1.png'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
                SizedBox(
                  height: 230.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(UploadPhotoScreen());
                    },
                    child: const CustomTextButton(
                      width: 170,
                      height: 60,
                      text: 'Next',
                      textSize: 16,
                      textFontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
