import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/list_items/post_list_items.dart';
import '../controllers/global_controller.dart';

class PostsScreen extends StatelessWidget {
  static const routeName = '/post_screen';

  PostsScreen({super.key});

  final GlobalController globalController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Posts",
        ),
        backgroundColor: Colors.amber,
      ),
      body: Obx(
        () {
          Widget widget;

          if (globalController.isLoading.value) {
            widget = const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            widget = Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: globalController.postsList.length,
                itemBuilder: (context, index) {
                  return PostListItem(
                    globalController.postsList[index].id,
                    globalController.postsList[index].title,
                    globalController.postsList[index].body,
                  );
                },
              ),
            );
          }
          return widget;
        },
      ),
    );
  }
}
