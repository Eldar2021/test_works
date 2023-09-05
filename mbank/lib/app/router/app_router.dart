import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbank/features/features.dart';

class AppRouter {
  const AppRouter();

  static const String main = '/';
  static const String characters = '/characters';
  static const String episods = '/episods';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      main => CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => MainCubit(),
            child: const MainView(),
          ),
        ),
      characters => CupertinoPageRoute(builder: (_) => const CharactersView()),
      episods => CupertinoPageRoute(builder: (_) => const EpisodsPage()),
      _ => throw Exception('no builder specified for route named: [${settings.name}]'),
    };
  }
}
