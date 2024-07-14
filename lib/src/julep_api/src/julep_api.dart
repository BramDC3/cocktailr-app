import 'package:cocktailr/src/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JulepApi {
  static const _tag = 'JulepApi';
  static const _baseUrl = 'julep-api-hazltuqnpq-ew.a.run.app';

  JulepApi(
    this._logger,
  );

  final Logger _logger;

  Uri cocktails({
    required String unit,
  }) {
    _logger.info(_tag, 'cocktails()');

    return _buildUri(
      endpoint: '/cocktails',
      queryParameters: {
        'unit': unit,
      },
    );
  }

  Uri cocktail({
    required int id,
    required String unit,
  }) {
    _logger.info(_tag, 'cocktail(id: $id)');

    return _buildUri(
      endpoint: '/cocktail/$id',
      queryParameters: {
        'unit': unit,
      },
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

final julepApiProvider = Provider<JulepApi>((ref) {
  return JulepApi(
    ref.watch(loggerProvider),
  );
});
