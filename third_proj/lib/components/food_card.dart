import 'package:flutter/material.dart';

class Food {
  final String name;
  final String image;
  final int id;
  final String price;

 Food({required this.name, required this.image, required this.id, required this.price});

  factory Food.fromJson(Map<String,dynamic> json){
    return Food(
      name:json['name'] ?? 'Unknown',
      image: json['image'] ?? '',
      price:json['price'] ?? '',
      id: json['id'] ?? '',
    );
  } 
}