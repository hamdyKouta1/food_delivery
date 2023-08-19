class CardModel{

  String ? image;
  String ? title;
  String ? subTitle;

  CardModel({this.image,this.title,this.subTitle});

  Map<String,dynamic> toJason(){
    var map =<String,dynamic>{};
    map['image']=image;
    map['title']=title;
    map['subTitle']=subTitle;

    return map;


  }



}