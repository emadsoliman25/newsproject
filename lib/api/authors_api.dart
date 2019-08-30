import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/models/author.dart';
import 'package:news_app/utilities/api_utilities.dart';

class AuthorsAPI {
  Future<List<Author>> fetchAllAuthors() async {
    List<Author> authors = [];
    Author author;
    String allAuthorsAPI = baseApi + allAuthorsApi;
    var response = await http.get(allAuthorsAPI);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["data"];
      for (var item in data) {
        author = Author(
          item['id'].toString(),
          item['name'].toString(),
          item['email'].toString(),
          item['avatar'].toString(),
        );
        authors.add(author);
      }
    }
    return authors;
  }
}

