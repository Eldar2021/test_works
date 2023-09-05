import 'package:flutter/material.dart';
import 'package:mbank/features/episods/data/model/episode_model.dart';

class EpisodeDetailView extends StatelessWidget {
  const EpisodeDetailView(this.episode, {super.key});

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(episode.name),
      ),
      body: Column(
        children: [
          Text(episode.url),
          Text('${episode.created}'),
          Text('${episode.id}'),
        ],
      ),
    );
  }
}
