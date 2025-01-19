import 'package:photo_gallery/app/domain/model/profile_image.dart';

class ProfileImageDto extends ProfileImage {

  final String medium;
  final String large;

  ProfileImageDto({
    required super.small,
    required this.medium,
    required this.large,
  });

  factory ProfileImageDto.fromJson(Map<String, dynamic> json) => ProfileImageDto(
    small: json["small"],
    medium: json["medium"],
    large: json["large"],
  );

  Map<String, dynamic> toJson() => {
    "small": small,
    "medium": medium,
    "large": large,
  };
}