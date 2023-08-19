import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/MainColor.dart';
import '../Constants/TextColor.dart';
import '../Constants/app_colors.dart';
import 'custom_text_change_font.dart';

class CustomLoginWithButton extends StatelessWidget {
  const CustomLoginWithButton({
    required this.label,
    required this.path,
    Key? key,
  }) : super(key: key);
  final String label;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      width: 170.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //  SizedBox(width: 20.w,),
          Image.asset(path),
          // SizedBox(width: 20.w,),
          CustomTextLibreFranklin(
              subText: label,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.subTextTitleColor)
        ],
      ),
    );
  }
}
