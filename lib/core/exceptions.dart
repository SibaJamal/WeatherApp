import 'dart:io';

class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}


class ConnectionException implements Exception {
  final String message;

  const ConnectionException(this.message);
}