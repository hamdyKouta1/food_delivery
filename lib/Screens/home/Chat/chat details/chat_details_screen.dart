import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Constants/TextColor.dart';
import 'package:food_delivery/Screens/home/Chat/chat%20details/chat_details_controller.dart';
import 'package:food_delivery/Widgets/custom_chat_header.dart';
import 'package:food_delivery/custom_icons.dart';
import 'package:get/get.dart';
import '../../../../Constants/MainColor.dart';
import '../../../../Constants/app_colors.dart';
import '../../../../Models/chat_model.dart';
import '../../../../Widgets/Custom_rounded_container_with_color.dart';
import '../../../../Widgets/custom_recive_msg.dart';
import '../../../../Widgets/custom_send_msg_field.dart';
import '../../../../Widgets/custom_sent_msg.dart';
import '../../../../Widgets/custom_start_msg_with.dart';
import '../../../../Widgets/custom_text_change_font.dart';

class OpenChatScreen extends StatelessWidget {
  OpenChatScreen({
    required this.email, //for target chat
    required this.name,
    Key? key,
  }) : super(key: key);
  OpenChatController chatController = Get.put(OpenChatController());

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    chatController.getEmail();
    print(chatController.myEmail); //current account chat
    print(email);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: Get.width,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/Pattern.png'),
              ),
              Center(
                child: SizedBox(
                  width: Get.width - 50.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height / 3.h - 50.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 60.h,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomRoundedContainer(
                                    width: 50,
                                    height: 48,
                                    color: AppColors.lightOrangeBackground,
                                    widget: IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: Icon(
                                          CustomIcons.iconPath,
                                          color: AppColors.lightOrange,
                                        ))),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomTextLibreFranklin(
                                    subText: 'Chat',
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                                SizedBox(
                                  height: 30.h,
                                ),
                                SizedBox(
                                    width: Get.width,
                                    height: 90.h,
                                    child: CustomChatHeader(
                                        image: 'assets/images/ppic.png',
                                        name: name,
                                        state: 'Online')),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: chatController.myEmail != "support1@gmail.com"
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  (StreamBuilder<QuerySnapshot<Object?>>(
                                      stream: FirebaseFirestore.instance
                                          .collection(
                                              'chat-${chatController.myEmail}-support')
                                          .orderBy('time', descending: true)
                                          .snapshots(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          chatController.message.clear();
                                          for (int i = 0;
                                              i < snapshot.data!.docs.length;
                                              i++) {
                                            chatController.message.add(
                                                ChatModel.fromJson(
                                                    snapshot.data!.docs[i]));
                                          }
                                          if (chatController.message.isEmpty) {
                                            return const CustomStartChatMsg(
                                              secEmail: 'support',
                                            );
                                          } else {
                                            return SizedBox(
                                              height: 500.h,
                                              width: Get.width - 30.w,
                                              child: ListView.builder(
                                                reverse: true,
                                                itemCount: chatController
                                                    .message.length,
                                                itemBuilder: (context, index) {
                                                  return chatController
                                                              .message[index]
                                                              .email !=
                                                          'support' //target Email
                                                      ? SentMsg(
                                                          msg: chatController
                                                              .message[index]
                                                              .msg!,
                                                        )
                                                      : RecivedMsg(
                                                          msg: chatController
                                                              .message[index]
                                                              .msg!);
                                                },
                                              ),
                                            );
                                          }
                                        } else {
                                          return Container();
                                        }
                                      })),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  SendMsgField(
                                    email1: 'support',
                                    email2: chatController.myEmail,
                                    chatController: chatController,
                                  )
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  (StreamBuilder<QuerySnapshot<Object?>>(
                                      stream: FirebaseFirestore.instance
                                          .collection('chat-support-$email')
                                          .orderBy('time', descending: true)
                                          .snapshots(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          chatController.message.clear();
                                          for (int i = 0;
                                              i < snapshot.data!.docs.length;
                                              i++) {
                                            chatController.message.add(
                                                ChatModel.fromJson(
                                                    snapshot.data!.docs[i]));
                                          }
                                          if (chatController.message.isEmpty) {
                                            return const CustomStartChatMsg(
                                              secEmail: 'support',
                                            );
                                          } else {
                                            print(email);
                                            print(
                                                '${chatController.myEmail} -------------------');
                                            print('chat-support-$email');
                                            return SizedBox(
                                              height: 500.h,
                                              width: Get.width - 30.w,
                                              child: ListView.builder(
                                                reverse: true,
                                                itemCount: chatController
                                                    .message.length,
                                                itemBuilder: (context, index) {
                                                  return chatController
                                                              .message[index]
                                                              .email ==
                                                          'support' //target Email
                                                      ? SentMsg(
                                                          msg: chatController
                                                              .message[index]
                                                              .msg!,
                                                        )
                                                      : RecivedMsg(
                                                          msg: chatController
                                                              .message[index]
                                                              .msg!);
                                                },
                                              ),
                                            );
                                          }
                                        } else {
                                          return Container();
                                        }
                                      })),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  SendMsgField(
                                    email1: email,
                                    email2: "support",
                                    chatController: chatController,
                                  )
                                ],
                              ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*******************test***************************/
// SizedBox(
//   height:2*( Get.height/3).h-50.h,
//   child: ListView.builder(
//     primary:false ,
//     physics: const ScrollPhysics(),
//     itemCount: 1,
//     itemBuilder: (BuildContext context, int index) {
//       return  SizedBox(
//         width: Get.width - 30,
//         height:2*( Get.height/3).h-100.h,
//         child: ListView.builder(
//           primary:false ,
//           physics: const ScrollPhysics(),
//           reverse: true,
//           itemCount: 20,//chatController.message.length,
//           itemBuilder: (context, index) {
//             return index.isEven
//                 ? SentMsg(
//               msg: 'Hi Even $index',
//             )
//                 : RecivedMsg(
//                 msg:'Hi Odd $index');
//           },
//         ),
//       );
//
//     },
//   ),
// ),
/*******************test***************************/
