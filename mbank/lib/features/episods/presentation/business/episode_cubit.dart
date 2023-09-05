import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mbank/core/core.dart';
import 'package:mbank/features/features.dart';

part 'episode_state.dart';

class EpisodeCubit extends Cubit<EpisodeState> {
  EpisodeCubit(this.getEpisodsUsecase) : super(const EpisodeState(status: FetchStatus.success));

  final GetEpisodsUsecase getEpisodsUsecase;

  final List<Episode> episods = [];

  Future<(List<Episode>?, int?, MbankException?)> getEpisods([int page = 1]) async {
    final params = EpisodParams(page, searchName: state.searchName);

    final (data, exception) = await getEpisodsUsecase(params);
    if (data != null) {
      episods.addAll(data.results);
      emit(state.copyWith(status: FetchStatus.success, episods: episods));
    } else {
      emit(state.copyWith(status: FetchStatus.failure, exception: exception));
    }
    return (data?.results, data?.info.pages, exception);
  }

  void changeSeractName(String? searchName) {
    emit(state.copyWith(searchName: searchName));
  }
}
