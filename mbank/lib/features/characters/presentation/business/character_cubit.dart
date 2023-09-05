import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbank/core/core.dart';

import 'package:mbank/features/features.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit(this.getCharactersUsecase) : super(const CharacterState(status: FetchStatus.success));

  final GetCharactersUsecase getCharactersUsecase;

  final List<Character> characters = [];

  Future<(List<Character>?, int?, MbankException?)> getCharacters([int page = 1]) async {
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
      emit(state.copyWith(status: FetchStatus.failure, exception: exception));
    }
    return (data?.results, data?.info.pages, exception);
  }

  void changeFilterStautus(CharacterStatus? characterStatus) {
    emit(state.copyWith(characterStatus: characterStatus));
  }

  void changeSeractName(String? searchName) {
    emit(state.copyWith(searchName: searchName));
  }
}
