import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/restaurant.dart';

class ApiService {
  Future<List<Restaurant>> getRestaurants() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/dicodingacademy/assets/main/flutter_fundamental_academy/local_restaurant.json'));

    if (response.statusCode == 200) {
      final Welcome welcome = Welcome.fromJson(json.decode(response.body));
      return welcome.restaurants;
    } else {
      throw Exception('Failed to load restaurants');
    }
  }
}
