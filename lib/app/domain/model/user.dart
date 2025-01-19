import 'package:equatable/equatable.dart';
import 'package:photo_gallery/app/domain/model/profile_image.dart';

class User extends Equatable {
  final String username;
  final String name;
  final String firstName;
  final String? lastName;
  final String? twitterUsername;
  final int totalLikes;
  final int totalPhotos;
  final ProfileImage profileImage;

  const User({
    this.lastName,
    this.twitterUsername,
    required this.username,
    required this.name,
    required this.firstName,
    required this.totalLikes,
    required this.totalPhotos,
    required this.profileImage,
  });

  @override
  List<Object?> get props => [
    username,
    name,
    firstName,
    lastName,
    twitterUsername,
    totalLikes,
    totalPhotos,
    profileImage
  ];
}