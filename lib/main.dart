import 'package:flutter/material.dart';
import 'package:my_rest_aurant/home.dart';
import 'package:my_rest_aurant/list_restaurants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        list_restaurant.routeName: (context) => list_restaurant(),
      },
    );
  }
}

class restaurantListPage extends StatelessWidget {
  const restaurantListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
