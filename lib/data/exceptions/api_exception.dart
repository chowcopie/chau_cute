class ApiException implements Exception {
  const ApiException({
    this.httpCode = -1,
    this.errorCode = -1,
    required this.message,
    required this.messageEn,
  });

  /// Http status code
  final int httpCode;

  /// Error code
  final int errorCode;

  /// Error message
  final String message;

  /// Error message in English
  final String messageEn;

  @override
  String toString() {
    return 'ServerException(httpCode: $httpCode, errorCode: $errorCode, message: $message, messageEn: $messageEn)';
  }
}
