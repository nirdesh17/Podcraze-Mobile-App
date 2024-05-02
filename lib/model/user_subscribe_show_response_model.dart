class UserSubscribeShowResponseModel {
  UserSubscribeShowResponseModel({
    required this.code,
    required this.message,
    required this.status,
  });
  final int? code;
  final String? message;
  final bool? status;
  factory UserSubscribeShowResponseModel.fromJson(Map<String, dynamic> json) =>
      UserSubscribeShowResponseModel(
        code: json["code"],
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "status": status,
      };
}