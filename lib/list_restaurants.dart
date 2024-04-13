import 'package:flutter/material.dart';

import 'package:my_rest_aurant/controllers/get_list_restaurants.dart';

import 'models/restaurant.dart';

class list_restaurant extends StatefulWidget {
  const list_restaurant({super.key});

  static const routeName = '/list_restaurant';

  @override
  State<list_restaurant> createState() => _list_restaurantState();
}

class _list_restaurantState extends State<list_restaurant> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight =
        MediaQuery.of(context).size.height; //full untuk satu layar height
    // final MediaQueryWidth =
    //     MediaQuery.of(context).size.width; //fulluntuk satu layar width

    //dibuat variable function untuk dimasukin ke dalam body height
    // final myAppbar = AppBar(
    //   title: Text("media query"),
    //   backgroundColor: Colors.blue,
    // );

    //tinggi all mediaqueryheight setelah dikurang sama myAppbar dan dikurang padding top (icon jam, baterai dll)
    // final bodyHeight = MediaQueryHeight -
    //     myAppbar.preferredSize.height -
    //     MediaQuery.of(context).padding.top;

    var allRestaurant = getAllRestaurant();

    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurants List"),
        backgroundColor: Colors.pink,
      ),
      body: FutureBuilder<List<Restaurant>>(
        future: allRestaurant,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: Text("Tidak ada data."),
            );
          }
          //print(snapshot.data);
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Restaurant restaurant = snapshot.data![index];
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: MediaQueryHeight * 0.3,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/detail_restaurant',
                        arguments: restaurant,
                      );
                    },
                    child: Card(
                      color: Color.fromARGB(255, 230, 200, 221),
                      borderOnForeground: true,
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Flexible(
                              flex:
                                  4, // Bagian kiri (amber) akan mendapat 4/10 bagian dari total ruang
                              child: Container(
                                height: MediaQueryHeight * 0.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.amber,
                                ),
                                child: ClipRRect(
                                  // untuk memotong gambar agar sesuai dengan border radius
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    restaurant.pictureId,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex:
                                  6, // Bagian kanan (ungu) akan mendapat 6/10 bagian dari total ruang
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    restaurant.name,
                                    textAlign: TextAlign.start,
                                  ),
                                  Text(
                                    restaurant.city,
                                    textAlign: TextAlign.start,
                                  ),
                                  // Text(
                                  //   restaurant.description,
                                  //   maxLines: 2,
                                  // ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.star),
                                      Text(
                                        restaurant.rating.toString(),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
