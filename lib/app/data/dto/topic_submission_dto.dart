import 'package:photo_gallery/app/data/dto/architecture_interior_dto.dart';
import 'package:photo_gallery/app/data/dto/experiemental_dto.dart';

class TopicSubmissionDto {
  final ArchitectureInteriorDto? architectureInterior;
  final ExperimentalDto? experimental;
  final ExperimentalDto? streetPhotography;
  final ArchitectureInteriorDto? texturesPatterns;
  final ArchitectureInteriorDto? wallpapers;
  final ExperimentalDto? nature;
  final ExperimentalDto? travel;

  TopicSubmissionDto({
    this.architectureInterior,
    this.experimental,
    this.streetPhotography,
    this.texturesPatterns,
    this.wallpapers,
    this.nature,
    this.travel,
  });

  factory TopicSubmissionDto.fromJson(Map<String, dynamic> json) =>
      TopicSubmissionDto(
        architectureInterior: json["architecture-interior"] == null
            ? null
            : ArchitectureInteriorDto.fromJson(json["architecture-interior"]),
        experimental: json["experimental"] == null
            ? null
            : ExperimentalDto.fromJson(json["experimental"]),
        streetPhotography: json["street-photography"] == null
            ? null
            : ExperimentalDto.fromJson(json["street-photography"]),
        texturesPatterns: json["textures-patterns"] == null
            ? null
            : ArchitectureInteriorDto.fromJson(json["textures-patterns"]),
        wallpapers: json["wallpapers"] == null
            ? null
            : ArchitectureInteriorDto.fromJson(json["wallpapers"]),
        nature: json["nature"] == null
            ? null
            : ExperimentalDto.fromJson(json["nature"]),
        travel: json["travel"] == null
            ? null
            : ExperimentalDto.fromJson(json["travel"]),
      );

  Map<String, dynamic> toJson() => {
        "architecture-interior": architectureInterior?.toJson(),
        "experimental": experimental?.toJson(),
        "street-photography": streetPhotography?.toJson(),
        "textures-patterns": texturesPatterns?.toJson(),
        "wallpapers": wallpapers?.toJson(),
        "nature": nature?.toJson(),
        "travel": travel?.toJson(),
      };
}
