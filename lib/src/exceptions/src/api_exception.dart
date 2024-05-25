sealed class ApiException {
  ApiException(this.message);

  final String message;
}

class InvalidJsonException extends ApiException {
  InvalidJsonException() : super('Invalid JSON');
}

class NoInternetConnectionException extends ApiException {
  NoInternetConnectionException() : super('No internet connection');
}

class UnknownApiException extends ApiException {
  UnknownApiException() : super('An unknown error occurred');
}
