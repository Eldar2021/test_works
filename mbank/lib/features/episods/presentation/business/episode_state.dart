part of 'episode_cubit.dart';

class EpisodeState extends Equatable {
  const EpisodeState({
    this.status = FetchStatus.loading,
    this.searchName,
    this.episods,
    this.exception,
  });

  final FetchStatus status;
  final String? searchName;
  final List<Episode>? episods;
  final MbankException? exception;

  @override
  List<Object?> get props => [status, episods, exception, searchName];

  EpisodeState copyWith({
    FetchStatus? status,
    String? searchName,
    List<Episode>? episods,
    MbankException? exception,
  }) {
    return EpisodeState(
      status: status ?? this.status,
      searchName: searchName ?? this.searchName,
      episods: episods ?? this.episods,
      exception: exception ?? this.exception,
    );
  }
}
