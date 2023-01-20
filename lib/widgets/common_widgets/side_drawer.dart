import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/global_controller.dart';
import '../../screens/posts_screen.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.amber),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Api Testing App",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Made by Subrata with 💓",
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text(
              "All Posts",
            ),
            onTap: () {
              final GlobalController globalController =
                  Get.put(GlobalController());
              globalController.fetchAllPosts();
              Navigator.pop(context);
              Navigator.pushNamed(context, PostsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
