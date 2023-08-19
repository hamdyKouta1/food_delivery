
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRoundedContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Widget widget;

  const CustomRoundedContainer({
    required this.width,
    required this.height,
    required this.color,
    required this.widget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(
            minHeight: height.h,
        ),
        width: width.w,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: color
        ),
        child: Center(child: widget ));
  }
}