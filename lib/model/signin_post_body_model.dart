class SignInPostBodyModel {
  SignInPostBodyModel({
    required this.email,
    required this.password,
  });

  final String? email;
  final String? password;

  factory SignInPostBodyModel.fromJson(Map<String, dynamic> json) =>
      SignInPostBodyModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
