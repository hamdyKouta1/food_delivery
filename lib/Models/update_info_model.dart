class UpdateInfoModel{

  String ? name;
  String ? phone;


  UpdateInfoModel({this.name,this.phone});

  Map<String,dynamic> toJason(){
    var map =<String,dynamic>{};
    map['name']=name;
    map['password']=phone;
    return map;
  }



}