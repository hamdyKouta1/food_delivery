import 'dart:ui';
import 'package:get/get.dart';
import '../../../../Constants/app_colors.dart';

class PaymentMethodController extends GetxController {
  String? paymentMethod = '';
  Color colorPaypal = AppColors.white;
  Color colorVisa = AppColors.white;
  Color colorPayoneer = AppColors.white;

  activeCard(String x) {
    if (x == 'paypal') {
      colorVisa = AppColors.lightSubTextTitleColor;
      colorPaypal = AppColors.white;
      colorPayoneer = AppColors.lightSubTextTitleColor;
      print('paypal');

      update();
    } else if (x == 'Payoneer') {
      colorVisa = AppColors.lightSubTextTitleColor;
      colorPaypal = AppColors.lightSubTextTitleColor;
      colorPayoneer = AppColors.white;
      print('payoneer');

      update();
    } else if (x == 'visa') {
      colorPayoneer = AppColors.lightSubTextTitleColor;
      colorPaypal = AppColors.lightSubTextTitleColor;
      colorVisa = AppColors.white;
      print('visa');

      update();
    }
  }
}
