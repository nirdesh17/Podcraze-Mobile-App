class ApiErrorResponseModel {
  ApiErrorResponseModel({
    required this.message,
    required this.status,
  });

  final String? message;
  final bool? status;

  factory ApiErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      ApiErrorResponseModel(
        message: json["message"],
        status: json["status"],
      );
    
  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
  };
}
