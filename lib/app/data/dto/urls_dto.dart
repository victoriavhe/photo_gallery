import 'package:photo_gallery/app/domain/model/urls.dart';

class UrlsDto extends Urls {
  const UrlsDto({
    required super.raw,
    required super.full,
    required super.regular,
    required super.small,
    required super.thumb,
    required super.smallS3,
  });

  factory UrlsDto.fromJson(Map<String, dynamic> json) => UrlsDto(
    raw: json["raw"],
    full: json["full"],
    regular: json["regular"],
    small: json["small"],
    thumb: json["thumb"],
    smallS3: json["small_s3"],
  );

  Map<String, dynamic> toJson() => {
    "raw": raw,
    "full": full,
    "regular": regular,
    "small": small,
    "thumb": thumb,
    "small_s3": smallS3,
  };
}