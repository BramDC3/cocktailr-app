class JulepApi {
  static const _baseUrl = 'https://julep-api-hazltuqnpq-ew.a.run.app';

  Uri cocktails() => _buildUri(endpoint: '/cocktails');

  Uri _buildUri({
    required String endpoint,
  }) {
    return Uri.https(_baseUrl, endpoint);
  }
}
