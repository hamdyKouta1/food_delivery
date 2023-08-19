import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Models/log_in_model.dart';
import 'package:food_delivery/Screens/Athuntication/ForgotPassword/FogotPassword/forgot_password_screen.dart';
import 'package:food_delivery/Screens/Athuntication/SignIn/sign_in_controller.dart';
import 'package:food_delivery/Screens/Athuntication/SignUp/Sign_up/sign_up.dart';
import 'package:food_delivery/Widgets/custom_text_change_font.dart';
import 'package:food_delivery/Widgets/custom_text_form_filed.dart';
import 'package:get/get.dart';
import '../../../Constants/app_colors.dart';
import '../../../Widgets/custom_gradient_title.dart';
import '../../../Widgets/custom_login_with_button.dart';
import '../../../Widgets/custom_password_form_field.dart';
import '../../../Widgets/custom_shadow.dart';
import '../../../Widgets/custom_sub_title.dart';
import '../../../Widgets/custom_text_button.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  SignInController sController = Get.put(SignInController());

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
                      SizedBox(
                          width: 190.w,
                          height: 190.h,
                          child: Image.asset('assets/images/Logox4.png')),
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
                        height: 60.h,
                      ),
                      CustomTextLibreFranklin(
                          subText: 'Login To Your Account',
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: AppColors.subTextTitleColor),
                      SizedBox(
                        height: 40.h,
                      ),
                      Center(
                          child: SizedBox(
                            width: Get.width - 50,
                            height: Get.height,
                            child: Column(
                            children: [
                              ShadowWidget(
                                height: 70.h,
                                widget: CustomTextFormFiled(
                                    myType: TextInputType.emailAddress,
                                    seePassword: false,
                                    label: 'Email',
                                    myController: sController.emailController,
                                    allColor: AppColors.white),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              GetBuilder<SignInController>(
                                builder: (controller) => ShadowWidget(
                                  height: 70.h,
                                  widget: CustomPassWordFormFiled(
                                    myType: TextInputType.visiblePassword,
                                    seePassword: sController.seePassword,
                                    label: 'Password',
                                    myController: sController.passController,
                                    allColor: AppColors.white,
                                    changeVisibilityFunc: () {
                                      controller.toggle();
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              CustomTextLibreFranklin(
                                  subText: 'Or Continue With',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.subTextTitleColor),
                              SizedBox(
                                height: 20.h,
                              ),
                              CustomFacebookGoogleBotton(
                                faceBookFunc: () {},
                                googleFunc: () {
                                  sController.signInWithGoogle();
                                },
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(const ForgotPasswordScreen());
                                },
                                child: CustomTextLibreFranklin(
                                    subText: 'Forgot Your Password?',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.gradientColor1),
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    sController.signIn(
                                        LogInModel(
                                          email: sController.emailController.text,
                                          password:
                                              sController.passController.text,
                                        ),
                                        context);
                                  },
                                  child: sController.isLoading.value
                                      ? CircularProgressIndicator(
                                          color: AppColors.gradientColor2,
                                        )
                                      : const CustomTextButton(
                                          width: 170,
                                          height: 60,
                                          text: 'Login',
                                          textSize: 16,
                                          textFontWeight: FontWeight.w800,
                                        ),
                                ),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(SignUpScreen());
                                },
                                child: CustomTextLibreFranklin(
                                    subText: 'Do not Have An Account?',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.lightSubTextTitleColor),
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

class CustomFacebookGoogleBotton extends StatelessWidget {
  const CustomFacebookGoogleBotton({
    required this.faceBookFunc,
    required this.googleFunc,
    Key? key,
  }) : super(key: key);
  final Function faceBookFunc;
  final Function googleFunc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () {
              faceBookFunc();
            },
            child: const ShadowWidget(
              widget: CustomLoginWithButton(
                label: 'Facebook',
                path: 'assets/images/facebook-3 1.png',
              ),
              height: 80,
            )),
        GestureDetector(
            onTap: () {
              googleFunc();
            },
            child: const ShadowWidget(
              widget: CustomLoginWithButton(
                label: 'Google',
                path: 'assets/images/google-icon 1.png',
              ),
              height: 80,
            )),
      ],
    );
  }
}
