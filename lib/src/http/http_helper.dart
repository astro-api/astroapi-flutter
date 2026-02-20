import '../config/astrology_client_config.dart';

abstract class HttpHelper {
  Future<T> get<T>(String path, {RequestOptions? options});
  Future<T> post<T>(String path, Map<String, dynamic> body,
      {RequestOptions? options});
  Future<T> put<T>(String path, Map<String, dynamic> body,
      {RequestOptions? options});
  Future<T> delete<T>(String path, {RequestOptions? options});
}
