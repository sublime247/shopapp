import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  late final int? id;
  late final String? title;
  late final num? price;
  late final String? category;
  late final String? image;
  late final Map<String, dynamic>? rating;
  bool isFavorite;

  ProductModel(
      { this.id,
       this.title,
       this.price,
       this.category,
       this.image,
      this.rating,
      this.isFavorite = false});

  void isToggled() {
    isFavorite =!isFavorite;
    notifyListeners();
  }
}
