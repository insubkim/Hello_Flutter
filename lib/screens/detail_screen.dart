import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/models/detail_model.dart';
import 'package:toonflix/models/webtoon_episode.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:toonflix/widgets/episode.dart';

class DetailScreen extends StatefulWidget {
  final String title;
  final String thumb;
  final String id;

  const DetailScreen({
    super.key,
    required this.id,
    required this.thumb,
    required this.title,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<List<WebtoonEpisode>> episodes;
  late Future<DetailModel> detailModel;
  late SharedPreferences prefs;
  late bool isLiked;

  void getPrefs() async {
    prefs = await SharedPreferences.getInstance();
    List<String>? liked = prefs.getStringList('liked_webtoon');
    if (liked == null) {
      await prefs.setStringList('liked_webtoon', []);
    } else {
      if (liked.contains(widget.id)) {
        setState(() {
          isLiked = true;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    detailModel = ApiService.getToonDetailById(widget.id);
    episodes = ApiService.getToonEpisodesDetailById(widget.id);
    isLiked = false;
    getPrefs();
  }

  onHeartPress() async {
    final List<String>? liked = prefs.getStringList('liked_webtoon');
    if (liked != null) {
      if (isLiked) {
        liked.remove(widget.id);
      } else {
        liked.add(widget.id);
      }
      await prefs.setStringList('liked_webtoon', liked);
    }

    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: onHeartPress,
              icon: isLiked
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_outline))
        ],
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 180, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id,
                    child: Container(
                      width: 250,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 15,
                              offset: const Offset(15, 15),
                            )
                          ]),
                      child: Image.network(widget.thumb),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: detailModel,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${snapshot.data!.genre} / ${snapshot.data!.age}',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Text('...');
                  }
                },
              ),
              FutureBuilder(
                builder: (context, snapshot) {
                  return const SizedBox(
                    height: 20,
                  );
                },
              ),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (var ep in snapshot.data!)
                          Episode(ep: ep, id: widget.id),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
