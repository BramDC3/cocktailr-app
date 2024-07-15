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
    } on SocketException catch (_) {
      throw NoInternetConnectionException();
    }
  }
}

final apiHelperProvider = Provider<ApiHelper>((ref) {
  return ApiHelper();
});
