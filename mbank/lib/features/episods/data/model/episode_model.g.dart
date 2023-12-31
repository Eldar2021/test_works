// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodePageData _$EpisodePageDataFromJson(Map<String, dynamic> json) => EpisodePageData(
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>).map((e) => Episode.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$EpisodePageDataToJson(EpisodePageData instance) => <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };

Episode _$EpisodeFromJson(Map<String, dynamic> json) => Episode(
      id: json['id'] as int,
      name: json['name'] as String,
      airDate: json['airDate'] as String?,
      episode: json['episode'] as String,
      characters: (json['characters'] as List<dynamic>).map((e) => e as String).toList(),
      url: json['url'] as String,
      created: DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'airDate': instance.airDate,
      'episode': instance.episode,
      'characters': instance.characters,
      'url': instance.url,
      'created': instance.created.toIso8601String(),
    };
