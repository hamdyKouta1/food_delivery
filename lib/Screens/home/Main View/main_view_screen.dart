import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/Screens/home/Main%20View/main_view_controller.dart';
import 'package:food_delivery/Widgets/custom_rounded_container_with_no_minheight.dart';
import 'package:food_delivery/custom_icons.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../Constants/app_colors.dart';
import '../../../Widgets/custom_shadow_for_navigatebar.dart';
import '../../Loading/internet_check_controller.dart';
import '../../NO Connection/no_connection_screen.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

TextEditingController fortest = TextEditingController();

class _ViewScreenState extends State<ViewScreen> {
  MainViewController vController = Get.put(MainViewController());

  @override
  Widget build(BuildContext context) {
    final connection = Get.put(ConnectionStatusSingleton());
    vController.getEmail();
    return GetBuilder<MainViewController>(
        builder:(controller)=> vController.email.contains('support')
        ? SupportView(vController: vController, connection: connection)
        : CustomerView(vController: vController, connection: connection));
  }
}

class CustomerView extends StatelessWidget {
  const CustomerView({
    Key? key,
    required this.vController,
    required this.connection,
  }) : super(key: key);

  final MainViewController vController;
  final ConnectionStatusSingleton connection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: CustomShadowWidgetNoMinHeight(
            height: 90.h,
            widget: CustomRoundedContainerNoMinHeight(
              width: Get.width,
              height: 85.h,
              color: Colors.white,
              widget: Padding(
                padding: const EdgeInsets.all(5.0),
                child: GNav(
                    backgroundColor: Colors.white,
                    tabBackgroundColor: AppColors.selectedTab,
                    activeColor: AppColors.iconActiveColor,
                    color: Colors.black,
                    gap: 8,
                    onTabChange: (index) {
                      vController.updateMyNumber(index);
                    },
                    padding: const EdgeInsets.all(16),
                    tabs: [
                      GButton(
                        icon: CustomIcons.iconHome,
                        text: "Home",
                        iconColor: AppColors.iconColor,
                        textColor: AppColors.black,
                        iconSize: 20,
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GButton(
                        icon: CustomIcons.iconProfile,
                        text: "Account",
                        iconColor: AppColors.iconColor,
                        textColor: AppColors.black,
                        iconSize: 20,
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GButton(
                        icon: CustomIcons.iconCart,
                        text: "Order",
                        iconColor: AppColors.iconColor,
                        textColor: AppColors.black,
                        iconSize: 25,
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GButton(
                        icon: CustomIcons.iconChat,
                        text: "Chat",
                        iconColor: AppColors.iconColor,
                        textColor: AppColors.black,
                        iconSize: 20,
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
            ),
          ),
        ),
        backgroundColor: AppColors.white,
        body: Obx(() => connection.connectivity.value == 1
            ? GetBuilder<MainViewController>(
                builder: (controller) =>
                    controller.returnScreen(vController.myPageNumber))
            : NoInternet()));
  }
}
class SupportView extends StatelessWidget {
  const SupportView({
    Key? key,
    required this.vController,
    required this.connection,
  }) : super(key: key);

  final MainViewController vController;
  final ConnectionStatusSingleton connection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: CustomShadowWidgetNoMinHeight(
            height: 90.h,
            widget: CustomRoundedContainerNoMinHeight(
              width: Get.width,
              height: 85.h,
              color: Colors.white,
              widget: Padding(
                padding: const EdgeInsets.all(5.0),
                child: GNav(
                    backgroundColor: Colors.white,
                    tabBackgroundColor: AppColors.selectedTab,
                    activeColor: AppColors.iconActiveColor,
                    color: Colors.black,
                    gap: 8,
                    onTabChange: (index) {
                      vController.updateMyNumber(index);
                    },
                    padding: const EdgeInsets.all(16),
                    tabs: [
                      GButton(
                        icon: CustomIcons.iconHome,
                        text: "Home",
                        iconColor: AppColors.iconColor,
                        textColor: AppColors.black,
                        iconSize: 20,
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GButton(
                        icon: CustomIcons.iconProfile,
                        text: "Account",
                        iconColor: AppColors.iconColor,
                        textColor: AppColors.black,
                        iconSize: 20,
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GButton(
                        icon: CustomIcons.iconPlus,
                        text: "Support",
                        iconColor: AppColors.iconColor,
                        textColor: AppColors.black,
                        iconSize: 25,
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GButton(
                        icon: CustomIcons.iconChat,
                        text: "Customers",
                        iconColor: AppColors.iconColor,
                        textColor: AppColors.black,
                        iconSize: 20,
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
            ),
          ),
        ),
        backgroundColor: AppColors.white,
        body: Obx(() => connection.connectivity.value == 1
            ? GetBuilder<MainViewController>(
            builder: (controller) =>
                controller.returnScreen(vController.myPageNumber))
            : NoInternet()));
  }
}