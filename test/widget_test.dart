import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:my_rest_aurant/models/restaurant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Pastikan Flutter diinisialisasi

  // Langkah 1: Membaca file JSON lokal
  String jsonString =
      await rootBundle.loadString('assets/local_restaurant.json');
  //print(jsonString);

  // Langkah 2: Mendekode JSON
  List restaurants =
      (jsonDecode(jsonString) as Map<String, dynamic>)["restaurants"];

  // List<Map<String, dynamic>> restaurants =
  //     (json.decode(jsonString) as List<dynamic>).cast<Map<String, dynamic>>();

  // Langkah 3: Membuat objek Restaurant dari data JSON
  // if (restaurants == null || restaurants.isEmpty) {
  //   return [];
  // } else {
  //   return restaurants.map((e) => Restaurant.fromJson(e)).toList();
  // }

  Restaurant restaurant = Restaurant.fromJson(restaurants[3]);

  //checking-checking:
  print("Restaurant Name: ${restaurant.name}");
  print("Restaurant Description: ${restaurant.description}");
  print("===============================================================");
  print(restaurant.menus.drinks[0].name);
  print(restaurant.menus.foods[3].name);
  print("===============================================================");

  print("Drinks:");
  restaurant.menus.drinks.forEach((drink) {
    print(drink.name);
  });

  print("Foods:");
  restaurant.menus.foods.forEach((food) {
    print(food.name);
  });
  print("===============================================================");
  print(restaurant.toJson());
}
