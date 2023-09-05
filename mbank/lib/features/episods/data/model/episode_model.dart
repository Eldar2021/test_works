import 'package:json_annotation/json_annotation.dart';
import 'package:mbank/data/data.dart';

part 'episode_model.g.dart';

@JsonSerializable()
class EpisodePageData {
  const EpisodePageData({
    required this.info,
    required this.results,
  });

  factory EpisodePageData.fromJson(Map<String, dynamic> json) => _$EpisodePageDataFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodePageDataToJson(this);

  final Info info;
  final List<Episode> results;
}

@JsonSerializable()
class Episode {
  const Episode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => _$EpisodeFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeToJson(this);

  final int id;
  final String name;
  final String? airDate;
  final String episode;
  final List<String> characters;
  final String url;
  final DateTime created;
}
