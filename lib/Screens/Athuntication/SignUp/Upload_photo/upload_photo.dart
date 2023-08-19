import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Screens/Athuntication/SignUp/Upload_photo/upload_photo_controller.dart';
import 'package:food_delivery/Screens/Athuntication/SignUp/Upload_preview/preview_photo.dart';
import 'package:food_delivery/Widgets/custom_sub_title.dart';
import 'package:get/get.dart';
import '../../../../Constants/app_colors.dart';
import '../../../../Widgets/custom_rounded_container_with_no_minheight.dart';
import '../../../../Widgets/custom_shadow.dart';
import '../../../../Widgets/custom_text_button.dart';

class UploadPhotoScreen extends StatelessWidget {
  UploadPhotoScreen({Key? key}) : super(key: key);
  UploadPhotoController uploadPhotoController =
      Get.put(UploadPhotoController());

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
      body: Obx(() => Stack(
            children: [
              SingleChildScrollView(
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
                                    height: 30.h,
                                  ),
                                ]),
                          ),
                        ),
                        ShadowWidget(
                            height: 200.h,
                            widget: Center(
                              child: GestureDetector(
                                  onTap: () {
                                    uploadPhotoController.openGallery(context);
                                  },
                                  child: CustomRoundedContainerNoMinHeight(
                                    height: 200.h,
                                    width: Get.width,
                                    color: AppColors.white,
                                    widget: Image.asset(
                                        'assets/images/Gallery Icon.png'),
                                  )),
                            )),
                        SizedBox(
                          height: 30.h,
                        ),
                        ShadowWidget(
                            height: 200.h,
                            widget: Center(
                                child: GestureDetector(
                                    onTap: () {
                                      uploadPhotoController.openCamera(context);
                                    },
                                    child: CustomRoundedContainerNoMinHeight(
                                      height: 200.h,
                                      width: Get.width,
                                      color: AppColors.white,
                                      widget: Image.asset(
                                          'assets/images/Camera Icon.png'),
                                    )))),
                        SizedBox(
                          height: 125.h,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Get.to(PreviewPhotoScreen());
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
              if (uploadPhotoController.isLoading.value) ...[
                Container(
                  width: Get.width,
                  height: Get.height,
                  color: Colors.black.withOpacity(.4),
                  child: Center(
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(
                        color: AppColors.gradientColor2,
                      ),
                    ),
                  ),
                ),
              ]
            ],
          )),
    );
  }
}
