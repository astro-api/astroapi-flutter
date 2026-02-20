import '../config/astrology_client_config.dart';
import '../http/http_helper.dart';
import '../models/requests/requests.dart';
import 'base_category_client.dart';

/// Client for SVG chart rendering. All methods return raw SVG strings.
class SvgClient extends BaseCategoryClient {
  static const String _apiPrefix = '/api/v3/svg';

  SvgClient(HttpHelper http) : super(http, _apiPrefix);

  RequestOptions _svgOptions(RequestOptions? options) {
    return RequestOptions(
      headers: {
        'Accept': 'image/svg+xml',
        ...?options?.headers,
      },
      params: options?.params,
      timeout: options?.timeout,
      cancelToken: options?.cancelToken,
    );
  }

  Future<String> getNatalChartSvg(
    NatalChartSvgRequest request, {
    RequestOptions? options,
  }) async {
    return http.post<String>(
      buildUrl(['natal']),
      request.toJson(),
      options: _svgOptions(options),
    );
  }

  Future<String> getSynastryChartSvg(
    SynastryChartSvgRequest request, {
    RequestOptions? options,
  }) async {
    return http.post<String>(
      buildUrl(['synastry']),
      request.toJson(),
      options: _svgOptions(options),
    );
  }

  Future<String> getCompositeChartSvg(
    CompositeChartSvgRequest request, {
    RequestOptions? options,
  }) async {
    return http.post<String>(
      buildUrl(['composite']),
      request.toJson(),
      options: _svgOptions(options),
    );
  }

  Future<String> getTransitChartSvg(
    TransitChartSvgRequest request, {
    RequestOptions? options,
  }) async {
    return http.post<String>(
      buildUrl(['transit']),
      request.toJson(),
      options: _svgOptions(options),
    );
  }
}
