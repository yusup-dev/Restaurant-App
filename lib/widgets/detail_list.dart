import 'package:flutter/material.dart';
import '../common/style.dart';
import '../model/model_list.dart';

class DetailList extends StatelessWidget {
  final ModelList item;

  const DetailList({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                    child: Image.network(
                      item.pictureId,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 15,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      item.name,
                      style: headline2,
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: greyColor,
                          size: 20,
                        ),
                        Text(
                          item.city,
                          style: headline5,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item.description,
                      style: headline7.copyWith(color: blackColor),
                    ),
                    const SizedBox(height: 11),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Foods",
                  style: headline5.copyWith(color: blackColor),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.only(left: 7),
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: item.menus.foods.length,
                  itemBuilder: (context, index) {
                    final food = item.menus.foods[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 130,
                        color: Color.fromARGB(255, 234, 233, 233),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8)),
                              child: Image.network(
                                "https://i0.wp.com/blog.duniamasak.com/wp-content/uploads/ilustrasi-makanan-sayur-lodeh-via-pinterest-ala-duniamasak.jpg?fit=564%2C564&ssl=1",
                                width: 130,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              food.name,
                              style: headline7,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Drinks",
                  style: headline5.copyWith(color: blackColor),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.only(left: 7),
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: item.menus.foods.length,
                  itemBuilder: (context, index) {
                    final food = item.menus.foods[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 130,
                        color: Color.fromARGB(255, 234, 233, 233),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8)),
                              child: Image.network(
                                "https://i0.wp.com/blog.duniamasak.com/wp-content/uploads/ilustrasi-makanan-sayur-lodeh-via-pinterest-ala-duniamasak.jpg?fit=564%2C564&ssl=1",
                                width: 130,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              food.name,
                              style: headline7,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
