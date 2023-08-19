class SignUpModel{

  String ? name;
  String ? email;
  String ? password;


  SignUpModel({this.name,this.email,this.password});

  Map<String,dynamic> toJason(){
    var map =<String,dynamic>{};
    map['name']=name;
    map['email']=email;
    map['password']=password;


    return map;


  }



}