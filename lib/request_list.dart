import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model_food.dart';

class GetFood {
  static Future<List<Food>> getFoods() async {
    try {
      final response = await http
          .get("https://www.themealdb.com/api/json/v1/1/search.php?f=b");
      if (response.statusCode == 200) {
        List<Food> list = parseFoods(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Food> parseFoods(String responseBody) {
    final parsed = jsonDecode(responseBody)['meals'] as List;
    return parsed.map((json) => Food.createFood(json)).toList();
  }
}
