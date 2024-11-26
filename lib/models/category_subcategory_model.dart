import 'dart:convert';

Categories categoriesFromJson(String str) =>
    Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
  final List<CategoryList> categotylist;
  final String error;
  final String statuscode;
  final String total;

  Categories({
    required this.categotylist,
    required this.error,
    required this.statuscode,
    required this.total,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        categotylist: List<CategoryList>.from(
            (json["noticlist"] ?? []).map((x) => CategoryList.fromJson(x))),
        error: json["error"],
        statuscode: json["statuscode"],
        total: json["Total"],
      );

  Map<String, dynamic> toJson() => {
        "noticlist": List<dynamic>.from(categotylist.map((x) => x.toJson())),
        "error": error,
        "statuscode": statuscode,
        "Total": total,
      };
}

class CategoryList {
  final String id;
  final String name;
  final dynamic subId;

  CategoryList({
    required this.id,
    required this.name,
    required this.subId,
  });

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
        id: json["ID"],
        name: json["Name"],
        subId: json["SubID"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Name": name,
        "SubID": subId,
      };
}
