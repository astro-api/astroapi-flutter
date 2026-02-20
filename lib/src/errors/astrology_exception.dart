import 'package:dio/dio.dart' show DioException, DioExceptionType;

class AstrologyException implements Exception {
  final String message;
  final int? statusCode;
  final String? code;
  final dynamic details;
  final Object? cause;

  const AstrologyException(
    this.message, {
    this.statusCode,
    this.code,
    this.details,
    this.cause,
  });

  factory AstrologyException.fromDioError(DioException e) {
    final statusCode = e.response?.statusCode;
    dynamic details;
    String? code;

    if (e.response?.data is Map<String, dynamic>) {
      final data = e.response!.data as Map<String, dynamic>;
      details = data['detail'] ?? data['message'] ?? data;
      code = data['code']?.toString();
    } else {
      details = e.response?.data;
    }

    final message = _buildMessage(e, statusCode, details);

    return AstrologyException(
      message,
      statusCode: statusCode,
      code: code ?? e.type.name,
      details: details,
      cause: e,
    );
  }

  factory AstrologyException.normalize(Object e) {
    if (e is AstrologyException) return e;
    if (e is DioException) return AstrologyException.fromDioError(e);
    return AstrologyException(e.toString(), cause: e);
  }

  static String _buildMessage(
      DioException e, int? statusCode, dynamic details) {
    if (statusCode != null) {
      final detailStr = details?.toString() ?? '';
      return 'HTTP $statusCode${detailStr.isNotEmpty ? ': $detailStr' : ''}';
    }
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timed out';
      case DioExceptionType.sendTimeout:
        return 'Send timed out';
      case DioExceptionType.receiveTimeout:
        return 'Receive timed out';
      case DioExceptionType.cancel:
        return 'Request cancelled';
      case DioExceptionType.connectionError:
        return 'Network connection error';
      default:
        return e.message ?? 'Unknown error';
    }
  }

  bool isClientError() =>
      statusCode != null && statusCode! >= 400 && statusCode! < 500;
  bool isServerError() => statusCode != null && statusCode! >= 500;

  @override
  String toString() =>
      'AstrologyException($message, statusCode: $statusCode, code: $code)';
}
