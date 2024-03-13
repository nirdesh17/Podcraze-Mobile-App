class AllInsteredShowResponseModel {
    AllInsteredShowResponseModel({
        required this.code,
        required this.status,
        required this.message,
        required this.result,
    });

    final int? code;
    final bool? status;
    final String? message;
    final List<Result> result;

    factory AllInsteredShowResponseModel.fromJson(Map<String, dynamic> json){ 
        return AllInsteredShowResponseModel(
            code: json["code"],
            status: json["status"],
            message: json["message"],
            result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
        );
    }

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "result": result.map((x) => x.toJson()).toList(),
    };

}

class Result {
    Result({
        required this.id,
        required this.showName,
        required this.showImageUrl,
        required this.hosts,
        required this.showDescription,
        required this.showRating,
        required this.language,
        required this.createdAt,
        required this.updatedAt,
        required this.showCategoryId,
        this.isSubscribe = false,
    });

    final int? id;
    final String? showName;
    final String? showImageUrl;
    final List<String> hosts;
    final String? showDescription;
    final dynamic showRating;
    final String? language;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? showCategoryId;
    bool isSubscribe;

    factory Result.fromJson(Map<String, dynamic> json){ 
        return Result(
            id: json["id"],
            showName: json["show_name"],
            showImageUrl: json["show_image_url"],
            hosts: json["hosts"] == null ? [] : List<String>.from(json["hosts"]!.map((x) => x)),
            showDescription: json["show_description"],
            showRating: json["show_rating"],
            language: json["language"],
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
            showCategoryId: json["show_category_id"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "show_name": showName,
        "show_image_url": showImageUrl,
        "hosts": hosts.map((x) => x).toList(),
        "show_description": showDescription,
        "show_rating": showRating,
        "language": language,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "show_category_id": showCategoryId,
    };

}
