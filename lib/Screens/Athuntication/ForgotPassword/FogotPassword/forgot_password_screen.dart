import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Screens/Athuntication/ForgotPassword/VerificationCode/verification_forget_password_code.dart';
import 'package:food_delivery/Widgets/custom_sub_title.dart';
import 'package:get/get.dart';
import '../../../../../Widgets/custom_shadow.dart';
import '../../../../../Widgets/custom_text_button.dart';
import '../../../../Constants/app_colors.dart';
import '../../../../Widgets/custom_rounded_container_with_no_minheight.dart';
import '../../../../Widgets/custom_text_change_font.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

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
                              subText: 'Forgot Password',
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
                const CustomViaCard(
                  title: 'Via sms:',
                  subTitle: '**** **** 4235',
                  image: 'assets/images/email.png',
                ),
                SizedBox(
                  height: 30.h,
                ),
                const CustomViaCard(
                  title: 'Via email:',
                  subTitle: '*****a@gmail.com',
                  image: 'assets/images/msg.png',
                ),
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  height: 280.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(VerificationForgetPassCodeScreen());
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

class CustomViaCard extends StatelessWidget {
  const CustomViaCard({
    required this.title,
    required this.subTitle,
    required this.image,
    Key? key,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ShadowWidget(
        height: 130.h,
        widget: Center(
          child: GestureDetector(
              onTap: () {},
              child: CustomRoundedContainerNoMinHeight(
                color: AppColors.white,
                width: Get.width,
                height: 128.h,
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 50.w,
                    ),
                    Image.asset(image),
                    SizedBox(
                      width: 25.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextLibreFranklin(
                          subText: title,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomSubTitle(
                            subText: subTitle,
                            fontSize: 18,
                            fontWeight: FontWeight.w500)
                      ],
                    )
                  ],
                ),
              )),
        ));
  }
}
