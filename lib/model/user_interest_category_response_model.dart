class UserInterestCategoryResponseModel {
  UserInterestCategoryResponseModel({
    required this.code,
    required this.message,
    required this.status,
  });
  final int? code;
  final String? message;
  final bool? status;
  factory UserInterestCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      UserInterestCategoryResponseModel(
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