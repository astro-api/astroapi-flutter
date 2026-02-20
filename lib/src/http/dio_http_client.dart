import 'package:dio/dio.dart' hide RequestOptions;

import '../config/astrology_client_config.dart';
import '../errors/astrology_exception.dart';
import 'http_helper.dart';

class DioHttpClient implements HttpHelper {
  late final Dio _dio;
  final AstrologyClientConfig _config;

  DioHttpClient(this._config) {
    final baseUrl = _config.resolvedBaseUrl;
    final apiKey = _config.resolvedApiKey;

    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(milliseconds: _config.timeout),
      receiveTimeout: Duration(milliseconds: _config.timeout),
      sendTimeout: Duration(milliseconds: _config.timeout),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        if (_config.requestOptions?.headers != null)
          ..._config.requestOptions!.headers!,
      },
    ));

    if (apiKey != null && apiKey.isNotEmpty) {
      _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer $apiKey';
          if (_config.debug) {
            _log('Request: ${options.method} ${options.path}', options.data);
          }
          handler.next(options);
        },
        onResponse: (response, handler) {
          if (_config.debug) {
            _log(
                'Response: ${response.statusCode} ${response.requestOptions.path}');
          }
          handler.next(response);
        },
        onError: (error, handler) {
          if (_config.debug) {
            _log('Error: ${error.type} ${error.message}');
          }
          handler.next(error);
        },
      ));
    }
  }

  void _log(String message, [dynamic details]) {
    final logger = _config.logger;
    if (logger != null) {
      logger(message, details);
    } else {
      // ignore: avoid_print
      print('[AstroAPI] $message${details != null ? ': $details' : ''}');
    }
  }

  T _normalizePayload<T>(dynamic data) {
    if (data is Map<String, dynamic>) {
      if (data.containsKey('data')) return data['data'] as T;
      if (data.containsKey('result')) return data['result'] as T;
    }
    return data as T;
  }

  Options _buildDioOptions(RequestOptions? options) {
    return Options(
      headers: options?.headers,
      sendTimeout: options?.timeout != null
          ? Duration(milliseconds: options!.timeout!)
          : null,
      receiveTimeout: options?.timeout != null
          ? Duration(milliseconds: options!.timeout!)
          : null,
    );
  }

  bool _canRetry(DioException e, int retryCount) {
    final retryConfig = _config.retry;
    if (retryConfig == null || retryConfig.attempts <= 0) return false;
    if (retryCount >= retryConfig.attempts) return false;

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.connectionError) {
      return true;
    }

    final statusCode = e.response?.statusCode;
    if (statusCode != null) {
      return retryConfig.retryStatusCodes.contains(statusCode);
    }

    return false;
  }

  Future<T> _withRetry<T>(Future<T> Function() action) async {
    final delayMs = _config.retry?.delayMs ?? 250;
    int retryCount = 0;

    while (true) {
      try {
        return await action();
      } on DioException catch (e) {
        if (_canRetry(e, retryCount)) {
          retryCount++;
          await Future.delayed(Duration(milliseconds: delayMs));
          continue;
        }
        throw AstrologyException.fromDioError(e);
      } catch (e) {
        throw AstrologyException.normalize(e);
      }
    }
  }

  @override
  Future<T> get<T>(String path, {RequestOptions? options}) {
    return _withRetry(() async {
      final response = await _dio.get<dynamic>(
        path,
        queryParameters: options?.params,
        options: _buildDioOptions(options),
        cancelToken: options?.cancelToken,
      );
      return _normalizePayload<T>(response.data);
    });
  }

  @override
  Future<T> post<T>(String path, Map<String, dynamic> body,
      {RequestOptions? options}) {
    return _withRetry(() async {
      final response = await _dio.post<dynamic>(
        path,
        data: body,
        queryParameters: options?.params,
        options: _buildDioOptions(options),
        cancelToken: options?.cancelToken,
      );
      return _normalizePayload<T>(response.data);
    });
  }

  @override
  Future<T> put<T>(String path, Map<String, dynamic> body,
      {RequestOptions? options}) {
    return _withRetry(() async {
      final response = await _dio.put<dynamic>(
        path,
        data: body,
        queryParameters: options?.params,
        options: _buildDioOptions(options),
        cancelToken: options?.cancelToken,
      );
      return _normalizePayload<T>(response.data);
    });
  }

  @override
  Future<T> delete<T>(String path, {RequestOptions? options}) {
    return _withRetry(() async {
      final response = await _dio.delete<dynamic>(
        path,
        queryParameters: options?.params,
        options: _buildDioOptions(options),
        cancelToken: options?.cancelToken,
      );
      return _normalizePayload<T>(response.data);
    });
  }
}
