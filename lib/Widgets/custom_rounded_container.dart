
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Constants/MainColor.dart';
import '../Constants/app_colors.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    required this.widget,
    Key? key,
  }) : super(key: key);
final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.all(Radius.circular(15))
        ),
        child:widget);//);
  }
}
