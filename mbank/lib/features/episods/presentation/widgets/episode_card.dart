import 'package:flutter/material.dart';
import 'package:mbank/app/router/app_router.dart';
import 'package:mbank/features/episods/episods.dart';

class EpisodeCard extends StatelessWidget {
  const EpisodeCard(this.episode, {super.key});

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(episode.episode),
        title: Text(episode.name),
        subtitle: Text(episode.airDate ?? ''),
        trailing: Text('${episode.id}'),
        onTap: () {
          Navigator.of(context).pushNamed(
            AppRouter.episodDetail,
            arguments: episode,
          );
        },
      ),
    );
  }
}
