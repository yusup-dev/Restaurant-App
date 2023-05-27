import 'dart:convert';
import 'package:exercise_1/model/model_list.dart';
import 'package:http/http.dart' as http;

class ServiceList {
  Future<List<ModelList>> getList() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/dicodingacademy/assets/main/flutter_fundamental_academy/local_restaurant.json'));

    if (response.statusCode == 200) {
      final Welcome welcome = Welcome.fromJson(json.decode(response.body));
      return welcome.restaurants;
    } else {
      throw Exception('Failed to load list restauran6t');
    }
  }
}
