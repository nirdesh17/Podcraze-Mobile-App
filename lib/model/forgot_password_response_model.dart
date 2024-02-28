class ForgotPasswordResponseModel {
  ForgotPasswordResponseModel({
    required this.code,
    required this.message,
    required this.status,
  });
  final int? code;
  final String? message;
  final bool? status;

  factory ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordResponseModel(
        code: json['code'],
        message: json['message'],
        status: json['status'],
      );
  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'status': status,
      };
}
