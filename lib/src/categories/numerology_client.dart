import '../config/astrology_client_config.dart';
import '../http/http_helper.dart';
import '../models/requests/requests.dart';
import '../models/responses/responses.dart';
import 'base_category_client.dart';

class NumerologyClient extends BaseCategoryClient {
  static const String _apiPrefix = '/api/v3/numerology';

  NumerologyClient(HttpHelper http) : super(http, _apiPrefix);

  Future<NumerologyResponse> getCoreNumbers(
    NumerologyCoreRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['core-numbers']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<NumerologyResponse> getComprehensive(
    NumerologyCoreRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['comprehensive']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<NumerologyResponse> getCompatibility(
    NumerologyCompatibilityRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['compatibility']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }
}
