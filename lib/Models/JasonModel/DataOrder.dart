class DataOrderModel {
  DataOrderModel({
      this.id, 
      this.foodId, 
      this.quantity, 
      this.day, 
      this.month, 
      this.year, 
      this.time, 
      this.createdAt, 
      this.updatedAt,});

  DataOrderModel.fromJson(dynamic json) {
    id = json['id'];
    foodId = json['food_id'];
    quantity = json['quantity'];
    day = json['day'];
    month = json['month'];
    year = json['year'];
    time = json['time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int ?id;
  int ?foodId;
  String? quantity;
  int ?day;
  int ?month;
  int ?year;
  String ?time;
  String ?createdAt;
  String ?updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['food_id'] = foodId;
    map['quantity'] = quantity;
    map['day'] = day;
    map['month'] = month;
    map['year'] = year;
    map['time'] = time;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}