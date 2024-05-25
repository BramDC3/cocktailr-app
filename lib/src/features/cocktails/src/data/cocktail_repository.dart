import 'package:cocktailr/src/exceptions/exceptions.dart';
import 'package:cocktailr/src/julep_api/julep_api.dart';
import 'package:cocktailr/src/utils/utils.dart';
import 'package:http/http.dart' as http;

import '../domain/models/cocktail.dart';

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
      uri: _api.cocktails(),
      builder: (cocktailsJson) {
        if (cocktailsJson is! List<Map<String, dynamic>>) {
          throw InvalidJsonException();
        }

        return cocktailsJson.map((cocktail) => Cocktail.fromJson(cocktail)).toList();
      },
    );
  }
}
