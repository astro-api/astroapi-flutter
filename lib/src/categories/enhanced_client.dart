import '../config/astrology_client_config.dart';
import '../http/http_helper.dart';
import '../models/requests/requests.dart';
import '../models/responses/responses.dart';
import 'base_category_client.dart';

class EnhancedClient extends BaseCategoryClient {
  static const String _apiPrefix = '/api/v3/enhanced';
  static const String _chartsPrefix = '/api/v3/enhanced_charts';

  EnhancedClient(HttpHelper http) : super(http, _apiPrefix);

  Future<EnhancedAnalysisResponse> getPersonalAnalysis(
    PersonalAnalysisRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['personal-analysis']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<EnhancedAnalysisResponse> getGlobalAnalysis(
    GlobalAnalysisRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['global-analysis']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<EnhancedChartAnalysisResponse> getPersonalChartAnalysis(
    PersonalAnalysisRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildCustomUrl(_chartsPrefix, ['personal-analysis']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<EnhancedChartAnalysisResponse> getGlobalChartAnalysis(
    GlobalAnalysisRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildCustomUrl(_chartsPrefix, ['global-analysis']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }
}
