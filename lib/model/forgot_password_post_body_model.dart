class ForgotPasswordPostBodyModel {
  ForgotPasswordPostBodyModel({
    required this.email,
  });
  final String? email;

  factory ForgotPasswordPostBodyModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordPostBodyModel(
        email: json['email'],
      );

  Map<String, dynamic> toJson() => {
        'email': email,
      };
}
