import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbank/features/features.dart';

class AppRouter {
  const AppRouter();

  static const String main = '/';
  static const String characters = '/characters';
  static const String episods = '/episods';
  static const String characterDetail = '/character-detail';
  static const String episodDetail = '/episod-detail';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      main => CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => MainCubit(),
            child: const MainView(),
          ),
        ),
      characters => CupertinoPageRoute(
          builder: (_) => const CharactersView(),
        ),
      episods => CupertinoPageRoute(
          builder: (_) => const EpisodsView(),
        ),
      characterDetail => CupertinoPageRoute(
          builder: (_) => CharacterDetailView(settings.arguments as Character),
        ),
      episodDetail => CupertinoPageRoute(
          builder: (_) => EpisodeDetailView(settings.arguments as Episode),
        ),
      _ => throw Exception('no builder specified for route named: [${settings.name}]'),
    };
  }
}
