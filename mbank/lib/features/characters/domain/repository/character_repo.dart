import 'package:mbank/features/characters/characters.dart';

abstract class CharacterRepo {
  Future<(CharacterPageData?, Exception?)> getCharacters(CharacterParams param);
}
