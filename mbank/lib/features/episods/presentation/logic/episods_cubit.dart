import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'episods_state.dart';

class EpisodsCubit extends Cubit<EpisodsState> {
  EpisodsCubit() : super(EpisodsInitial());
}
