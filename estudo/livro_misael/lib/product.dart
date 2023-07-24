//import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class Product extends Model {
  final String name;
  final String description;
  final int price;
  final String image;
  var rating;

  Product(this.name, this.description, this.price, this.image, this.rating);

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(json['name'], json['description'], json['price'],
        json['image'], json['rating']);
  }

  factory Product.fromJson(Map<String, dynamic> data) {
    return Product(
      data['name'],
      data['description'],
      data['price'],
      data['image'],
      data['rating'],
    );
  }

  void updateRating(int myRating) {
    rating = myRating;
    notifyListeners();
  }

  static List<Product> getProducts() {
    List<Product> items = <Product>[];

    items.add(Product("produto1", "produto 1", 800, "produto1.png", 0));
    items.add(Product("produto2", "produto 2", 800, "produto2.png", 0));
    items.add(Product("produto3", "produto 3", 800, "produto3.png", 0));
    items.add(Product("produto4", "produto 4", 800, "produto4.png", 0));

    return items;
  }
}
