// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterPageData _$CharacterPageDataFromJson(Map<String, dynamic> json) =>
    CharacterPageData(
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterPageDataToJson(CharacterPageData instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
      count: json['count'] as int,
      pages: json['pages'] as int,
    );

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
    };

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      id: json['id'] as int,
      name: json['name'] as String,
      status: $enumDecode(_$StatusEnumMap, json['status']),
      species: json['species'] as String,
      type: json['type'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      image: json['image'] as String,
      episode:
          (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': _$StatusEnumMap[instance.status]!,
      'species': instance.species,
      'type': instance.type,
      'gender': _$GenderEnumMap[instance.gender]!,
      'image': instance.image,
      'episode': instance.episode,
      'url': instance.url,
    };

const _$StatusEnumMap = {
  CharacterStatus.alive: 'Alive',
  CharacterStatus.dead: 'Dead',
  CharacterStatus.unknown: 'unknown',
};

const _$GenderEnumMap = {
  Gender.female: 'Female',
  Gender.male: 'Male',
  Gender.unknown: 'unknown',
  Gender.genderless: 'Genderless',
};
