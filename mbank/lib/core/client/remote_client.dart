import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:mbank/core/core.dart';

@immutable
final class RemoteClient {
  const RemoteClient(Client client) : _client = client;

  final Client _client;

  static const header = <String, String>{
    'Content-Type': 'application/json; charset=utf-8',
    'Accept': 'application/json',
  };

  Future<(T?, MbankException?)> responseType<T>(Response response, T Function(Map<String, dynamic>) fromJson) async {
    if (response.statusCode == 200) {
      try {
        final model = fromJson(jsonDecode(response.body) as Map<String, dynamic>);
        return (model, null);
      } catch (e, s) {
        log('$e, $s');
        return (null, ConvertException());
      }
    } else if (response.statusCode == 401) {
      return (null, AuthenticationException());
    } else if (response.statusCode == 404) {
      return (null, NotFoundException());
    } else {
      return (null, UnknownException());
    }
  }

  /// Get Json data
  Future<(T?, MbankException?)> get<T>(String path, {required T Function(Map<String, dynamic>) fromJson}) async {
    try {
      final response = await _client.get(Uri.parse(path), headers: header);
      return responseType<T>(response, fromJson);
    } catch (e, s) {
      log('$e, $s');
      return Future.value((null, UnknownException()));
    }
  }
}
