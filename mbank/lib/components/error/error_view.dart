import 'package:flutter/material.dart';
import 'package:mbank/core/core.dart';

class ErrorView extends StatelessWidget {
  const ErrorView(this.exception, {super.key});

  final MbankException exception;

  @override
  Widget build(BuildContext context) {
    final message = switch (exception) {
      ConnectionException() => 'Connection is not established',
      AuthenticationException() => 'Authentication is not valid',
      ConvertException() => 'Convert erro from invalid data to',
      NotFoundException() => 'Not found 404',
      ServerException() => 'Server is not stable',
      UnknownException() => 'Unknown exception',
    };
    return Center(child: Text(message));
  }
}
