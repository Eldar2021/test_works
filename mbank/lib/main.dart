import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import 'package:mbank/app/app.dart';
import 'package:mbank/core/client/network_client.dart';
import 'package:mbank/core/client/remote_client.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => RemoteClient(Client()),
        ),
        RepositoryProvider(
          create: (context) => NetworkClient(Connectivity()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

// flutter pub run build_runner build --delete-conflicting-outputs
// https://rickandmortyapi.com/documentation/#graphql
