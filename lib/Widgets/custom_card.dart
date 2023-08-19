import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/MainColor.dart';
import '../Constants/app_colors.dart';
import 'Custom_rounded_container_with_color.dart';
import 'custom_shadow.dart';
import 'custom_text_change_font.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.image,
    required this.restaurantName,
    required this.time,
    Key? key,
  }) : super(key: key);
  final String time;
  final String restaurantName;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ShadowWidget(
        widget: CustomRoundedContainer(
            width: 150.w,
            height: 220.h,
            color: AppColors.white,
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                    width: 120.w,
                    height: 80.h,
                    child: image.contains('http')
                        ? Image.network(image)
                        : Image.asset('assets/images/Logo(1).png')),
                SizedBox(
                  height: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 2.50, left: 2.50),
                        child: CustomTextLibreFranklin(
                            maxLines: 1,
                            subText: restaurantName,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomTextLibreFranklin(
                          subText: time,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey)
                    ],
                  ),
                )
              ],
            )),
        height: 200);
  }
}
