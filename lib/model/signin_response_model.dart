class SignInResponseModel {
  SignInResponseModel({
    required this.code,
    required this.message,
    required this.status,
    required this.result,
  });

  final int? code;
  final String? message;
  final bool? status;
  final Result? result;

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      SignInResponseModel(
        code: json["code"],
        message: json["message"],
        status: json["status"],
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "status": status,
        "result": result?.toJson(),
      };
}

class Result {
  Result({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.token,
  });

  final int? id;
  final String? email;
  final String? firstname;
  final String? lastname;
  final String? token;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        email: json["email"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "firstname": firstname,
        "lastname": lastname,
        "token": token,
      };
}
