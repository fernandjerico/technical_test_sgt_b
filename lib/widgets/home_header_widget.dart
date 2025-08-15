import 'package:flutter/material.dart';
import 'package:technical_test_sgt_b/core/theme/app_colors.dart';

class HomeHeaderWidget extends StatelessWidget {
  final String userName;
  final String avatarUrl;

  const HomeHeaderWidget({
    super.key,
    required this.userName,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, Welcome 👋',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.grey4Color,
              ),
            ),
            Text(
              userName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.grey10Color,
              ),
            ),
          ],
        ),
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(avatarUrl),
        ),
      ],
    );
  }
}
