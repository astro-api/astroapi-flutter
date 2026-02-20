import '../config/astrology_client_config.dart';
import '../http/http_helper.dart';
import '../models/requests/requests.dart';
import '../models/responses/responses.dart';
import 'base_category_client.dart';

class DataClient extends BaseCategoryClient {
  static const String _apiPrefix = '/api/v3/data';

  DataClient(HttpHelper http) : super(http, _apiPrefix);

  Future<PlanetaryPositionsResponse> getPositions(
    PlanetaryPositionsRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['positions']),
      request.toJson(),
      options: options,
    );
    return PlanetaryPositionsResponse.fromJson(data);
  }

  Future<EnhancedPositionsResponse> getEnhancedPositions(
    PlanetaryPositionsRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['positions', 'enhanced']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<GlobalPositionsResponse> getGlobalPositions(
    GlobalDataRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['global-positions']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AspectsResponse> getAspects(
    PlanetaryPositionsRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['aspects']),
      request.toJson(),
      options: options,
    );
    return AspectsResponse.fromJson(data);
  }

  Future<EnhancedAspectsResponse> getEnhancedAspects(
    PlanetaryPositionsRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['aspects', 'enhanced']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<HouseCuspsResponse> getHouseCusps(
    PlanetaryPositionsRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['house-cusps']),
      request.toJson(),
      options: options,
    );
    return HouseCuspsResponse.fromJson(data);
  }

  Future<LunarMetricsResponse> getLunarMetrics(
    LunarMetricsRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['lunar-metrics']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<EnhancedLunarMetricsResponse> getEnhancedLunarMetrics(
    LunarMetricsRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['lunar-metrics', 'enhanced']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<CurrentMomentResponse> getCurrentMoment(
      {RequestOptions? options}) async {
    final data = await http.get<Map<String, dynamic>>(
      buildUrl(['now']),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }
}
