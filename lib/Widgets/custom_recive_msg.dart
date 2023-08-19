
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Constants/TextColor.dart';
import 'package:food_delivery/Widgets/custom_shadow.dart';

import '../Constants/MainColor.dart';
import 'custom_text_change_font.dart';

class RecivedMsg extends StatelessWidget {
  String msg;

  RecivedMsg({
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ShadowWidget(
                height: 20.h,
                widget: Container(
                  constraints: BoxConstraints(
                      minHeight: 20.h, minWidth: 60.h, maxHeight: 500.h,maxWidth: 300.w

                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:CustomTextLibreFranklin(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      subText: msg, color: Colors.black,),
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