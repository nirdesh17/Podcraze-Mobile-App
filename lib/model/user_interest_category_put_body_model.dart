class UserInterestCategoryPutBodyModel {
  UserInterestCategoryPutBodyModel({
    required this.result,
  });

  final List<UserInterestCategory>? result;

  factory UserInterestCategoryPutBodyModel.fromJson(
          Map<String, dynamic> json) =>
      UserInterestCategoryPutBodyModel(
        result: List<UserInterestCategory>.from(
            json["result"].map((x) => UserInterestCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
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
