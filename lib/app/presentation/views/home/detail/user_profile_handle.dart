import 'package:flutter/material.dart';
import 'package:photo_gallery/app/domain/model/user.dart';
import 'package:photo_gallery/app/presentation/views/widget/app_cached_image.dart';

class UserProfileHandle extends StatelessWidget {
  const UserProfileHandle({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Row(
      children: [
        AppCachedImage(
          imageUrl: user.profileImage.small,
          imageBuilder: (_, child) {
            return CircleAvatar(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(image: child, fit: BoxFit.cover),
                ),
              ),
            );
          },
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              user.username,
              style: textTheme.bodyMedium?.copyWith(
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
