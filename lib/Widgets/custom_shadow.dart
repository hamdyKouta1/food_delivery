import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/MainColor.dart';
import '../Constants/app_colors.dart';

class ShadowWidget extends StatelessWidget {
  const ShadowWidget({
    required this.height,
    required this.widget,
    Key? key,
  }) : super(key: key);
  final Widget widget;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(
          minHeight: height.h,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              spreadRadius: .02,
              blurRadius: 10,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: widget);
  }
}
