class ServerException implements Exception {
  String? message;
  int? code;

  ServerException({this.message, this.code});
}
class CacheException implements Exception {
}
