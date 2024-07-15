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

class BadRequestException extends ApiException {
  BadRequestException() : super('Bad request');
}

class UnauthorizedException extends ApiException {
  UnauthorizedException() : super('Unauthorized');
}

class NotFoundException extends ApiException {
  NotFoundException() : super('Not found');
}

class InternalServerErrorException extends ApiException {
  InternalServerErrorException() : super('Internal server error');
}

class BadGatewayException extends ApiException {
  BadGatewayException() : super('Bad gateway');
}

class UnknownApiException extends ApiException {
  UnknownApiException() : super('An unknown error occurred');
}
