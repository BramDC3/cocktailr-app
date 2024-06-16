import 'package:cocktailr/src/exceptions/exceptions.dart';
import 'package:cocktailr/src/julep_api/julep_api.dart';
import 'package:cocktailr/src/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../domain/models/cocktail.dart';
import '../domain/models/unit.dart';

class CocktailRepository {
  CocktailRepository(
    this._api,
    this._client,
    this._apiHelper,
  );

  final JulepApi _api;
  final http.Client _client;
  final ApiHelper _apiHelper;

  Future<List<Cocktail>> getCocktails() async {
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
    JulepApi(),
    http.Client(),
    ref.watch(apiHelperProvider),
  );
});
