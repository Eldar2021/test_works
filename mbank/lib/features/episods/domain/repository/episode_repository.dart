import 'package:mbank/core/core.dart';
import 'package:mbank/features/features.dart';

abstract class EpisodeRepo {
  Future<(EpisodePageData?, MbankException?)> getEpisods(EpisodParams params);
}
