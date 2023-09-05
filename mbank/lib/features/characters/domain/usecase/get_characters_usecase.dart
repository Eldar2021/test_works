import 'package:mbank/core/core.dart';
import 'package:mbank/features/features.dart';

class GetCharactersUsecase extends UseCase<CharacterPageData, CharacterParams> {
  const GetCharactersUsecase(this.reposiory);

  final CharacterRepo reposiory;

  @override
  Future<(CharacterPageData?, Exception?)> call(CharacterParams params) {
    return reposiory.getCharacters(params);
  }
}

class CharacterParams {
  const CharacterParams(this.pageIndex, {this.characterStatus, this.searchName});

  final int pageIndex;
  final CharacterStatus? characterStatus;
  final String? searchName;

  String get path {
    if (characterStatus != null && searchName != null) {
      return 'page=$pageIndex&name=$searchName&status=${characterStatus!.name}';
    }
    if (characterStatus != null) return 'page=$pageIndex&status=${characterStatus!.name}';
    if (searchName != null) return 'page=$pageIndex&name=$searchName';
    return 'page=$pageIndex';
  }

  CharacterParams copyWith({int? pageIndex, CharacterStatus? characterStatus, String? searchName}) {
    return CharacterParams(
      pageIndex ?? this.pageIndex,
      characterStatus: characterStatus ?? this.characterStatus,
      searchName: searchName ?? this.searchName,
    );
  }
}
