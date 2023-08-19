import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Screens/Athuntication/ForgotPassword/ResetPassword/reset_password_screen.dart';
import 'package:food_delivery/Screens/Athuntication/ForgotPassword/VerificationCode/verification_code_forget_password_controller.dart';

import 'package:food_delivery/Widgets/custom_sub_title.dart';
import 'package:get/get.dart';
import '../../../../Constants/app_colors.dart';
import '../../../../Widgets/custom_rounded_container.dart';
import '../../../../Widgets/custom_shadow.dart';
import '../../../../Widgets/custom_text_button.dart';
import '../../../../Widgets/custom_text_form_field_for_OTP.dart';

class VerificationForgetPassCodeScreen extends StatelessWidget {
  VerificationForgetPassCodeScreen({Key? key}) : super(key: key);
  VerificationForgetPassCodeController vController =
      Get.put(VerificationForgetPassCodeController());

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
                              subText: 'Enter 4-digit \nVerification code',
                              fontSize: 25,
                              fontWeight: FontWeight.w800),
                          SizedBox(
                            height: 30.h,
                          ),
                          const CustomSubTitle(
                              subText:
                                  'Code send to +6282045**** . This code will  \n\n expired in 01:30',
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                          SizedBox(
                            height: 30.h,
                          ),
                        ]),
                  ),
                ),
                Center(
                  child: Container(
                    color: AppColors.white,
                    width: 380.w,
                    height: 90.h,
                    child: ShadowWidget(
                        height: 90.h,
                        widget: RoundedContainer(
                          widget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: Get.width - 15,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: 80.w,
                                        height: 80.h,
                                        child: CustomOTPTextFormFiled(
                                          seePassword: false,
                                          label: '',
                                          myController:
                                              vController.OTPController1,
                                          allColor: AppColors.white,
                                        )),
                                    SizedBox(
                                        width: 80.w,
                                        height: 80.h,
                                        child: CustomOTPTextFormFiled(
                                          seePassword: false,
                                          label: '',
                                          myController:
                                              vController.OTPController2,
                                          allColor: AppColors.white,
                                        )),
                                    SizedBox(
                                        width: 80.w,
                                        height: 80.h,
                                        child: CustomOTPTextFormFiled(
                                          seePassword: false,
                                          label: '',
                                          myController:
                                              vController.OTPController3,
                                          allColor: AppColors.white,
                                        )),
                                    SizedBox(
                                        width: 80.w,
                                        height: 80.h,
                                        child: CustomOTPTextFormFiled(
                                          seePassword: false,
                                          label: '',
                                          myController:
                                              vController.OTPController4,
                                          allColor: AppColors.white,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: 400.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(const ResetPasswordScreen());
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
