import 'package:exercise_1/model/model_list.dart';
import 'package:exercise_1/service/service_list.dart';
import 'package:exercise_1/common/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../widgets/detail_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Restaurant App",
          style: headline1,
        ),
        backgroundColor: whiteColor,
      ),
      body: FutureBuilder<List<ModelList>>(
        future: ServiceList().getList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final listRs = snapshot.data!;
            return ListView.builder(
              itemCount: listRs.length,
              itemBuilder: (context, index) {
                final listR = listRs[index];
                return InkWell(
                  onTap: () {
                    timeDilation = 5.0;
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailList(item: listR)));
                  },
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      margin:
                          const EdgeInsets.only(top: 24, right: 16, left: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 218, 216, 216),
                            spreadRadius: 2,
                            blurRadius: 7.0,
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Hero(
                              tag: listR,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  listR.pictureId,
                                  fit: BoxFit.cover,
                                  height: 100,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(listR.name, style: headline6),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: greyColor,
                                      size: 15,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      listR.city,
                                      style: headline7,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 20,
                                      color: yellowColor,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "${listR.rating}",
                                      style: headline4,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
