import 'DataFood.dart';

class Food {
  Food({
      this.status, 
      this.data,});

  Food.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataFoodModel.fromJson(v));
      });
    }
  }
  bool ?status;
  List<DataFoodModel> ?data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    final data = this.data;
    if (data != null) {
      map['data'] = data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}