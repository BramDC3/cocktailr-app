import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:talker_http_logger/talker_http_logger.dart';

import 'logger.dart';

final httpClientProvider = Provider<http.Client>((ref) {
  return InterceptedClient.build(interceptors: [
    TalkerHttpLogger(
      talker: talkerInstance,
    ),
  ]);
});
