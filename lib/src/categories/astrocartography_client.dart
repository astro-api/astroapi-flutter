import '../config/astrology_client_config.dart';
import '../http/http_helper.dart';
import '../models/requests/requests.dart';
import '../models/responses/responses.dart';
import 'base_category_client.dart';

class AstrocartographyClient extends BaseCategoryClient {
  static const String _apiPrefix = '/api/v3/astrocartography';

  AstrocartographyClient(HttpHelper http) : super(http, _apiPrefix);

  Future<AstrocartographyResponse> getLines(
    AstrocartographyLinesRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['lines']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AstrocartographyResponse> getMap(
    AstrocartographyMapRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['map']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AstrocartographyResponse> getParanMap(
    ParanMapRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['paran-map']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AstrocartographyResponse> getLocationAnalysis(
    LocationAnalysisRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['location-analysis']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AstrocartographyResponse> compareLocations(
    CompareLocationsRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['compare-locations']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AstrocartographyResponse> getPowerZones(
    PowerZonesRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['power-zones']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AstrocartographyResponse> searchLocations(
    SearchLocationsRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['search-locations']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AstrocartographyResponse> getRelocationChart(
    RelocationChartRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['relocation-chart']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AstrodynamesResponse> getAstrodynes(
    AstrodynamesRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['astrodynes']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AstrodynamesResponse> compareAstrodynes(
    AstrodynamesCompareRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['astrodynes', 'compare']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AstrocartographyResponse> render(
    AstrocartographyMapRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['render']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AstrocartographyResponse> getLineMeanings({
    RequestOptions? options,
  }) async {
    final data = await http.get<Map<String, dynamic>>(
      buildUrl(['line-meanings']),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AstrocartographyResponse> getSupportedFeatures({
    RequestOptions? options,
  }) async {
    final data = await http.get<Map<String, dynamic>>(
      buildUrl(['supported-features']),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }
}
