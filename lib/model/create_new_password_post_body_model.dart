class CreateNewPasswordPostBodyModel {
  CreateNewPasswordPostBodyModel({
    required this.email,
    required this.otp,
    required this.newPassword,
  });

  final String? email;
  final String? otp;
  final String? newPassword;

  factory CreateNewPasswordPostBodyModel.fromJson(Map<String, dynamic> json) =>
      CreateNewPasswordPostBodyModel(
        email: json["email"],
        otp: json["otp"],
        newPassword: json["new_password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "otp": otp,
        "new_password": newPassword,
      };
}
