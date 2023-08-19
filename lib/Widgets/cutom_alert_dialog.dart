
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Constants/TextColor.dart';
import '../Constants/app_colors.dart';
import 'custom_text_change_font.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    required this.storeQuantity,
    Key? key,
  }) : super(key: key);
  final int storeQuantity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: AlertDialog(
        backgroundColor: Colors.white,
        title:  CustomTextLibreFranklin(
          subText:
          'only left ${storeQuantity.toString()} in store',
          fontWeight: FontWeight.w600,
          fontSize: 25,
          color: Colors.black,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Get.back();
            },
            child:  Text('okay',style: TextStyle(color: AppColors.gradientColor1),),
          ),

        ],
      ),
    );
  }
}