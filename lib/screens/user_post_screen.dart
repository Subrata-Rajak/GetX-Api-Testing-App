import 'package:api_testing/argument_models/user_post_args_model.dart';
import 'package:api_testing/controllers/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/list_items/user_post_list_item.dart';

class UserPostsScreen extends StatelessWidget {
  static const routeName = '/user_posts';
  
  UserPostsScreen({super.key});

  final GlobalController _globalController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as UserPostArgs;

    final String name = args.name;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$name's Posts",
        ),
        backgroundColor: Colors.amber,
      ),
      body: Obx(
        () {
          Widget widget;

          if (_globalController.isLoading.value) {
            widget = const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            widget = Container(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: _globalController.userPostsList.length,
                itemBuilder: (context, index) {
                  return UserPostListItem(
                    _globalController.userPostsList[index].id,
                    _globalController.userPostsList[index].title,
                    _globalController.userPostsList[index].body,
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
