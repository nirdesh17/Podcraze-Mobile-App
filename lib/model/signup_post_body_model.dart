class SignUpPostBodyModel {
  SignUpPostBodyModel({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
  });

  final String? firstname;
  final String? lastname;
  final String? email;
  final String? password;

  factory SignUpPostBodyModel.fromJson(Map<String, dynamic> json) =>
      SignUpPostBodyModel(
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "password": password,
      };
}
