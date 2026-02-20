import 'package:dio/dio.dart' show CancelToken;

const String defaultBaseUrl = 'https://api.astrology-api.io';
const int defaultTimeoutMs = 10000;
const List<int> defaultRetryStatusCodes = [408, 425, 429, 500, 502, 503, 504];

class RetryConfig {
  final int attempts;
  final int delayMs;
  final List<int> retryStatusCodes;

  const RetryConfig({
    this.attempts = 0,
    this.delayMs = 250,
    this.retryStatusCodes = defaultRetryStatusCodes,
  });
}

class RequestOptions {
  final Map<String, String>? headers;
  final Map<String, dynamic>? params;
  final int? timeout;
  final CancelToken? cancelToken;

  const RequestOptions({
    this.headers,
    this.params,
    this.timeout,
    this.cancelToken,
  });
}

class AstrologyClientConfig {
  final String? apiKey;
  final String? baseUrl;
  final int timeout;
  final RetryConfig? retry;
  final RequestOptions? requestOptions;
  final bool debug;
  final void Function(String, [dynamic])? logger;

  const AstrologyClientConfig({
    this.apiKey,
    this.baseUrl,
    this.timeout = defaultTimeoutMs,
    this.retry,
    this.requestOptions,
    this.debug = false,
    this.logger,
  });

  String get resolvedBaseUrl =>
      baseUrl ??
      const String.fromEnvironment('ASTROLOGY_API_BASE_URL',
          defaultValue: defaultBaseUrl);

  String? get resolvedApiKey =>
      apiKey ?? const String.fromEnvironment('ASTROLOGY_API_KEY');
}
