import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDraggableScrollableSheet extends StatelessWidget {
  const CustomDraggableScrollableSheet({
    required this.maxChildSize,
    required this.initialChildSize,
    required this.minChildSize,
    required this.headerHeight,
    required this.headerChild,
    required this.child,
    Key? key,
  }) : super(key: key);
  final Widget headerChild;
  final Widget child;
final double minChildSize;
final double initialChildSize;
final double maxChildSize;
final double headerHeight;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        minChildSize: minChildSize,
        maxChildSize: maxChildSize,
        initialChildSize: initialChildSize,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
              color: Colors.transparent,
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50))),
                  height: Get.height,
                  child: ListView(

                    controller: scrollController,
                    children: [
                      Container(
                        height: headerHeight.h,
                        width: Get.width,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                topLeft: Radius.circular(50))),
                        child: Center(
                          child: SizedBox(
                              width: Get.width - 50,
                              child: headerChild),
                        ),
                      ),
                      Center(
                        child: Container(

                            width: Get.width - 50,
                            height:Get.height*maxChildSize.h-(headerHeight-10).h,
                            child: child
                        ),
                      ),
                    ],
                  )));
        });
  }
}
