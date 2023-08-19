import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Screens/Athuntication/SignUp/Set_location/set_location.dart';
import 'package:food_delivery/Widgets/custom_sub_title.dart';
import 'package:get/get.dart';
import '../../../../Constants/app_colors.dart';
import '../../../../Widgets/custom_rounded_container.dart';
import '../../../../Widgets/custom_shadow.dart';
import '../../../../Widgets/custom_text_button.dart';

class PreviewPhotoScreen extends StatelessWidget {
  PreviewPhotoScreen({
    this.myImagePath,
    Key? key,
  }) : super(key: key);
  File? myImagePath;

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
                              subText: 'Upload Your Photo \nProfile',
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
                            height: 60.h,
                          ),
                        ]),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 290.w,
                    height: 300.h,
                    child: ShadowWidget(
                        height: Get.width,
                        widget: Center(
                          child: GestureDetector(
                              onTap: () {},
                              child: RoundedContainer(
                                widget: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: myImagePath == null
                                        ? Image.asset(
                                            'assets/images/Rectangle 584.png',
                                            fit: BoxFit.cover,
                                          )
                                        : Image.file(
                                            myImagePath!,
                                            fit: BoxFit.cover,
                                          )),
                              )),
                        )),
                  ),
                ),
                SizedBox(
                  height: 160.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(SetLocationScreen());
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
