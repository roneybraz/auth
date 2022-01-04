class ServerException implements Exception {}

class ServerExceptionTeste implements Exception {
  final String message;

  ServerExceptionTeste(this.message);
}

class DeviceException implements Exception {}

class CacheException implements Exception {}
