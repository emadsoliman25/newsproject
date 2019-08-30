import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/utilities/api_utilities.dart';
import 'package:news_app/models/post.dart';
class PostsApi {
  Future<List<Post>> fetchPostsByCategoryId(String id) async {
    List<Post> posts = [];
    Post post;
    String postsApi = baseApi + categoriesApi + id;
    var response = await http.get(postsApi);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData['data'];
      for (var item in data) {
        post = Post(
          id: item['id'].toString(),
          title: item['title'].toString(),
          content: item['content'].toString(),
          dataWritten: item['date_written'].toString(),
          featuredImage: item['featured_image'].toString(),
          votesUp: item['votes_up'],
          votesDown: item['votes_down'],
          votersUp: (item['voters_up'] == null) ? List<int>() : jsonDecode(
              item['voters_up']),
          votersDown: (item['voters_down'] == null) ? List<int>() : jsonDecode(
              item['voters_down']),
          userId: item['user_id'],
          categoryId: item['category_id'],
        );
        posts.add(post);
      }
    }
    return posts;
  }
}