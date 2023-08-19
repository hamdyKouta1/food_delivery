class DetailsProductModel{

  String ? image;
  String ? title;
  String ? subTitle;
  String ? distance;
  String ? rating;

  DetailsProductModel({this.image,this.title,this.subTitle,this.rating,this.distance});

  Map<String,dynamic> toJason(){
    var map =<String,dynamic>{};
    map['image']=image;
    map['title']=title;
    map['subTitle']=subTitle;
    map['distance']=distance;
    map['rating']=rating;

    return map;


  }



}