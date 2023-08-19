
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Screens/home/Home/home_screen.dart';
import 'package:food_delivery/Screens/home/Main%20View/main_view_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Constants/TextColor.dart';
import '../Constants/app_colors.dart';
import 'custom_text_change_font.dart';

class CustomAlertDialogCheckOut extends StatelessWidget {
  const CustomAlertDialogCheckOut({
    required this.text,
    required this.subText,
    Key? key,
  }) : super(key: key);
  final String text;
  final String subText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(

      child: AlertDialog(
        backgroundColor: Colors.white,
        title:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextLibreFranklin(
              maxLines: 3,
              subText:
             text,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.black,
            ),
            SizedBox(height: 10,),
            CustomTextLibreFranklin(
              maxLines: 3,
              subText:
              subText,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.black,
            ),
            SizedBox(height: 10,),
            Center(
              child: Container(
                  width: 100.w,
                  height: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset('assets/images/congrats.png')),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Get.back();
            },
            child:  Text('Okay',style: TextStyle(color: AppColors.gradientColor1),),
          ),TextButton(
            onPressed: () {
              Get.offAll((ViewScreen()));
            },
            child:  Text('Home',style: TextStyle(color: AppColors.gradientColor1),),
          ),

        ],
      ),
    );
  }
}