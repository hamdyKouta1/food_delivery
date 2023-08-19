
import 'package:flutter/cupertino.dart';

import '../Constants/MainColor.dart';
import '../Constants/app_colors.dart';
import 'custom_text_change_font.dart';

class CustomTitleAndViewMore extends StatelessWidget {
  const CustomTitleAndViewMore({
    required this.title,
    required this.viewMore,
    required this.viewMoreFunc,
    Key? key,
  }) : super(key: key);
  final String title;
  final String viewMore;
  final Function viewMoreFunc;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomTextLibreFranklin(
            subText: title,
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: AppColors.black),
        GestureDetector(
            onTap: () {viewMoreFunc();},
            child: CustomTextLibreFranklin(
                subText: viewMore,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.lightOrange)),
      ],
    );
  }
}