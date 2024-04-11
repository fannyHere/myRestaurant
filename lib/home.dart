import 'package:flutter/material.dart';
import 'package:my_rest_aurant/list_restaurants.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Restaurants Apps",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Mau makan apa hari ini?"),
            ),
            Container(
              height: 200,
              width: 200,
              child: Lottie.asset(
                "assets/lottie/restaurant.json",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, list_restaurant.routeName);
              },
              child: Text(
                "Get Started",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
