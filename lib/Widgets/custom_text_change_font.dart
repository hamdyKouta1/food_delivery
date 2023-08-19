
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomTextLibreFranklin extends StatelessWidget {
   int ? maxLines;
   CustomTextLibreFranklin(
   {
    required this.subText,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    this.maxLines,

    Key? key,
  }) : super(key: key);
  final double fontSize;
  final String subText;
  final FontWeight fontWeight;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(subText,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.libreFranklin(textStyle: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
        overflow:TextOverflow.ellipsis,


    ),),);
  }
}