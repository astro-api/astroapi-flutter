import '../config/astrology_client_config.dart';
import '../http/http_helper.dart';
import '../models/requests/requests.dart';
import '../models/responses/responses.dart';
import 'base_category_client.dart';

class AnalysisClient extends BaseCategoryClient {
  static const String _apiPrefix = '/api/v3/analysis';

  AnalysisClient(HttpHelper http) : super(http, _apiPrefix);

  Future<AnalysisResponse> getNatalReport(
    NatalReportRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['natal-report']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AnalysisResponse> getSynastryReport(
    SynastryReportRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['synastry-report']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AnalysisResponse> getCompositeReport(
    CompositeReportRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['composite-report']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AnalysisResponse> getCompatibility(
    CompatibilityRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['compatibility']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<CompatibilityScoreResponse> getCompatibilityScore(
    CompatibilityRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['compatibility-score']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AnalysisResponse> getRelationship(
    RelationshipAnalysisRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['relationship']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<RelationshipScoreResponse> getRelationshipScore(
    CompatibilityRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['relationship-score']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AnalysisResponse> getTransitReport(
    NatalTransitRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['transit-report']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AnalysisResponse> getNatalTransitReport(
    NatalTransitRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['natal-transit-report']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AnalysisResponse> getProgressionReport(
    ProgressionReportRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['progression-report']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AnalysisResponse> getDirectionReport(
    DirectionReportRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['direction-report']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AnalysisResponse> getSolarReturnReport(
    SolarReturnReportRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['solar-return-report']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AnalysisResponse> getSolarReturnTransitReport(
    SolarReturnTransitRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['solar-return-transit-report']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AnalysisResponse> getLunarReturnReport(
    LunarReturnReportRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['lunar-return-report']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AnalysisResponse> getLunarReturnTransitReport(
    LunarReturnTransitRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['lunar-return-transit-report']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AnalysisResponse> getVenusReturnReport(
    VenusReturnRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['venus-return-report']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AnalysisResponse> getVenusReturnTransitReport(
    VenusReturnRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['venus-return-transit-report']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AnalysisResponse> getLunarAnalysis(
    LunarAnalysisRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['lunar-analysis']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AnalysisResponse> getPsychological(
    NatalChartRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['psychological']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AnalysisResponse> getKarmic(
    NatalChartRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['karmic']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AnalysisResponse> getSpiritual(
    NatalChartRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['spiritual']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AnalysisResponse> getCareer(
    NatalChartRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['career']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AnalysisResponse> getVocational(
    NatalChartRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['vocational']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AnalysisResponse> getHealth(
    NatalChartRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['health']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AnalysisResponse> getPredictive(
    NatalTransitRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['predictive']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<AnalysisResponse> getRelocation(
    RelocationChartRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['relocation']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }
}
