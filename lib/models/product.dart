import 'package:flutter/material.dart';

class Product {
  int id;
  String productName;
  String description;
  String imageName;
  double price;
  String categoryName;

  Product(
      {@required this.id,
      @required this.productName,
      @required this.imageName,
      @required this.price,
      @required this.description,
      @required this.categoryName});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.productName;
    data['description'] = this.description;
    data['image_name'] = this.imageName;
    data['price'] = this.price;
    data['category_name'] = this.categoryName;
    return data;
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      productName: json['name'] as String,
      description: json['description'] as String,
      imageName: json['image_name'] as String,
      price: json['price'] as double,
      categoryName: json['category_name'] as String,
    );
  }
}
