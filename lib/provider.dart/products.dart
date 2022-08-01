import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' show get;
import '../model.dart/product_model.dart';
import 'dart:convert';

class Products with ChangeNotifier {
  Future fetchData() async {
    final response = await get(Uri.parse('https://fakestoreapi.com/products/'));
    final productmodel = jsonDecode(response.body);
    List<ProductModel> product = [];
    for (var u in productmodel) {
      ProductModel goods = ProductModel(
          id: u['id'],
          title: u['title'],
          price: u['price'],
          category: u['category'],
          image: u['image'],
          rating: u['rating']);

      product.add(goods);
    }
    notifyListeners();
    return product;
  }

  //  List<pro>
}
