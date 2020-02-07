import 'package:flutter/material.dart';

class Product {

  final String name;
  final String description;
  final int amount;

  Product(this.name, this.description, this. amount);

  @override
  String toString() {
    return 'Product{name: $name, description: $description, amount $amount}';
  }
}