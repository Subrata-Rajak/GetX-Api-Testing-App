import 'package:api_testing/widgets/common_widgets/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/list_items/user_list_item.dart';
import '../controllers/global_controller.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({super.key});

  final GlobalController globalController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    globalController.fetchUsers();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "Users",
        ),
      ),
      drawer: const SideDrawer(),
      body: Obx(
        () {
          Widget widget;
          if (globalController.isLoading.value) {
            widget = const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            widget = Container(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: globalController.userList.length,
                itemBuilder: (context, index) {
                  return UserListItem(
                    globalController.userList[index].id,
                    globalController.userList[index].name,
                    globalController.userList[index].username,
                    globalController.userList[index].email,
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
