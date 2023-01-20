import 'package:api_testing/services/http_services.dart';
import '../data_models/posts_data_model.dart';

class PostServices {
  static var client = HttpClient.httpClient;

  static Future<List<AllPosts>> getPosts() async {
    var response = await client.get(
      Uri.parse(
        "https://jsonplaceholder.typicode.com/posts",
      ),
    );

    final List<AllPosts> posts;

    if (response.statusCode == 200) {
      var jsonString = response.body;
      posts = allPostsFromJson(jsonString);
    } else {
      posts = [];
    }

    return posts;
  }
}
