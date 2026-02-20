import '../config/astrology_client_config.dart';
import '../http/http_helper.dart';
import '../models/requests/requests.dart';
import '../models/responses/responses.dart';
import 'base_category_client.dart';

class TraditionalClient extends BaseCategoryClient {
  static const String _apiPrefix = '/api/v3/traditional';

  TraditionalClient(HttpHelper http) : super(http, _apiPrefix);

  Future<TraditionalResponse> getAnalysis(
    TraditionalAnalysisRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['analysis']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<TraditionalResponse> getDignities(
    TraditionalAnalysisRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['dignities']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<TraditionalResponse> getReceptions(
    TraditionalAnalysisRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['receptions']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<TraditionalResponse> getAlmutens(
    TraditionalAnalysisRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['almutens']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<TraditionalResponse> getLots(
    TraditionalAnalysisRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['lots']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<TraditionalResponse> getAnnualProfection(
    AnnualProfectionRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['annual-profection']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<TraditionalResponse> getProfectionTimeline(
    ProfectionTimelineRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['profection-timeline']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<TraditionalResponse> getFirdariaTimeline(
    TraditionalAnalysisRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['firdaria-timeline']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<TraditionalResponse> getBoundsAnalysis(
    TraditionalAnalysisRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['bounds']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<TraditionalResponse> getDecanates(
    TraditionalAnalysisRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['decanates']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }
}
