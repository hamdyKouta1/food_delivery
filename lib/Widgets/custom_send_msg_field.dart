import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Constants/TextColor.dart';
import 'package:food_delivery/Widgets/custom_shadow.dart';

import '../Constants/MainColor.dart';
import '../Constants/app_colors.dart';
import '../Models/chat_model.dart';
import '../Screens/home/Chat/chat details/chat_details_controller.dart';


TextEditingController fortest =TextEditingController();
class SendMsgField extends StatelessWidget {
  const SendMsgField({
    Key? key,
    required this.chatController,
    required this.email1,
    required this.email2,
  }) : super(key: key);
  final OpenChatController chatController;

  final  email1,email2;

  @override
  Widget build(BuildContext context) {
    return ShadowWidget(
      height: 90.h,
      widget: TextFormField(
        controller: chatController.msgController,
        obscureText: false,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          height: 1,
          color: AppColors.black,
        ),
        decoration: InputDecoration(filled: true,
          fillColor: Colors.white,
          suffixIcon: IconButton(
              onPressed: () async {

                if (chatController.msgController.text.isEmpty) {
                  print('controller is Empty');
                } else {
                  chatController.send(
                      email1,
                      email2,
                      ChatModel(
                          msg: chatController.msgController.text,
                          time: DateTime.now().toString(),
                          email: email2),
                  );
                  chatController.message.clear();
                }

              },
              icon: Icon(
                Icons.send_rounded,
                color: AppColors.gradientColor1,
              )),
          hintText: 'Send a msg',
          hintStyle: TextStyle(
              color: AppColors.gradientColor2,
              fontWeight: FontWeight.w400,
              fontSize: 20.sp),
          errorBorder: const OutlineInputBorder(
            borderSide:
            BorderSide(width: 2, color: Colors.redAccent),
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              width: 2,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}