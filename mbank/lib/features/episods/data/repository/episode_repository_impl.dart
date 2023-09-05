import 'package:mbank/constants/constants.dart';
import 'package:mbank/core/core.dart';
import 'package:mbank/features/features.dart';

class EpisodeRepoImpl implements EpisodeRepo {
  const EpisodeRepoImpl({
    required this.remoteClient,
    required this.networkClient,
  });

  final RemoteClient remoteClient;
  final NetworkClient networkClient;

  @override
  Future<(EpisodePageData?, MbankException?)> getEpisods(EpisodParams params) async {
    if (await networkClient.checkInternetConnection()) {
      return remoteClient.get<EpisodePageData>(
        '${ApiConst.episods}${params.path}',
        fromJson: EpisodePageData.fromJson,
      );
    } else {
      return Future.value((null, ConnectionException()));
    }
  }
}
