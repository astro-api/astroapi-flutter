import '../http/http_helper.dart';

abstract class BaseCategoryClient {
  final HttpHelper http;
  final String _prefix;

  BaseCategoryClient(this.http, this._prefix);

  String buildUrl(List<String> segments) {
    final parts = [_prefix, ...segments.where((s) => s.isNotEmpty)];
    return parts.join('/').replaceAll(RegExp(r'/{2,}'), '/');
  }

  String buildCustomUrl(String prefix, List<String> segments) {
    final parts = [prefix, ...segments.where((s) => s.isNotEmpty)];
    return parts.join('/').replaceAll(RegExp(r'/{2,}'), '/');
  }
}
