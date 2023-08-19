import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Models/update_info_model.dart';
import 'package:food_delivery/Screens/Athuntication/SignUp/Sign_up_process/sign_up_process_controller%5D.dart';
import 'package:food_delivery/Widgets/custom_sub_title.dart';
import 'package:get/get.dart';
import '../../../../Constants/app_colors.dart';
import '../../../../Widgets/custom_shadow.dart';
import '../../../../Widgets/custom_text_button.dart';
import '../../../../Widgets/custom_text_form_filed.dart';

class SignUpProcessScreen extends StatelessWidget {
  SignUpProcessScreen({Key? key}) : super(key: key);

  SignUpProcessController signUpProcessController =
      Get.put(SignUpProcessController());

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
            width: MediaQuery.of(context).size.width - 25.w,
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
                              subText: 'Fill in your bio to get \nstarted',
                              fontSize: 25,
                              fontWeight: FontWeight.w800),
                          SizedBox(
                            height: 30.h,
                          ),
                          const CustomSubTitle(
                              subText:
                                  'This data will displayed in your account \n\nprofile for security',
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                          SizedBox(
                            height: 30.h,
                          ),
                        ]),
                  ),
                ),
                ShadowWidget(
                  height: 81.h,
                  widget: CustomTextFormFiled(
                      seePassword: false,
                      label: 'First Name',
                      myController: signUpProcessController.firstNameController,
                      allColor: AppColors.white),
                ),
                SizedBox(
                  height: 30.h,
                ),
                ShadowWidget(
                  height: 81.h,
                  widget: CustomTextFormFiled(
                      seePassword: false,
                      label: 'Last Name',
                      myController: signUpProcessController.lastNameController,
                      allColor: AppColors.white),
                ),
                SizedBox(
                  height: 30.h,
                ),
                ShadowWidget(
                  height: 81.h,
                  widget: CustomTextFormFiled(
                      seePassword: false,
                      label: 'Mobile Number',
                      myController:
                          signUpProcessController.phoneNumberController,
                      allColor: AppColors.white),
                ),
                SizedBox(
                  height: 220.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      signUpProcessController.updateInfo(
                          UpdateInfoModel(
                            name:
                                ' ${signUpProcessController.firstNameController.text} ${signUpProcessController.lastNameController.text}',
                            phone: signUpProcessController
                                .phoneNumberController.text
                                .toString(),
                          ),
                          context);

                      //  Get.to(PaymentMethodScreen());
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
