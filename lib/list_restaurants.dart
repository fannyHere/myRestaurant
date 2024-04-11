import 'package:flutter/material.dart';

class list_restaurant extends StatefulWidget {
  const list_restaurant({super.key});

  static const routeName = '/list_restaurant';

  @override
  State<list_restaurant> createState() => _list_restaurantState();
}

class _list_restaurantState extends State<list_restaurant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurants List"),
        backgroundColor: Colors.pink,
      ),
      // body: FutureBuilder(
      //   future: controller.get_list_restaurant,
      //   builder: builder,
      // ),
    );
  }
}
