class FestivalModels {
  String festivalName, description, date, moral, region, thumbnail;
  List<String> images;
  List<String> detailing;
  List<String> wishes;

  FestivalModels({
    required this.festivalName,
    required this.description,
    required this.date,
    required this.region,
    required this.moral,
    required this.thumbnail,
    required this.detailing,
    required this.images,
    required this.wishes,
  });

  factory FestivalModels.fromMap({required Map data}) => FestivalModels(
        festivalName: data['festivalName'],
        description: data['description'],
        date: data['date'],
        moral: data['moral'],
        region: data['region'],
        thumbnail: data['thumbnail'],
        detailing: data['detailing'],
        images: data['images'],
        wishes: data['wishes'],
      );
}
