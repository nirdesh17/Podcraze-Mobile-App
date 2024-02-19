class SignUpResponseModel {
  SignUpResponseModel({
    required this.status,
    required this.message,
    required this.code,
    required this.result,
  });

  final bool? status;
  final int? code;
  final String? message;
  final Result? result;

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      SignUpResponseModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "result": result?.toJson(),
      };
}

class Result {
  Result({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.id,
    // required this.createdAt,
    // required this.updatedAt,
  });

  final String? firstname;
  final String? lastname;
  final String? email;
  final String? id;
  // final DateTime? createdAt;
  // final DateTime? updatedAt;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        id: json["_id"],
        // createdAt: DateTime.parse(json["createdAt"]??""),
        // updatedAt: DateTime.parse(json["updatedAt"]??""),
      );
  
  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "_id": id,
        // "createdAt": createdAt?.toIso8601String(),
        // "updatedAt": updatedAt?.toIso8601String(),
      };
}
