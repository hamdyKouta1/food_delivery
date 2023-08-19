import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Constants/MainColor.dart';
import '../Constants/app_colors.dart';

class CustomSearchField extends StatelessWidget {
  final String label;
  final Color fillColor;
  final Color hintFontColor;
  final IconData icon;
  final TextEditingController myController;
  final Color iconColor;
  final double iconSize;
  final double borderWidth;
  final double borderRadius;
  final double hintFontSize;
  final FontWeight hintFontWeight;
  final double hintFontHeight;
  final double textFontSize;
  final FontWeight textFontWeight;
  final double textFontHeight;
  final Color textFontColor;

  const CustomSearchField({
    required this.label,
    required this.icon,
    required this.iconColor,
    required this.iconSize,
    required this.hintFontColor,
    required this.fillColor,
    required this.myController,
    required this.borderWidth,
    required this.borderRadius,
    required this.hintFontSize,
    required this.hintFontWeight,
    required this.hintFontHeight,
    required this.textFontSize,
    required this.textFontWeight,
    required this.textFontHeight,
    required this.textFontColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      obscureText: false,
      style: TextStyle(
        fontWeight: textFontWeight,
        fontSize: textFontSize.sp,
        height: textFontHeight.h,
        color: textFontColor,
      ),
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: true,
        hintText: label,
        hintStyle: GoogleFonts.libreFranklin(
          textStyle: TextStyle(
              color: hintFontColor,
              fontWeight: hintFontWeight,
              fontSize: hintFontSize.sp,
              height: hintFontHeight),
        ),
        prefixIcon: Padding(
          padding:
              const EdgeInsets.only(top: 15, left: 5, right: 0, bottom: 15),
          child: SizedBox(
              child: Icon(
            icon,
            color: iconColor,
            size: iconSize,
          )),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: borderWidth.w, color: Colors.redAccent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: BorderSide(
            width: borderWidth.w,
            color: AppColors.strokeTextField,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: BorderSide(
            width: borderWidth,
            color: AppColors.strokeTextField,
          ),
        ),
      ),
    );
  }
}
