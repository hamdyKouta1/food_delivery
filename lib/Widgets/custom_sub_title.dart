
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/TextColor.dart';
import '../Constants/app_colors.dart';

class CustomSubTitle extends StatelessWidget {
  const CustomSubTitle({
    required this.subText,
    required this.fontSize,
    required this.fontWeight,

    Key? key,
  }) : super(key: key);
  final double fontSize;
  final String subText;
  final FontWeight fontWeight;


  @override
  Widget build(BuildContext context) {
    return Text(subText,style: GoogleFonts.inter(textStyle: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: AppColors.subTextTitleColor

    ),),);
  }
}