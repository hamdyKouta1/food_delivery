import 'DataRes.dart';

class Restaurant {
  Restaurant({
      this.status, 
      this.data,});

  Restaurant.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(DataRestaurantModel.fromJson(v));
      });
    }
  }
  bool ? status;
  List<DataRestaurantModel> ? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}