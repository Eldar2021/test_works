import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mbank/features/features.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit(this.getCharactersUsecase) : super(const CharacterState(status: FetchStatus.success));

  final GetCharactersUsecase getCharactersUsecase;

  final List<Character> characters = [];

  Future<(List<Character>?, int?, Exception?)> getCharacters([int page = 1]) async {
    final params = CharacterParams(
      page,
      characterStatus: state.characterStatus,
      searchName: state.searchName,
    );
    final (data, exception) = await getCharactersUsecase(params);
    if (data != null) {
      characters.addAll(data.results);
      emit(state.copyWith(status: FetchStatus.success, characters: characters));
    } else {
      emit(state.copyWith(status: FetchStatus.failure));
    }
    return (data?.results, data?.info.pages, exception);
  }

  Future<void> changeFilterStautus(CharacterStatus? characterStatus) async {
    emit(state.copyWith(characterStatus: characterStatus));
  }
}
