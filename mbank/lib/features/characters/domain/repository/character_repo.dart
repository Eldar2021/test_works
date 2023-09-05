import 'package:mbank/core/core.dart';
import 'package:mbank/features/characters/characters.dart';

abstract class CharacterRepo {
  Future<(CharacterPageData?, MbankException?)> getCharacters(CharacterParams param);
}
