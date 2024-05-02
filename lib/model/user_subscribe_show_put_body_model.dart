class UserSubscribeShowPutBodyModel {
  UserSubscribeShowPutBodyModel({
    required this.userSubscribe,
  });

  final List<UserSubscribeShow>? userSubscribe;

  factory UserSubscribeShowPutBodyModel.fromJson(
          Map<String, dynamic> json) =>
      UserSubscribeShowPutBodyModel(
        userSubscribe: List<UserSubscribeShow>.from(json["subscribed_shows"]
            .map((x) => UserSubscribeShow.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subscribed_shows":
            List<dynamic>.from(userSubscribe!.map((x) => x.toJson())),
      };
}

class UserSubscribeShow {
  UserSubscribeShow({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;

  factory UserSubscribeShow.fromJson(Map<String, dynamic> json) =>
      UserSubscribeShow(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
