import 'package:cocktailr/src/exceptions/exceptions.dart';
import 'package:cocktailr/src/julep_api/julep_api.dart';
import 'package:cocktailr/src/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:talker_http_logger/talker_http_logger.dart';

import '../domain/models/cocktail.dart';
import '../domain/models/unit.dart';

class CocktailRepository {
  static const _tag = 'CocktailRepository';

  CocktailRepository(
    this._api,
    this._client,
    this._apiHelper,
    this._logger,
  );

  final JulepApi _api;
  final http.Client _client;
  final ApiHelper _apiHelper;
  final Logger _logger;

  Future<List<Cocktail>> getCocktails() async {
    _logger.info(_tag, 'getCocktails()');

    return _apiHelper.getData(
      client: _client,
      uri: _api.cocktails(unit: Unit.ml.name),
      builder: (cocktailsJson) {
        if (cocktailsJson is! List) {
          throw InvalidJsonException();
        }

        return cocktailsJson.map((cocktail) => Cocktail.fromJson(cocktail)).toList();
      },
    );
  }

  Future<Cocktail> getCocktail(int id) async {
    _logger.info(_tag, 'getCocktail(id: $id)');

    return _apiHelper.getData(
      client: _client,
      uri: _api.cocktail(
        id: id,
        unit: Unit.ml.name,
      ),
      builder: (cocktailJson) {
        if (cocktailJson is! Map<String, dynamic>) {
          throw InvalidJsonException();
        }

        return Cocktail.fromJson(cocktailJson);
      },
    );
  }
}

final cocktailRepositoryProvider = Provider<CocktailRepository>((ref) {
  return CocktailRepository(
    ref.watch(julepApiProvider),
    ref.watch(_httpClientProvider),
    ref.watch(apiHelperProvider),
    ref.watch(loggerProvider),
  );
});

final _httpClientProvider = Provider<http.Client>((ref) {
  return InterceptedClient.build(interceptors: [
    TalkerHttpLogger(
      talker: talkerInstance,
    ),
  ]);
});
