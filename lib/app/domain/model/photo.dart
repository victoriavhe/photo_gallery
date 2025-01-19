import 'package:equatable/equatable.dart';
import 'package:photo_gallery/app/data/dto/photo_dto.dart';
import 'package:photo_gallery/app/domain/model/urls.dart';
import 'package:photo_gallery/app/domain/model/user.dart';

/// Consisting of properties needed by the presentation layer.
///
/// Can be adjusted by adding new properties, please refer to each DTO with
/// the same name. [PhotoDto] for [Photo], etc.

class Photo extends Equatable {
  final DateTime createdAt;
  final String? description;
  final Urls urls;
  final User user;
  final String? altDescription;
  final int likes;

  const Photo({
    required this.createdAt,
    this.description,
    required this.urls,
    required this.user,
    required this.altDescription,
    required this.likes,
  });

  @override
  List<Object?> get props => [
    createdAt,
    description,
    urls,
    user,
    altDescription,
    likes
  ];
}
