import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/models/category.dart';
import 'package:news_app/utilities/api_utilities.dart';

class CategoriesAPI {
  Future<List<Category>> fetchAllCategories() async {
    List<Category> categories = [];
    Category category;
    String allCategoriesAPI = baseApi + allCategoriesApi;
    var response = await http.get(allCategoriesAPI);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData['data'];
      for (var item in data) {
        category = Category(
          item['id'].toString(),
          item['title'].toString(),
        );
        categories.add(category);
      }
    }
    return categories;
  }
}
