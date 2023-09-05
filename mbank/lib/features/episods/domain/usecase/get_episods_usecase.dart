import 'package:mbank/core/core.dart';
import 'package:mbank/features/features.dart';

class GetEpisodsUsecase extends UseCase<EpisodePageData, EpisodParams> {
  const GetEpisodsUsecase(this.reposiory);

  final EpisodeRepo reposiory;

  @override
  Future<(EpisodePageData?, MbankException?)> call(EpisodParams params) {
    return reposiory.getEpisods(params);
  }
}

class EpisodParams {
  const EpisodParams(this.pageIndex, {this.searchName});

  final int pageIndex;
  final String? searchName;

  String get path {
    if (searchName != null) return 'page=$pageIndex&name=${searchName!.toLowerCase()}';
    return 'page=$pageIndex';
  }

  EpisodParams copyWith({int? pageIndex, String? searchName}) {
    return EpisodParams(
      pageIndex ?? this.pageIndex,
      searchName: searchName ?? this.searchName,
    );
  }
}
