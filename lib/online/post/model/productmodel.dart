// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProModel> productModelFromJson(String str) => List<ProModel>.from(json.decode(str).map((x) => ProModel.fromJson(x)));

String productModelToJson(List<ProModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProModel {
  String? id;
  String? productName;
  String? productPrice;
  String? productOffer;
  String? productCategory;
  ProductImage? productImage;
  String? productDesc;
  String? productRate;

  ProModel({
    this.id,
    this.productName,
    this.productPrice,
    this.productOffer,
    this.productCategory,
    this.productImage,
    this.productDesc,
    this.productRate,
  });

  factory ProModel.fromJson(Map<String, dynamic> json) => ProModel(
    id: json["id"],
    productName: json["product_name"],
    productPrice: json["product_price"],
    productOffer: json["product_offer"],
    productCategory: json["product_category"],
    productImage: productImageValues.map[json["product_image"]]!,
    productDesc: json["product_desc"],
    productRate: json["product_rate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_name": productName,
    "product_price": productPrice,
    "product_offer": productOffer,
    "product_category": productCategory,
    "product_image": productImageValues.reverse[productImage],
    "product_desc": productDesc,
    "product_rate": productRate,
  };
}

enum ProductImage { GOOGLE_COM }

final productImageValues = EnumValues({
  "google.com": ProductImage.GOOGLE_COM
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
