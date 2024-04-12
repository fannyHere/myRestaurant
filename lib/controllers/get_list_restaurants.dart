import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_rest_aurant/models/restaurant.dart';

Future<List<Restaurant>> getAllRestaurant() async {
  String jsonString =
      await rootBundle.loadString('assets/json/local_restaurant.json');

  List? restaurants =
      (jsonDecode(jsonString) as Map<String, dynamic>)["restaurants"];
  //print(restaurants);
  if (restaurants == null || restaurants.isEmpty) {
    return [];
  } else {
    return restaurants.map((e) => Restaurant.fromJson(e)).toList();
  }
}
