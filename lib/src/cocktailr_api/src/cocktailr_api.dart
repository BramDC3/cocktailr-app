import 'package:cocktailr/src/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CocktailrApi {
  static const _tag = 'CocktailrApi';
  static const _baseUrl = 'cocktailr-backend-ze4ei6k6ba-wl.a.run.app';

  CocktailrApi(
    this._logger,
  );

  final Logger _logger;

  Uri sendMessage() {
    _logger.info(_tag, 'sendMessage()');

    return _buildUri(
      endpoint: '/send-message',
    );
  }

  Uri _buildUri({
    required String endpoint,
    Map<String, String> queryParameters = const {},
  }) {
    return Uri.https(
      _baseUrl,
      endpoint,
      queryParameters,
    );
  }
}

final cocktailrApiProvider = Provider<CocktailrApi>((ref) {
  return CocktailrApi(
    ref.watch(loggerProvider),
  );
});
