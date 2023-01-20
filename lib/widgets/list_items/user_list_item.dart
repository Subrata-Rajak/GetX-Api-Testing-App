import 'package:api_testing/controllers/global_controller.dart';
import 'package:api_testing/widgets/common_widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/user_post_screen.dart';
import '../../argument_models/user_post_args_model.dart';

class UserListItem extends StatelessWidget {
  final GlobalController globalController = Get.put(GlobalController());

  final int id;
  final String name;
  final String userName;
  final String email;

  UserListItem(
    this.id,
    this.name,
    this.userName,
    this.email, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          UserPostsScreen.routeName,
          arguments: UserPostArgs(
            name: name,
          ),
        );
        globalController.fetchUserPosts(id);
      },
      child: CustomListTile(
        id.toString(),
        "$name ($userName)",
        email,
      ),
    );
  }
}
