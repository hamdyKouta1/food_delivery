
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/TextColor.dart';
import '../Constants/app_colors.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({
    required this.text,
    Key? key,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content:  Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: AppColors.gradientColor1,
    );
  }
}