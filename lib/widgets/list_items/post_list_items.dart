import 'package:api_testing/widgets/common_widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class PostListItem extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;

  const PostListItem(
    this.index,
    this.title,
    this.subtitle, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      index.toString(),
      title,
      subtitle,
    );
  }
}
