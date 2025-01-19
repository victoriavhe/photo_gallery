import 'dart:convert';

import 'package:photo_gallery/app/data/dto/alternative_slugs_dto.dart';
import 'package:photo_gallery/app/data/dto/photo_links_dto.dart';
import 'package:photo_gallery/app/data/dto/topic_submission_dto.dart';
import 'package:photo_gallery/app/data/dto/urls_dto.dart';
import 'package:photo_gallery/app/data/dto/user_dto.dart';
import 'package:photo_gallery/app/domain/model/photo.dart';

/// Convert string of [PhotoDto] response and returns as object.
List<PhotoDto> photoDtoFromJson(String str) =>
    List<PhotoDto>.from(json.decode(str).map((x) => PhotoDto.fromJson(x)));

/// Convert from [PhotoDto] Object to JSON String.
///
/// This is not so essential if we just retrieve data from API.
/// and not working on object modification. However, this is used
/// when send Object to API, i.e for [POST] scenario.
String photoDtoToJson(List<PhotoDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class PhotoDto extends Photo {
  final String id;
  final String slug;
  final AlternativeSlugsDto alternativeSlugs;
  final DateTime updatedAt;
  final dynamic promotedAt;
  final int width;
  final int height;
  final String color;
  final String blurHash;
  final List<dynamic> breadcrumbs;
  final PhotoLinksDto links;
  final bool likedByUser;
  final List<dynamic> currentUserCollections;
  final dynamic sponsorship;
  final TopicSubmissionDto topicSubmissions;
  final String assetType;


  /// Properties marked as [super] are the properties that exists in [Photo]
  /// which is the Object which the [Domain] layer use to communicate
  /// with [Presentation] layer.
  ///
  /// This keyword is used to refer immediate parent class object, in this case
  /// [Photo] object.

  const PhotoDto({
    super.altDescription,
    super.description,
    required super.user,
    required super.urls,
    required super.createdAt,
    required super.likes,
    required this.id,
    required this.slug,
    required this.alternativeSlugs,
    required this.updatedAt,
    required this.promotedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    required this.breadcrumbs,
    required this.links,
    required this.likedByUser,
    required this.currentUserCollections,
    required this.sponsorship,
    required this.topicSubmissions,
    required this.assetType,
  }) : super();

  factory PhotoDto.fromJson(Map<String, dynamic> json) => PhotoDto(
    id: json["id"],
    slug: json["slug"],
    alternativeSlugs: AlternativeSlugsDto.fromJson(json["alternative_slugs"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    promotedAt: json["promoted_at"],
    width: json["width"],
    height: json["height"],
    color: json["color"],
    blurHash: json["blur_hash"],
    description: json["description"],
    altDescription: json["alt_description"],
    breadcrumbs: List<dynamic>.from(json["breadcrumbs"].map((x) => x)),
    urls: UrlsDto.fromJson(json["urls"]),
    links: PhotoLinksDto.fromJson(json["links"]),
    likes: json["likes"],
    likedByUser: json["liked_by_user"],
    currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
    sponsorship: json["sponsorship"],
    topicSubmissions: TopicSubmissionDto.fromJson(json["topic_submissions"]),
    assetType: json["asset_type"],
    user: UserDto.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "alternative_slugs": alternativeSlugs.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "promoted_at": promotedAt,
    "width": width,
    "height": height,
    "color": color,
    "blur_hash": blurHash,
    "description": description,
    "alt_description": altDescription,
    "breadcrumbs": List<dynamic>.from(breadcrumbs.map((x) => x)),
    "urls": (urls as UrlsDto).toJson(),
    "links": links.toJson(),
    "likes": likes,
    "liked_by_user": likedByUser,
    "current_user_collections": List<dynamic>.from(currentUserCollections.map((x) => x)),
    "sponsorship": sponsorship,
    "topic_submissions": topicSubmissions.toJson(),
    "asset_type": assetType,
    "user": (user as UserDto).toJson(),
  };
}
