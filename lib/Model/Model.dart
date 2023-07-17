import 'package:flutter/cupertino.dart';

class Product {
  String title;
  String description;
  String category;
  String country;

  Product({
    required this.title,
    required this.category,
    required this.description,
    required this.country,
  });
  factory Product.formMap({required Map data}) {
    return Product(
        title: data['title'],
        category: data['category'],
        description: data['description'],
        country: data['country']);
  }
}
