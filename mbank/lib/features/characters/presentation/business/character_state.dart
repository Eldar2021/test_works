part of 'character_cubit.dart';

enum FetchStatus { loading, success, failure }

class CharacterState extends Equatable {
  const CharacterState({
    this.status = FetchStatus.loading,
    this.characterStatus,
    this.searchName,
    this.characters,
    this.exception,
  });

  final FetchStatus status;
  final CharacterStatus? characterStatus;
  final String? searchName;
  final List<Character>? characters;
  final Exception? exception;

  @override
  List<Object?> get props => [status, characterStatus, exception];

  CharacterState copyWith({
    FetchStatus? status,
    CharacterStatus? characterStatus,
    String? searchName,
    List<Character>? characters,
    Exception? exception,
  }) {
    return CharacterState(
      status: status ?? this.status,
      characterStatus: characterStatus ?? this.characterStatus,
      searchName: searchName ?? this.searchName,
      characters: characters ?? this.characters,
      exception: exception ?? this.exception,
    );
  }
}
