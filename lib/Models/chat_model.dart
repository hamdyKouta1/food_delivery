class ChatModel{
  String? email,msg;
  String ? time;
  ChatModel({
    this.email,this.msg,this.time

  });


  Map<String,dynamic> toJson(){

    var map=<String,dynamic>{};

    map['email']=email;
    map['msg']=msg;
    map['time']=time;


    return map;
  }

  ChatModel.fromJson(value ){
    email =  value['email'];
    msg  =  value['msg'];
    time =  value['time'];


  }





}