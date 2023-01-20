import 'package:api_testing/widgets/common_widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class UserPostListItem extends StatelessWidget {
  final int id;
  final String title;
  final String body;

  const UserPostListItem(
    this.id,
    this.title,
    this.body, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      id.toString(),
      title,
      body,
    );
  }
}
