

class ServerException implements Exception {
  final String message;

  ServerException({required this.message}){
    print('ServerException: $message');
  }
}

class CacheException implements Exception {}