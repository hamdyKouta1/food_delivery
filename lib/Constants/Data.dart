import 'package:flutter/material.dart';
import 'package:food_delivery/custom_icons.dart';

final  voucher =[
  'assets/images/VoucherOne.png',
  'assets/images/VoucherTwo.png',

];

final  List<Map<String, dynamic>> notification =[
  {'icon':Icons.check,'title':'Your Order has been taken by\nthe driver','info':'Recently','color':Colors.green},
  {'icon':Icons.attach_money_outlined,'title':'Top up for \$100 was successful ','info':'10:00 AM','color':Colors.yellow},
  {'icon':Icons.cancel_outlined,'title':'Your Order has been Canceled','info':'Recently','color':Colors.red}

];

 Map<String , dynamic> userInfo={
  'first name':null,
  'last name':null,
  'phone number':null,
  'payment method':null,
  'location':null,
  'image path':null,
};