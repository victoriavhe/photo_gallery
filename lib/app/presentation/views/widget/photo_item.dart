import 'package:flutter/material.dart';
import 'package:photo_gallery/app/domain/model/photo.dart';
import 'package:photo_gallery/app/presentation/views/widget/app_cached_image.dart';

typedef OnItemTapped = void Function(Photo photo);

class PhotoItem extends StatelessWidget {
  const PhotoItem({
    super.key,
    required this.photo,
    required this.onItemTapped,
    required this.photoSize,
  });

  final Photo photo;
  final OnItemTapped onItemTapped;
  final double photoSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return InkWell(
      onTap: () => onItemTapped.call(photo),
      child: Stack(
        children: [
          AppCachedImage(
            imageUrl: photo.urls.thumb,
            height: photoSize,
            width: photoSize,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black.withAlpha(100),
              padding: EdgeInsets.symmetric(horizontal: 6),
              height: 40,
              child: Center(
                child: Text(
                  'Photo by ${photo.user.name}',
                  textAlign: TextAlign.center,
                  style: textTheme.labelSmall?.copyWith(
                    color: Colors.white.withAlpha(225),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
