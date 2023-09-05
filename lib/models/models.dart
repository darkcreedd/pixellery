class PexelsPhoto {
  int id;
  String imageUrl;
  String photographer;
  bool downloaded;
  bool liked;
  String alt;

  PexelsPhoto({
    required this.id,
    required this.imageUrl,
    required this.photographer,
    required this.downloaded,
    required this.liked,
    required this.alt,
  });
}
