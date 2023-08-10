class WebtoonEpisode {
  final String title;
  final String id;
  final String rating;
  final String date;

  WebtoonEpisode(
      {required this.title,
      required this.id,
      required this.rating,
      required this.date});

  WebtoonEpisode.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        id = json['id'],
        rating = json['rating'],
        date = json['date'];
}
