import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

@immutable
final class RemoteClient {
  const RemoteClient(Client client) : _client = client;

  final Client _client;

  static const header = <String, String>{
    'Content-Type': 'application/json; charset=utf-8',
    'Accept': 'application/json',
  };

  Future<(T?, Exception?)> responseType<T>(Response response, T Function(Map<String, dynamic>) fromJson) async {
    if (response.statusCode == 200) {
      try {
        final model = fromJson(jsonDecode(response.body) as Map<String, dynamic>);
        return (model, null);
      } catch (e, s) {
        return (null, Exception('Convert error: $e, $s'));
      }
    } else if (response.statusCode == 401) {
      return (null, Exception("Authentication error: ${response.statusCode}"));
    } else {
      return (null, Exception("Unknown error: ${response.statusCode}"));
    }
  }

  /// Get Json data
  Future<(T?, Exception?)> get<T>(String path, {required T Function(Map<String, dynamic>) fromJson}) async {
    try {
      final response = await _client.get(Uri.parse(path), headers: header);
      return responseType<T>(response, fromJson);
    } catch (e) {
      throw Exception(e);
      // return Future.value((null, e));
    }
  }
}
