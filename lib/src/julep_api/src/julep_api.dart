class JulepApi {
  static const _baseUrl = 'julep-api-hazltuqnpq-ew.a.run.app';

  Uri cocktails({
    required String unit,
  }) =>
      _buildUri(
        endpoint: '/cocktails',
        queryParameters: {
          'unit': unit,
        },
      );

  Uri cocktail({
    required int id,
    required String unit,
  }) =>
      _buildUri(
        endpoint: '/cocktail/$id',
        queryParameters: {
          'unit': unit,
        },
      );

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
