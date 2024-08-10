import 'package:cocktailr/src/cocktailr_api/cocktailr_api.dart';
import 'package:cocktailr/src/exceptions/exceptions.dart';
import 'package:cocktailr/src/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../domain/assistant_message.dart';
import 'models/send_message_response.dart';

class AssistantRepository {
  static const _tag = 'AssistantRepository';

  AssistantRepository(
    this._api,
    this._client,
    this._apiHelper,
    this._logger,
  );

  final CocktailrApi _api;
  final http.Client _client;
  final ApiHelper _apiHelper;
  final Logger _logger;

  Future<(String, List<String>)> sendMessage(String message, List<AssistantMessage> history) async {
    _logger.info(_tag, 'sendMessage()');

    final reply = await _apiHelper.post(
      client: _client,
      uri: _api.sendMessage(),
      builder: (messageJson) {
        if (messageJson is! Map<String, dynamic>) {
          throw InvalidJsonException();
        }

        return SendMessageResponse.fromJson(messageJson);
      },
    );

    return (reply.message, reply.resources);
  }
}

final assistantRepositoryProvider = Provider<AssistantRepository>((ref) {
  return AssistantRepository(
    ref.watch(cocktailrApiProvider),
    ref.watch(httpClientProvider),
    ref.watch(apiHelperProvider),
    ref.watch(loggerProvider),
  );
});
