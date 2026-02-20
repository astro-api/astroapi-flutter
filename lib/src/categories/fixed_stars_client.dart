import '../config/astrology_client_config.dart';
import '../http/http_helper.dart';
import '../models/requests/requests.dart';
import '../models/responses/responses.dart';
import 'base_category_client.dart';

class FixedStarsClient extends BaseCategoryClient {
  static const String _apiPrefix = '/api/v3/fixed-stars';

  FixedStarsClient(HttpHelper http) : super(http, _apiPrefix);

  Future<FixedStarsResponse> getPositions(
    FixedStarsPositionsRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['positions']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<FixedStarsResponse> getConjunctions(
    FixedStarsConjunctionsRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['conjunctions']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<FixedStarsResponse> getReport(
    FixedStarsReportRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['report']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<FixedStarsResponse> getPresets({
    RequestOptions? options,
  }) async {
    final data = await http.get<Map<String, dynamic>>(
      buildUrl(['presets']),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }
}
