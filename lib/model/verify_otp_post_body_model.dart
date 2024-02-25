class VerifyOtpPostBodyModel{
  VerifyOtpPostBodyModel({
    required this.email,
    required this.otp
  });

  final String? email; 
  final String? otp;

  factory VerifyOtpPostBodyModel.fromJson(Map<String, dynamic> json) =>
      VerifyOtpPostBodyModel(
        email: json["email"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "otp": otp,
      };
}