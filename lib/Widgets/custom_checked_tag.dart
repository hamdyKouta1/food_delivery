import 'package:flutter/material.dart';

import '../Constants/TextColor.dart';
import '../Constants/app_colors.dart';
import 'custom_text_change_font.dart';

class LabeledCheckbox extends StatelessWidget {
   LabeledCheckbox({
    Key? key,
    required this.label,
    required this.value,
    required this.onTapMe,
    this.fontWeight=FontWeight.w400,
    this.fontSize=12

  }) : super(key: key);

  final String label;
  final bool value;
  final Function onTapMe;
  double fontSize;
  FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
          Checkbox(
              checkColor:Colors.white,
              activeColor: AppColors.gradientColor1,
              value: value,
              shape:const CircleBorder() ,
              onChanged: (bool? newValue) {
                onTapMe();
              },
            ),

          CustomTextLibreFranklin(
              subText: label,
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: AppColors.lightSubTextTitleColor),
        ],
      );

  }
}