class AlternativeSlugsDto {
  final String en;
  final String es;
  final String ja;
  final String fr;
  final String it;
  final String ko;
  final String de;
  final String pt;

  AlternativeSlugsDto({
    required this.en,
    required this.es,
    required this.ja,
    required this.fr,
    required this.it,
    required this.ko,
    required this.de,
    required this.pt,
  });

  factory AlternativeSlugsDto.fromJson(Map<String, dynamic> json) => AlternativeSlugsDto(
    en: json["en"],
    es: json["es"],
    ja: json["ja"],
    fr: json["fr"],
    it: json["it"],
    ko: json["ko"],
    de: json["de"],
    pt: json["pt"],
  );

  Map<String, dynamic> toJson() => {
    "en": en,
    "es": es,
    "ja": ja,
    "fr": fr,
    "it": it,
    "ko": ko,
    "de": de,
    "pt": pt,
  };
}