import 'package:mbank/core/core.dart';
import 'package:mbank/features/features.dart';

import 'package:mbank/constants/constants.dart';

class CharacterRepoImpl implements CharacterRepo {
  const CharacterRepoImpl({
    required this.remoteClient,
    required this.networkClient,
  });

  final RemoteClient remoteClient;
  final NetworkClient networkClient;

  @override
  Future<(CharacterPageData?, MbankException?)> getCharacters(CharacterParams params) async {
    if (await networkClient.checkInternetConnection()) {
      return remoteClient.get<CharacterPageData>(
        '${ApiConst.characters}${params.path}',
        fromJson: CharacterPageData.fromJson,
      );
    } else {
      return Future.value((null, ConnectionException()));
    }
  }
}
