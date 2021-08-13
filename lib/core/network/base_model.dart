class BaseModel {
  bool status;
  String? message;
  int? code;
  String? type;
  dynamic result;

  BaseModel(
      {this.code, this.result, this.message, required this.status, this.type});

  factory BaseModel.fromJson(Map<String, dynamic> json) {
    return BaseModel(
      status: json['status'],
      message: json['message'],
      code: json['code'],
      type: json['type'],
      result: json['result'],
    );
  }
}