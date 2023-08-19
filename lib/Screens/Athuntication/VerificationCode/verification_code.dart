import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Screens/Athuntication/SignUp/Sign_up_Success_notification/sign_up_success.dart';
import 'package:food_delivery/Screens/Athuntication/VerificationCode/verification_code_controller.dart';
import 'package:food_delivery/Widgets/custom_sub_title.dart';
import 'package:get/get.dart';
import '../../../../Widgets/custom_rounded_container.dart';
import '../../../../Widgets/custom_shadow.dart';
import '../../../../Widgets/custom_text_button.dart';
import '../../../Constants/app_colors.dart';
import '../../../Widgets/custom_text_form_field_for_OTP.dart';

class VerificationCodeScreen extends StatelessWidget {
  VerificationCodeScreen({Key? key}) : super(key: key);
  VerificationCodeController verificationCodeController =
      Get.put(VerificationCodeController());

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
                                              verificationCodeController
                                                  .OTPController1,
                                          allColor: AppColors.white,
                                        )),
                                    SizedBox(
                                        width: 80.w,
                                        height: 80.h,
                                        child: CustomOTPTextFormFiled(
                                          seePassword: false,
                                          label: '',
                                          myController:
                                              verificationCodeController
                                                  .OTPController2,
                                          allColor: AppColors.white,
                                        )),
                                    SizedBox(
                                        width: 80.w,
                                        height: 80.h,
                                        child: CustomOTPTextFormFiled(
                                          seePassword: false,
                                          label: '',
                                          myController:
                                              verificationCodeController
                                                  .OTPController3,
                                          allColor: AppColors.white,
                                        )),
                                    SizedBox(
                                        width: 80.w,
                                        height: 80.h,
                                        child: CustomOTPTextFormFiled(
                                          seePassword: false,
                                          label: '',
                                          myController:
                                              verificationCodeController
                                                  .OTPController4,
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
                      Get.to(SignUpSuccessNotificationScreen());
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
