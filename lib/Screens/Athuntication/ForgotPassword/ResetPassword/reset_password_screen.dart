import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Screens/Athuntication/ForgotPassword/Reset_success/reset_password_success_screen.dart';
import 'package:food_delivery/Widgets/custom_sub_title.dart';
import 'package:get/get.dart';
import '../../../../../Widgets/custom_password_form_field.dart';
import '../../../../../Widgets/custom_shadow.dart';
import '../../../../../Widgets/custom_text_button.dart';
import '../../../../Constants/app_colors.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController forTest = TextEditingController();
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
                              subText: 'Reset your password \nhere ',
                              fontSize: 25,
                              fontWeight: FontWeight.w800),
                          SizedBox(
                            height: 30.h,
                          ),
                          const CustomSubTitle(
                              subText:
                                  'Select which contact details should we \n\n use to reset your password',
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                          SizedBox(
                            height: 30.h,
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                ShadowWidget(
                  height: 70.h,
                  widget: CustomPassWordFormFiled(
                    seePassword: false,
                    label: 'New Password',
                    myController: forTest,
                    allColor: AppColors.white,
                    changeVisibilityFunc: () {},
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ShadowWidget(
                  height: 70.h,
                  widget: CustomPassWordFormFiled(
                    seePassword: false,
                    label: 'Confirm Password',
                    myController: forTest,
                    allColor: AppColors.white,
                    changeVisibilityFunc: () {},
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                SizedBox(
                  height: 280.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(ResetSuccessNotificationScreen());
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
