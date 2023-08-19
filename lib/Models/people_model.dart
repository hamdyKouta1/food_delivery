class PeopleModel {
  String? email;
  String? name;
  int id = 0;

  PeopleModel({
    required this.email,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};

    map['email'] = email;
    map['name'] = name;
    return map;
  }

  PeopleModel.fromJson(value) {
    email = value['email'];
    name = value['name'];
  }
}
