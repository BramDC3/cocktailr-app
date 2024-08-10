import 'dart:convert';
import 'dart:io';

import 'package:cocktailr/src/exceptions/exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<T> get<T>({
    required http.Client client,
    required Uri uri,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final response = await client.get(uri);
      return _handleResponse(response, builder);
    } on SocketException catch (_) {
      throw NoInternetConnectionException();
    }
  }

  Future<T> post<T>({
    required http.Client client,
    required Uri uri,
    Object? body,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final response = await client.post(
        uri,
        body: body,
      );

      return _handleResponse(response, builder);
    } on SocketException catch (_) {
      throw NoInternetConnectionException();
    }
  }

  T _handleResponse<T>(http.Response response, T Function(dynamic data) builder) {
    final statusCode = response.statusCode;
    final statusCodeString = statusCode.toString();

    if (statusCodeString.startsWith('2')) {
      final data = json.decode(response.body);
      return builder(data);
    }

    throw switch (response.statusCode) {
      400 => BadRequestException(),
      401 || 403 => UnauthorizedException(),
      404 => NotFoundException(),
      500 => InternalServerErrorException(),
      502 => BadGatewayException(),
      _ => UnknownApiException(),
    };
  }
}

final apiHelperProvider = Provider<ApiHelper>((ref) {
  return ApiHelper();
});
