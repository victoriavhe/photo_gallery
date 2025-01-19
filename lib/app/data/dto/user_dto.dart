import 'package:photo_gallery/app/data/dto/profile_image_dto.dart';
import 'package:photo_gallery/app/data/dto/social_dto.dart';
import 'package:photo_gallery/app/data/dto/user_links_dto.dart';
import 'package:photo_gallery/app/domain/model/user.dart';

class UserDto extends User {
  final String id;
  final DateTime updatedAt;
  final String? portfolioUrl;
  final String? bio;
  final String? location;
  final UserLinksDto links;
  final String? instagramUsername;
  final int totalCollections;
  final int totalPromotedPhotos;
  final int totalIllustrations;
  final int totalPromotedIllustrations;
  final bool acceptedTos;
  final bool forHire;
  final SocialDto social;

  const UserDto({
    super.lastName,
    super.twitterUsername,
    required super.username,
    required super.name,
    required super.firstName,
    required super.totalLikes,
    required super.totalPhotos,
    required super.profileImage,
    required this.id,
    required this.updatedAt,
    required this.portfolioUrl,
    required this.bio,
    required this.location,
    required this.links,
    required this.instagramUsername,
    required this.totalCollections,
    required this.totalPromotedPhotos,
    required this.totalIllustrations,
    required this.totalPromotedIllustrations,
    required this.acceptedTos,
    required this.forHire,
    required this.social,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
    id: json["id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    username: json["username"],
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    twitterUsername: json["twitter_username"],
    portfolioUrl: json["portfolio_url"],
    bio: json["bio"],
    location: json["location"],
    links: UserLinksDto.fromJson(json["links"]),
    profileImage: ProfileImageDto.fromJson(json["profile_image"]),
    instagramUsername: json["instagram_username"],
    totalCollections: json["total_collections"],
    totalLikes: json["total_likes"],
    totalPhotos: json["total_photos"],
    totalPromotedPhotos: json["total_promoted_photos"],
    totalIllustrations: json["total_illustrations"],
    totalPromotedIllustrations: json["total_promoted_illustrations"],
    acceptedTos: json["accepted_tos"],
    forHire: json["for_hire"],
    social: SocialDto.fromJson(json["social"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "updated_at": updatedAt.toIso8601String(),
    "username": username,
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "twitter_username": twitterUsername,
    "portfolio_url": portfolioUrl,
    "bio": bio,
    "location": location,
    "links": links.toJson(),
    "profile_image": (profileImage as ProfileImageDto).toJson(),
    "instagram_username": instagramUsername,
    "total_collections": totalCollections,
    "total_likes": totalLikes,
    "total_photos": totalPhotos,
    "total_promoted_photos": totalPromotedPhotos,
    "total_illustrations": totalIllustrations,
    "total_promoted_illustrations": totalPromotedIllustrations,
    "accepted_tos": acceptedTos,
    "for_hire": forHire,
    "social": social.toJson(),
  };
}