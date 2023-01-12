class GetEmployee {
  GetEmployee({
    this.message,
    this.data,
    this.count,
  });

  GetEmployee.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    count = json['count'];
  }

  num? message;
  List<Data>? data;
  num? count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['count'] = count;
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
