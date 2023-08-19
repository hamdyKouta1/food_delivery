
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../Constants/TextColor.dart';
import '../Constants/app_colors.dart';

class CustomGradientTitle extends StatelessWidget {
  const CustomGradientTitle({
    required this.text,
    required this.fontSize,
    required this.fontWeight,

    Key? key,
  }) : super(key: key);
  final double fontSize;
  final String text;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return GradientText(
      text,
      style: GoogleFonts.viga(textStyle: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,

      ),),
      gradientType: GradientType.linear,
      radius: 10,
      colors: [
        AppColors.gradientColor1,
        AppColors.gradientColor2
      ],
    );
  }
}