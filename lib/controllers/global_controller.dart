import 'package:api_testing/services/user_post_services.dart';
import 'package:get/get.dart';

import '../services/post_service.dart';
import '../services/users_service.dart';

class GlobalController extends GetxController {
  var postsList = [].obs;
  var userList = [].obs;
  var userPostsList = [].obs;
  var isLoading = false.obs;

  void fetchAllPosts() async {
    isLoading.value = true;
    var posts = await PostServices.getPosts();
    postsList.value = posts;
    isLoading.value = false;
  }

  void fetchUsers() async {
    isLoading.value = true;
    var user = await UsersServices.getUsers();
    userList.value = user;
    isLoading.value = false;
  }

  void fetchUserPosts(int id) async {
    isLoading.value = true;
    var userPosts = await UserPostsServices.getUserPosts(id);
    userPostsList.value = userPosts;
    isLoading.value = false;
  }
}
