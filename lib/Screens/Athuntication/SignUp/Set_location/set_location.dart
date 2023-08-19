import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Screens/Athuntication/SignUp/Set_location/set_location_controller.dart';
import 'package:food_delivery/Screens/Athuntication/SignUp/Sign_up_Success_notification/sign_up_success.dart';
import 'package:food_delivery/Widgets/custom_search_alert_dialog.dart';
import 'package:food_delivery/Widgets/custom_sub_title.dart';
import 'package:get/get.dart';
import '../../../../Constants/app_colors.dart';
import '../../../../Widgets/custom_rounded_container.dart';
import '../../../../Widgets/custom_rounded_container_with_no_minheight.dart';
import '../../../../Widgets/custom_shadow.dart';
import '../../../../Widgets/custom_text_button.dart';
import '../../VerificationCode/verification_code.dart';

class SetLocationScreen extends StatelessWidget {
  SetLocationScreen({Key? key}) : super(key: key);
  SetLocationController setLocationController =
      Get.put(SetLocationController());

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
                              subText: 'Set Your location',
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
                Center(
                  child: Container(
                    color: AppColors.white,
                    width: 380.w,
                    height: 180.h,
                    child: ShadowWidget(
                        height: 175.h,
                        widget: CustomRoundedContainerNoMinHeight(
                          height: 200.h,
                          width: Get.width,
                          color: AppColors.white,
                          widget: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 25.h,
                              ),
                              SizedBox(
                                width: Get.width - 15,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Image.asset(
                                      'assets/images/Pin Logo.png',
                                      width: 25,
                                      height: 25,
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    const CustomSubTitle(
                                        subText: 'Your location',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 50.w,
                              ),
                              GetBuilder<SetLocationController>(
                                  builder: (controller) => (Center(
                                        child: setLocationController
                                                .location!.isEmpty
                                            ? GestureDetector(
                                                onTap: () {
                                                  showDialog<String>(
                                                      context: context,
                                                      builder: (BuildContext
                                                              context) =>
                                                          CustomSearchAlert(
                                                            textEditingController:
                                                                setLocationController
                                                                    .locationController,
                                                            setLocationFunc:
                                                                () {
                                                              setLocationController
                                                                  .setLocation();
                                                            },
                                                          ));
                                                },
                                                child: const RoundedContainer(
                                                  widget: Center(
                                                    child: CustomSubTitle(
                                                        subText:
                                                            'Set Your location',
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                ),
                                              )
                                            : Column(
                                                children: [
                                                  CustomSubTitle(
                                                      subText:
                                                          setLocationController
                                                              .location!,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                  SizedBox(
                                                    height: 20.h,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      showDialog<String>(
                                                          context: context,
                                                          builder: (BuildContext
                                                                  context) =>
                                                              CustomSearchAlert(
                                                                textEditingController:
                                                                    setLocationController
                                                                        .locationController,
                                                                setLocationFunc:
                                                                    () {
                                                                  setLocationController
                                                                      .setLocation();
                                                                },
                                                              ));
                                                    },
                                                    child:
                                                        const RoundedContainer(
                                                      widget: Center(
                                                        child: CustomSubTitle(
                                                            subText:
                                                                'Change Your Location',
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                      )))
                            ],
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: 340.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(VerificationCodeScreen());
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
