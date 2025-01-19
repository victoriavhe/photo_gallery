class PhotoLinksDto {
  final String self;
  final String html;
  final String download;
  final String downloadLocation;

  PhotoLinksDto({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });

  factory PhotoLinksDto.fromJson(Map<String, dynamic> json) => PhotoLinksDto(
    self: json["self"],
    html: json["html"],
    download: json["download"],
    downloadLocation: json["download_location"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
    "html": html,
    "download": download,
    "download_location": downloadLocation,
  };
}