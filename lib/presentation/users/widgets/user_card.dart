import 'package:flutter/material.dart';
import 'package:makit/consts/colors.dart';
import 'package:makit/data/models/user/user_model.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({
    super.key,
    required this.user
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(
        Icons.account_circle_outlined,
        size: 50,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          Text(
            user.email,
            style: TextStyle(
              fontSize: 13,
              color: grayColor
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          Text(
            user.username,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}