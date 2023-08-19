class CardModelFourComponents{

  String ? image;
  String ? title;
  String ? subTitle;
  String ? price;

  CardModelFourComponents({this.image,this.title,this.subTitle,this.price});

  Map<String,dynamic> toJason(){
    var map =<String,dynamic>{};
    map['image']=image;
    map['title']=title;
    map['subTitle']=subTitle;
    map['price']=price;

    return map;


  }



}