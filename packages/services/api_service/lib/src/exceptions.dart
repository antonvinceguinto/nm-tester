class UnauthorizedException implements Exception {
  UnauthorizedException(this.message);

  final String message;

  @override
  String toString() => 'Unauthorized: $message';
}

class BadRequestException implements Exception {
  BadRequestException(this.message);

  final String message;

  @override
  String toString() => 'Invalid request: $message';
}
