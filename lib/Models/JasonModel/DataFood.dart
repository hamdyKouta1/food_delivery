class DataFoodModel {
  DataFoodModel({
      this.id, 
      this.name, 
      this.description, 
      this.price, 
      this.restaurentId, 
      this.catId, 
      this.pic, 
      this.createdAt, 
      this.updatedAt,});

  DataFoodModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    restaurentId = json['restaurent_id'];
    catId = json['cat_id'];
    pic = json['pic'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int ?id;
  String? name;
  String ?description;
  String? price;
  String ?restaurentId;
  String ?catId;
  String ?pic;
  String ?createdAt;
  String ?updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['restaurent_id'] = restaurentId;
    map['cat_id'] = catId;
    map['pic'] = pic;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}