import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Constants/MainColor.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/app_colors.dart';

class CustomOTPTextFormFiled extends StatelessWidget {
  const CustomOTPTextFormFiled({
    required this.seePassword,
    required this.label,
    required this.myController,
    required this.allColor,
    Key? key,
  }) : super(key: key);

  final bool seePassword;
  final String label;
  final Color allColor;
  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      obscureText: seePassword,
      maxLength: 1,
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 33,
        height: 1.0,
        color: AppColors.black,
      ),
      decoration: InputDecoration(
        counterText: '',
        fillColor: allColor,
        filled: true,
        hintText: label,
        hintStyle: GoogleFonts.libreFranklin(
          textStyle: TextStyle(
              color: const Color(0x443B3B3B),
              fontWeight: FontWeight.w800,
              fontSize: 16.sp),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.redAccent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            width: 0,
            color: AppColors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            width: 0,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
