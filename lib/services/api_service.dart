import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/detail_model.dart';
import 'package:toonflix/models/webtoon_episode.dart';
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];

    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<DetailModel> getToonDetailById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return DetailModel.fromJson(jsonDecode(response.body));
    }
    throw Error();
  }

  static Future<List<WebtoonEpisode>> getToonEpisodesDetailById(
      String id) async {
    final List<WebtoonEpisode> webtoonEpisodesInstances = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        webtoonEpisodesInstances.add(WebtoonEpisode.fromJson(episode));
      }
      return webtoonEpisodesInstances;
    }
    throw Error();
  }
}
