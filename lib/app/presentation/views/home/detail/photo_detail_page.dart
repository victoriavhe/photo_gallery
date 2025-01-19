import 'package:flutter/material.dart';
import 'package:photo_gallery/app/domain/model/photo.dart';
import 'package:photo_gallery/app/presentation/views/home/detail/user_profile_handle.dart';
import 'package:photo_gallery/app/presentation/views/widget/app_cached_image.dart';
import 'package:photo_gallery/app/utils/date_extension.dart';

class PhotoDetailPage extends StatelessWidget {
  const PhotoDetailPage({
    super.key,
    required this.photo,
  });

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Photo by ${photo.user.name}',
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildImage(context),
              _buildImageDetail(context),
            ],
          ),
        ),
      ),
    );
  }

  _buildImage(ctx) {
    return AppCachedImage(
      imageUrl: photo.urls.regular,
      plhHeight: MediaQuery.of(ctx).size.height * .6,
      width: MediaQuery.of(ctx).size.width,
    );
  }

  _buildImageDetail(ctx) {
    final theme = Theme.of(ctx);
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserProfileHandle(user: photo.user),
          SizedBox(height: 18),
          Text(
            photo.description ?? photo.altDescription ?? '',
            style: textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          const SizedBox(height: 4),
          Text(photo.createdAt.formatDate(), style: textTheme.bodySmall),
        ],
      ),
    );
  }
}
