// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  final String error;
  final String statuscode;
  final String total;
  final List<Category> ctgrylst;

  CategoryModel({
    required this.error,
    required this.statuscode,
    required this.total,
    required this.ctgrylst,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        error: json["error"],
        statuscode: json["statuscode"],
        total: json["Total"],
        ctgrylst: List<Category>.from(
            (json["ctgrylst"] ?? []).map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "statuscode": statuscode,
        "Total": total,
        "ctgrylst": List<dynamic>.from(ctgrylst.map((x) => x.toJson())),
      };
}

class Category {
  final String cateId;
  final String cateName;
  final String cateImage;

  Category({
    required this.cateId,
    required this.cateName,
    required this.cateImage,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        cateId: json["Cate_Id"],
        cateName: json["Cate_Name"],
        cateImage: json["Cate_Image"],
      );

  Map<String, dynamic> toJson() => {
        "Cate_Id": cateId,
        "Cate_Name": cateName,
        "Cate_Image": cateImage,
      };
}
