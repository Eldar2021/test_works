import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mbank/app/app.dart';
import 'package:mbank/core/core.dart';
import 'package:mbank/features/features.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CharacterCubit(
            GetCharactersUsecase(
              CharacterRepoImpl(
                remoteClient: context.read<RemoteClient>(),
                networkClient: context.read<NetworkClient>(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => EpisodeCubit(
            GetEpisodsUsecase(
              EpisodeRepoImpl(
                remoteClient: context.read<RemoteClient>(),
                networkClient: context.read<NetworkClient>(),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
