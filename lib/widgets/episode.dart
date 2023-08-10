import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_episode.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.ep,
    required this.id,
  });

  final WebtoonEpisode ep;
  final String id;

  tab() async {
    await launchUrlString(
        "https://comic.naver.com/webtoon/detail?titleId=$id&no=${ep.id}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tab,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.greenAccent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ep.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Icon(
                Icons.arrow_right,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
