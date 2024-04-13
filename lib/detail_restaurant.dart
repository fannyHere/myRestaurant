import 'package:flutter/material.dart';
import 'models/restaurant.dart';

class detail_restaurant extends StatefulWidget {
  static const routeName = '/detail_restaurant';

  @override
  State<detail_restaurant> createState() => _detail_restaurantState();
}

class _detail_restaurantState extends State<detail_restaurant> {
  Restaurant? restaurant;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    restaurant = ModalRoute.of(context)?.settings.arguments as Restaurant?;
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight =
        MediaQuery.of(context).size.height; //full untuk satu layar height
    final MediaQueryWidth =
        MediaQuery.of(context).size.width; //fulluntuk satu layar width

    //dibuat variable function untuk dimasukin ke dalam body height
    // final myAppbar = AppBar(
    //   title: Text("media query"),
    //   backgroundColor: Colors.blue,
    // );

    //tinggi all mediaqueryheight setelah dikurang sama myAppbar dan dikurang padding top (icon jam, baterai dll)
    // final bodyHeight = MediaQueryHeight -
    //     myAppbar.preferredSize.height -
    //     MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant!.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: AspectRatio(
                aspectRatio: 16 / 9,
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: NetworkImage(
                    restaurant!.pictureId,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      restaurant!.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Text(
                      restaurant!.city,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star),
                      Text(
                        restaurant!.rating.toString(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Description:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(
                    restaurant!.description,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Foods:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis
                          .horizontal, // Membuat ListView menjadi horizontal
                      itemCount: restaurant!.menus.foods.length,
                      itemBuilder: (context, index) {
                        //final food = restaurant!.menus.foods[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                children: restaurant!.menus.foods.map((food) {
                                  return Container(
                                    margin: EdgeInsets.all(
                                        5), // Atur margin jika diperlukan
                                    padding: EdgeInsets.all(10),
                                    color: Colors.grey,
                                    child: Text(food.name),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Drinks:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: MediaQueryHeight * 0.2,
                    width: MediaQueryWidth,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: restaurant!.menus.drinks.length,
                      itemBuilder: (context, index) {
                        //final drink = restaurant!.menus.drinks[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                children: restaurant!.menus.drinks.map((drink) {
                                  return Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(10),
                                    color: Colors.grey,
                                    child: Text(drink.name),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
