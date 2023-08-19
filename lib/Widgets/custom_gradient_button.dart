
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/TextColor.dart';
import '../Constants/app_colors.dart';

class CustomGradientButton extends StatelessWidget {
  const CustomGradientButton({
    required this.widget,
    required this.width,
    required this.height,

    Key? key,
  }) : super(key: key);
  final Widget widget;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.gradientColor2,
              AppColors.gradientColor1,
            ],
          )
      ),
      child: widget,
    );
  }
}