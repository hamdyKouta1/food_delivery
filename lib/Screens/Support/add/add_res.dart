import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Screens/Support/add/add_res_controller.dart';
import 'package:food_delivery/Widgets/custom_text_change_font.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Constants/app_colors.dart';
import '../../../../Widgets/custom_gradient_title.dart';
import '../../../../Widgets/custom_icon_passsword_text_field.dart';
import '../../../../Widgets/custom_shadow.dart';
import '../../../../Widgets/custom_text_button.dart';
import '../../../Widgets/custom_rounded_container_with_no_minheight.dart';

class AddRestaurantScreen extends StatelessWidget {
  AddRestaurantScreen({Key? key}) : super(key: key);
  AddResController addResController = Get.put(AddResController());

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
                        height: 80.h,
                      ),
                      const CustomGradientTitle(
                        text: 'Add New Restaurant',
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Center(
                          child: SizedBox(
                        width: Get.width - 50,
                        height: Get.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ShadowWidget(
                              height: 70.h,
                              widget: CustomIconFormFiled(
                                seePassword: false,
                                label: 'Anamwp..',
                                myController: addResController.name,
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
                                label: 'address',
                                myController: addResController.address,
                                allColor: AppColors.white,
                                icon: 'assets/images/Message.png',
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            ShadowWidget(
                              height: 70.h,
                              widget: CustomIconFormFiled(
                                myType: TextInputType.text,
                                seePassword: false,
                                label: 'tag1',
                                myController: addResController.tag1,
                                allColor: AppColors.white,
                                icon: 'assets/images/Message.png',
                              ),
                            ),
                            SizedBox(height: 15,),
                            ShadowWidget(
                              height: 70.h,
                              widget: CustomIconFormFiled(
                                myType: TextInputType.text,
                                seePassword: false,
                                label: 'tag2',
                                myController: addResController.tag2,
                                allColor: AppColors.white,
                                icon: 'assets/images/Message.png',
                              ),
                            ),
                            SizedBox(height: 15,),

                            ShadowWidget(
                              height: 70.h,
                              widget: CustomIconFormFiled(
                                myType: TextInputType.number,
                                seePassword: false,
                                label: 'long',
                                myController: addResController.long,
                                allColor: AppColors.white,
                                icon: 'assets/images/Message.png',
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            ShadowWidget(
                              height: 70.h,
                              widget: CustomIconFormFiled(
                                myType: TextInputType.number,
                                seePassword: false,
                                label: 'lat',
                                myController: addResController.lat,
                                allColor: AppColors.white,
                                icon: 'assets/images/Message.png',
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            ShadowWidget(
                                height: 120.h,
                                widget: Center(
                                    child: GestureDetector(
                                  onTap: () {
                                    Get.to(AddRestaurantScreen());
                                  },
                                  child: CustomRoundedContainerNoMinHeight(
                                    height: 120.h,
                                    width: Get.width,
                                    color: AppColors.white,
                                    widget: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Add Restaurant Photo",
                                          style: GoogleFonts.libreFranklin(
                                            textStyle: TextStyle(
                                                color: const Color(0x443B3B3B),
                                                fontWeight: FontWeight.w800,
                                                fontSize: 16.sp),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              addResController.openGallery(context);
                                            },
                                            icon: Icon(
                                              CupertinoIcons.camera_fill,
                                              color: AppColors.gradientColor1,
                                              size: 40,
                                            )),
                                      ],
                                    ),
                                  ),
                                ))),

                            SizedBox(
                              height: 40.h,
                            ),
                             Obx(() =>
                            GestureDetector(
                              onTap: () {
                                addResController.createRes(context);
                              },
                              child: addResController.isLoading.value ? CircularProgressIndicator(color: AppColors.gradientColor2,) :
                                  const CustomTextButton(
                                width: 170,
                                height: 60,
                                text: 'Create',
                                textSize: 16,
                                textFontWeight: FontWeight.w800,
                              ),
                            ),
                              ),
                            SizedBox(
                              height: 15.h,
                            ),
                            GestureDetector(
                              onTap: (){
                                Get.back();
                              },
                              child:   SizedBox(
                              width: 100,
                              height: 30,
                                child: Center(
                                  child: CustomTextLibreFranklin(
                                      subText: "back",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.gradientColor2),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
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
