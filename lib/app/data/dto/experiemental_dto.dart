import 'package:photo_gallery/app/data/enum/status.dart';

class ExperimentalDto {
  final Status? status;
  final DateTime? approvedOn;

  ExperimentalDto({
    this.status,
    this.approvedOn,
  });

  factory ExperimentalDto.fromJson(Map<String, dynamic> json) => ExperimentalDto(
    status: statusValues.map[json["status"]],
    approvedOn: json["approved_on"] == null ? null : DateTime.parse(json["approved_on"]),
  );

  Map<String, dynamic> toJson() => {
    "status": statusValues.reverse[status],
    "approved_on": approvedOn?.toIso8601String(),
  };
}