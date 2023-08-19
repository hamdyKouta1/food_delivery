import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Screens/home/Chat/chat%20details/chat_details_screen.dart';
import 'package:food_delivery/Screens/home/Chat/chat_controller.dart';
import 'package:get/get.dart';
import '../../../Widgets/custom_people_card.dart';
import '../../../Widgets/custom_text_change_font.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({
    Key? key,
  }) : super(key: key);
  PeopleController peopleController = Get.put(PeopleController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset('assets/images/Pattern.png'),
          ),
          SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: Get.width - 50.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
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
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomTextLibreFranklin(
                                subText: 'Chat',
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ],
                        ),
                        GetBuilder<PeopleController>(
                            builder: (controller) => SizedBox(
                                width: Get.width,
                                child: ListView.builder(
                                  primary: false,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      peopleController.listOfAllPeople.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 0),
                                      child: SizedBox(
                                        height: 90.h,
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(OpenChatScreen(
                                              email: peopleController
                                                  .listOfAllPeople[index].email,
                                              name: peopleController
                                                  .listOfAllPeople[index].name,
                                            ));
                                          },
                                          child: CustomPeopleCard(
                                            image: peopleController
                                                    .listOfAllPeople[index]
                                                    .email
                                                    .contains('support')
                                                ? "assets/images/support2.jpg"
                                                : 'assets/images/pro2.jpg',
                                            info: peopleController
                                                .listOfAllPeople[index].email,
                                            food: peopleController
                                                .listOfAllPeople[index].name,
                                            time: '',
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
