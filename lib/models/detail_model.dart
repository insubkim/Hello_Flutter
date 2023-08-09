class DetailModel {
  final String title;
  final String about;
  final String genre;
  final String age;
  final String thumb;

  DetailModel(
      {required this.title,
      required this.about,
      required this.genre,
      required this.age,
      required this.thumb});

  DetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        about = json['about'],
        genre = json['genre'],
        age = json['age'],
        thumb = json['thumb'];
}
