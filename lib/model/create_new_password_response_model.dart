class CreateNewPasswordResponseModel {
  CreateNewPasswordResponseModel({
    required this.status,
    required this.message,
    required this.code,
  });

  final bool? status;
  final String? message;
  final int? code;

  factory CreateNewPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      CreateNewPasswordResponseModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
      };
}
