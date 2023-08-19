import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Constants/MainColor.dart';
import 'package:food_delivery/Constants/TextColor.dart';
import 'package:food_delivery/Screens/home/Main%20View/main_view_controller.dart';
import 'package:food_delivery/Widgets/custom_rounded_container_with_no_minheight.dart';
import 'package:food_delivery/Widgets/custom_text_change_font.dart';
import 'package:food_delivery/custom_icons.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../Widgets/custom_shadow_for_navigatebar.dart';
import '../../Cache Helper/cache_helper.dart';
import '../../Constants/app_colors.dart';
import '../Loading/loading_screen.dart';

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body:NoInternet()
    );
  }
}

class NoInternet extends StatelessWidget {
  const NoInternet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: SizedBox(
            width: 150,
            height: 150,
            child: Center(child: Image.asset('assets/images/disconnect.png')),
          ),
        ),
        SizedBox(height: 20.h,),
        Center(
          child: CustomTextLibreFranklin(
              subText: "Please Check Your Internet Connection :(",
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.gradientColor1),
        ),
        SizedBox(height: 60.h,),

        GestureDetector(
          onTap: (){

            Get.offAll(LoadingScreen(firstRun: false,));
          },
          child: Container(
            width: 120.w,
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: AppColors.gradientColor1,
                width: 3,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  children: [
                    CustomTextLibreFranklin(
                        subText: "Retry",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.gradientColor1),
                    SizedBox(width: 15.w,),
                    Icon(CupertinoIcons.refresh_thin,color: AppColors.gradientColor1,)
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}


