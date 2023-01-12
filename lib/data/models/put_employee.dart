class PutEmployee {
  PutEmployee({
    this.name,
    this.message,});

  PutEmployee.fromJson(dynamic json) {
    name = json['name'];
    message = json['message'];
  }
  num? name;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['message'] = message;
    return map;
  }

}