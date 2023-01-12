class DeleteEmployee {
  DeleteEmployee({
    this.status,
    this.message,
  });

  DeleteEmployee.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }

  num? status;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    return map;
  }
}
