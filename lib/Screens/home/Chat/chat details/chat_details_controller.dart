import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../Cache Helper/cache_helper.dart';
import '../../../../Models/chat_model.dart';
import '../../../../Services/fire_base_services.dart';



class OpenChatController extends GetxController {
  Services chatServ = Services();

  TextEditingController msgController = TextEditingController();
  int i = 0;
  int counter = 0;
  String myEmail='';
  List<ChatModel> message=[];

  @override
  onInit(){
    super.onInit();
    getEmail();
  }
  send(email1,email2,ChatModel model) async {

    getEmail();
    String greatPath = 'chat-$email1-$email2';
    String greatPathSec = 'chat-$email2-$email1';
    print(greatPath);
    print(greatPathSec);
    await chatServ.cloudStore.collection('$greatPath').add(model.toJson());
    await chatServ.cloudStore.collection('$greatPathSec').add(model.toJson());
    msgController.clear();
    message.clear();

  }
  getEmail()async{
     myEmail = await CacheHelper.getFromSharedPreferences('email');
  }

}

