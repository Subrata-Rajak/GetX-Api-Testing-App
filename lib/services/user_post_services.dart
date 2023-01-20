import '../data_models/user_post_data.dart';
import '../services/http_services.dart';

class UserPostsServices {
  static var client = HttpClient.httpClient;

  static Future<List<UserPost>> getUserPosts(int id) async {
    var response = await client.get(
      Uri.parse(
        "https://jsonplaceholder.typicode.com/users/$id/posts",
      ),
    );

    final List<UserPost> userPost;

    if (response.statusCode == 200) {
      var jsonString = response.body;
      userPost = userPostFromJson(jsonString);
    } else {
      userPost = [];
    }

    return userPost;
  }
}
