import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Models/sign_up_model.dart';
import 'package:food_delivery/Screens/Athuntication/SignIn/sign_in_screen.dart';
import 'package:food_delivery/Screens/Athuntication/SignUp/Sign_up/sign_up_controller.dart';
import 'package:food_delivery/Widgets/custom_text_change_font.dart';
import 'package:get/get.dart';
import '../../../../Constants/app_colors.dart';
import '../../../../Widgets/custom_checked_tag.dart';
import '../../../../Widgets/custom_gradient_title.dart';
import '../../../../Widgets/custom_icon_passsword_text_field.dart';
import '../../../../Widgets/custom_image_password_suffixIcon.dart';
import '../../../../Widgets/custom_shadow.dart';
import '../../../../Widgets/custom_sub_title.dart';
import '../../../../Widgets/custom_text_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/Pattern.png'),
              ),
              Positioned(
                width: Get.width,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Image.asset('assets/images/Logo(1).png'),
                      const CustomGradientTitle(
                        text: 'Food Ninja',
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                      ),
                      const CustomSubTitle(
                        subText: 'Deliver Favorite Food',
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      CustomTextLibreFranklin(
                          subText: 'Sign Up For Free',
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: AppColors.subTextTitleColor),
                      SizedBox(
                        height: 60.h,
                      ),
                      Center(
                          child: SizedBox(
                        width: Get.width - 50,
                        height: Get.height,
                        child: Column(
                          children: [
                            ShadowWidget(
                              height: 70.h,
                              widget: CustomIconFormFiled(
                                seePassword: false,
                                label: 'Anamwp..',
                                myController: signUpController.nameController,
                                allColor: AppColors.white,
                                icon: 'assets/images/Profile.png',
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            ShadowWidget(
                              height: 70.h,
                              widget: CustomIconFormFiled(
                                myType: TextInputType.emailAddress,
                                seePassword: false,
                                label: 'Email',
                                myController: signUpController.emailController,
                                allColor: AppColors.white,
                                icon: 'assets/images/Message.png',
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            GetBuilder<SignUpController>(
                              builder: (controller) => (ShadowWidget(
                                height: 70.h,
                                widget: CustomIconPassWordFormFiled(
                                  seePassword: signUpController.seePassword,
                                  label: 'Password',
                                  myController: signUpController.passController,
                                  allColor: AppColors.white,
                                  icon: 'assets/images/Lock.png',
                                  changeVisibilityFunc: () {
                                    controller.toggle();
                                  },
                                ),
                              )),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            GetBuilder<SignUpController>(
                                builder: (controller) => (LabeledCheckbox(
                                      label: 'Keep Me Signed In',
                                      value: controller.checked1,
                                      onTapMe: () {
                                        controller.checking1();
                                      },
                                    ))),
                            GetBuilder<SignUpController>(
                                builder: (controller) => (LabeledCheckbox(
                                      label: 'Email Me About Special Pricing',
                                      value: controller.checked2,
                                      onTapMe: () {
                                        controller.checking2();
                                      },
                                    ))),
                            SizedBox(
                              height: 25.h,
                            ),
                            Obx(() => GestureDetector(
                                  onTap: () {
                                    signUpController.signUp(
                                        SignUpModel(
                                          name: signUpController
                                              .nameController.text,
                                          email: signUpController
                                              .emailController.text,
                                          password: signUpController
                                              .passController.text,
                                        ),
                                        context);
                                  },
                                  child: signUpController.isLoading.value
                                      ? CircularProgressIndicator(
                                          color: AppColors.gradientColor2,
                                        )
                                      : const CustomTextButton(
                                          width: 170,
                                          height: 60,
                                          text: 'Create Account',
                                          textSize: 16,
                                          textFontWeight: FontWeight.w800,
                                        ),
                                )),
                            SizedBox(
                              height: 20.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(SignInScreen());
                              },
                              child: CustomTextLibreFranklin(
                                  subText: 'Already have an account?',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.gradientColor1),
                            ),
                          ],
                        ),
                      ))
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
