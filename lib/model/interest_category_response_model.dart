class InterestCategoryResponseModel {
  InterestCategoryResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.result,
  });

  final bool? status;
  final int? code;
  final String? message;
  final List<InterestCategory>? result; // Change to List<InterestCategory>

  factory InterestCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      InterestCategoryResponseModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        result: List<InterestCategory>.from(json["result"].map((x) =>
            InterestCategory.fromJson(
                x))), // Map list of items to InterestCategory objects
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "result": List<dynamic>.from(result!.map(
            (x) => x.toJson())), // Map list of InterestCategory objects to JSON
      };
}

class InterestCategory {
  InterestCategory({
    required this.id,
    required this.name,
    this.isSelected = false, // Set the default value of isSelected to false
  });

  final int? id;
  final String? name;
  bool isSelected; // Add this line to define the isSelected property

  factory InterestCategory.fromJson(Map<String, dynamic> json) =>
      InterestCategory(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
