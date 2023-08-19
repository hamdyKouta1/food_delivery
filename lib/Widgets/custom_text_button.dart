
import 'package:flutter/cupertino.dart';

import '../Constants/MainColor.dart';
import '../Constants/app_colors.dart';
import 'custom_gradient_button.dart';
import 'custom_text_change_font.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.width,
    required this.height,
    required this.text,
    required this.textSize,
    required this.textFontWeight,
    Key? key,
  }) : super(key: key);
  final String text;
  final double textSize;
  final FontWeight textFontWeight;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return CustomGradientButton(widget: Center(
        child: CustomTextLibreFranklin(
          subText: text,
          fontSize: textSize,
          fontWeight: textFontWeight,
          color:AppColors.white,
        ),
      ),
        width: width, height: height,);

  }}
