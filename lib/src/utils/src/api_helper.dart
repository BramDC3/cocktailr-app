import 'dart:convert';
import 'dart:io';

import 'package:cocktailr/src/exceptions/exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<T> getData<T>({
    required http.Client client,
    required Uri uri,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final response = await client.get(uri);
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return builder(data);
        default:
          throw UnknownApiException();
      }
    } on SocketException catch (_) {
      throw NoInternetConnectionException();
    }
  }
}

final apiHelperProvider = Provider<ApiHelper>((ref) {
  return ApiHelper();
});
