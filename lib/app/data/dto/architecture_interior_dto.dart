import 'package:photo_gallery/app/data/enum/status.dart';

class ArchitectureInteriorDto {
  final Status? status;

  ArchitectureInteriorDto({
    this.status,
  });

  factory ArchitectureInteriorDto.fromJson(Map<String, dynamic> json) => ArchitectureInteriorDto(
    status: statusValues.map[json["status"]],
  );

  Map<String, dynamic> toJson() => {
    "status": statusValues.reverse[status],
  };
}