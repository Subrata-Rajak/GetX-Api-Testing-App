import '../data_models/users_data_model.dart';
import '../services/http_services.dart';

class UsersServices {
  static var client = HttpClient.httpClient;

  static Future<List<Users>> getUsers() async {
    var response = await client.get(
      Uri.parse(
        "https://jsonplaceholder.typicode.com/users",
      ),
    );

    final List<Users> users;

    if (response.statusCode == 200) {
      print("Success");
      var jsonString = response.body;
      users = usersFromJson(jsonString);
    } else {
      users = [];
      print(response.statusCode);
    }

    return users;
  }
}
