class UserInterestCategoryPutBodyModel {
  UserInterestCategoryPutBodyModel({
    required this.userInterest,
  });

  final List<UserInterestCategory>? userInterest;

  factory UserInterestCategoryPutBodyModel.fromJson(
          Map<String, dynamic> json) =>
      UserInterestCategoryPutBodyModel(
        userInterest: List<UserInterestCategory>.from(json["user_interests"]
            .map((x) => UserInterestCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user_interests":
            List<dynamic>.from(userInterest!.map((x) => x.toJson())),
      };
}

class UserInterestCategory {
  UserInterestCategory({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;

  factory UserInterestCategory.fromJson(Map<String, dynamic> json) =>
      UserInterestCategory(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
