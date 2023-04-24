import 'package:exercise_1/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import '../model/restaurant_model.dart';
import 'dart:convert';

import 'details_items.dart';

class ListItems extends StatelessWidget {
  const ListItems({super.key});

  Future<List<Restaurant>> _getRestaurants() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/dicodingacademy/assets/main/flutter_fundamental_academy/local_restaurant.json'));

    if (response.statusCode == 200) {
      final Welcome welcome = Welcome.fromJson(json.decode(response.body));
      return welcome.restaurants;
    } else {
      throw Exception('Failed to load restaurants');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(
            top: 50,
          ),
          child: Text(
            "Restaurant",
            style: TextStyle(
                color: greyColor2, fontSize: 30, fontWeight: FontWeight.w400),
          ),
        ),
        toolbarHeight: 120.0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20.0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 16),
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Recommendation restaaurant for you!',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: greyColor1),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: FutureBuilder<List<Restaurant>>(
        future: _getRestaurants(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final restaurants = snapshot.data!;
            return ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = restaurants[index];
                return InkWell(
                  onTap: () {
                    // set a delay to slow down the animation
                    timeDilation = 5.0;
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailPage(item: restaurant)));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      leading: Hero(
                          tag: restaurant,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              restaurant.pictureId,
                              height: 150,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          )),
                      minLeadingWidth: 70,
                      title: Text(
                        restaurant.name,
                        style: const TextStyle(fontSize: 15, color: blackColor),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 12,
                                  color: greyColor1,
                                ),
                                Text(
                                  restaurant.city,
                                  style: const TextStyle(
                                      color: greyColor1, fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 12,
                                  color: greyColor2,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "${restaurant.rating}",
                                  style: const TextStyle(
                                      fontSize: 12, color: greyColor2),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          // By default, show a loading spinner.
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
