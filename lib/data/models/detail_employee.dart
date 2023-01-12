class DetailEmployee {
  DetailEmployee({
    this.status,
    this.message,
    this.data,
  });

  DetailEmployee.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  num? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.name,
    this.nik,
    this.position,
    this.id,
  });

  Data.fromJson(dynamic json) {
    name = json['name'];
    nik = json['nik'];
    position = json['position'];
    id = json['id'];
  }

  String? name;
  String? nik;
  String? position;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['nik'] = nik;
    map['position'] = position;
    map['id'] = id;
    return map;
  }
}
