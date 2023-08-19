class LogInModel{

  String ? password;
  String ? email;



  LogInModel({this.password,this.email});

  Map<String,dynamic> toJason(){
    var map =<String,dynamic>{};
    map['password']=password;
    map['email']=email;

    return map;


  }



}