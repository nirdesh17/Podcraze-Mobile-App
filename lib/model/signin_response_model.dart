class SignInResponseModel {
  SignInResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.result,
  });

  final int? code;
  final bool? status;
  final String? message;
  final Result? result;

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) {
    return SignInResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      result: json["result"] == null ? null : Result.fromJson(json["result"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "result": result?.toJson(),
      };
}

class Result {
  Result({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.about,
    required this.profilePic,
    required this.dob,
    required this.gender,
    required this.role,
    required this.mobileNumber,
    required this.userInterests,
    required this.subscribedShows,
    required this.token,
  });

  final int? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? about;
  final String? profilePic;
  final dynamic dob;
  final dynamic gender;
  final String? role;
  final dynamic mobileNumber;
  final List<UserInterest> userInterests;
  final List<dynamic> subscribedShows;
  final String? token;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json["id"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      email: json["email"],
      about: json["about"],
      profilePic: json["profile_pic"],
      dob: json["dob"],
      gender: json["gender"],
      role: json["role"],
      mobileNumber: json["mobile_number"],
      userInterests: json["user_interests"] == null
          ? []
          : List<UserInterest>.from(
              json["user_interests"]!.map((x) => UserInterest.fromJson(x))),
      subscribedShows: json["subscribed_shows"] == null
          ? []
          : List<dynamic>.from(json["subscribed_shows"]!.map((x) => x)),
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "about": about,
        "profile_pic": profilePic,
        "dob": dob,
        "gender": gender,
        "role": role,
        "mobile_number": mobileNumber,
        "user_interests": userInterests.map((x) => x.toJson()).toList(),
        "subscribed_shows": subscribedShows.map((x) => x).toList(),
        "token": token,
      };
}

class UserInterest {
  UserInterest({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;

  factory UserInterest.fromJson(Map<String, dynamic> json) {
    return UserInterest(
      id: json["id"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
