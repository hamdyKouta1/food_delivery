class DataRestaurantModel {
  DataRestaurantModel({
      this.id, 
      this.pic, 
      this.coverPhoto, 
      this.name, 
      this.deliveryTime, 
      this.tags1, 
      this.tags2, 
      this.verified, 
      this.lat, 
      this.long, 
      this.createdAt, 
      this.updatedAt,});

  DataRestaurantModel.fromJson(dynamic json) {
    id = json['id'];
    pic = json['pic'];
    coverPhoto = json['cover_photo'];
    name = json['name'];
    deliveryTime = json['delivery_time'];
    tags1 = json['tags1'];
    tags2 = json['tags2'];
    verified = json['verified'];
    lat = json['lat'];
    long = json['long'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int ? id;
  String ? pic;
  dynamic coverPhoto;
  String ? name;
  String ? deliveryTime;
  String ? tags1;
  String ? tags2;
  String ? verified;
  String ? lat;
  String ?long;
  String ? createdAt;
  String ? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['pic'] = pic;
    map['cover_photo'] = coverPhoto;
    map['name'] = name;
    map['delivery_time'] = deliveryTime;
    map['tags1'] = tags1;
    map['tags2'] = tags2;
    map['verified'] = verified;
    map['lat'] = lat;
    map['long'] = long;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}