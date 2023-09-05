import 'package:json_annotation/json_annotation.dart';

import 'package:mbank/data/data.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterPageData {
  const CharacterPageData({
    required this.info,
    required this.results,
  });

  factory CharacterPageData.fromJson(Map<String, dynamic> json) => _$CharacterPageDataFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterPageDataToJson(this);

  final Info info;
  final List<Character> results;
}

@JsonSerializable()
class Character {
  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    // required this.origin,
    // required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterToJson(this);

  final int id;
  final String name;
  final CharacterStatus status;
  final String species;
  final String type;
  final Gender gender;
  // final Origin origin;
  // final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;
}

// @JsonSerializable()
// class Location {
//   const Location({required this.name, required this.url});

//   factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
//   Map<String, dynamic> toJson() => _$LocationToJson(this);

//   final String name;
//   final String url;
// }

// @JsonSerializable()
// class Origin {
//   const Origin({required this.name, required this.url});

//   factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);
//   Map<String, dynamic> toJson() => _$OriginToJson(this);

//   final String name;
//   final String url;
// }

enum CharacterStatus {
  @JsonValue("Alive")
  alive,
  @JsonValue("Dead")
  dead,
  @JsonValue("unknown")
  unknown,
}

enum Gender {
  @JsonValue("Female")
  female,
  @JsonValue("Male")
  male,
  @JsonValue("unknown")
  unknown,
  @JsonValue("Genderless")
  genderless,
}
