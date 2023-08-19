
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Constants/MainColor.dart';
import 'package:food_delivery/Constants/TextColor.dart';
import 'package:food_delivery/Widgets/custom_text_change_font.dart';

import '../Constants/app_colors.dart';
import 'custom_shadow.dart';



class SentMsg extends StatelessWidget {
  String msg;

  SentMsg({
    required this.msg,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 30,
      child: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ShadowWidget(
                height: 20.h,
                widget: Container(
                  constraints: BoxConstraints(
                      minHeight: 20.h, minWidth: 60.h, maxHeight: 500.h,maxWidth: 300.w

                  ),
                  decoration: BoxDecoration(
                      color: AppColors.gradientColor1,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomTextLibreFranklin(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        subText: msg, color: AppColors.white,),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}