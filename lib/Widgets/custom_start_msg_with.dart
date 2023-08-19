
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/TextColor.dart';
import '../Constants/app_colors.dart';
import 'custom_text_change_font.dart';

class CustomStartChatMsg extends StatelessWidget {
  const CustomStartChatMsg({
    required this.secEmail,
    Key? key,
  }) : super(key: key);
  final String secEmail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500.h,
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.end,
          children: [
            CustomTextLibreFranklin(
              subText: 'Star chat between you and $secEmail!',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.lightSubTextTitleColor,
            ),
          ],
        ));
  }
}