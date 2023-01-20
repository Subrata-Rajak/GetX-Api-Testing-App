import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String avatar;
  final String title;
  final String subtitle;

  const CustomListTile(
    this.avatar,
    this.title,
    this.subtitle, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.amber,
        child: Text(
          avatar,
        ),
      ),
      title: Text(
        title,
      ),
      subtitle: Text(
        subtitle,
      ),
    );
  }
}
