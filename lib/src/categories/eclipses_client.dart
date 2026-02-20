import '../config/astrology_client_config.dart';
import '../http/http_helper.dart';
import '../models/requests/requests.dart';
import '../models/responses/responses.dart';
import 'base_category_client.dart';

class EclipsesClient extends BaseCategoryClient {
  static const String _apiPrefix = '/api/v3/eclipses';

  EclipsesClient(HttpHelper http) : super(http, _apiPrefix);

  Future<EclipseResponse> getUpcoming({
    UpcomingEclipsesParams? params,
    RequestOptions? options,
  }) async {
    final queryParams = params?.toQueryParams();
    final merged = options != null
        ? RequestOptions(
            headers: options.headers,
            params: {...?options.params, ...?queryParams},
            timeout: options.timeout,
            cancelToken: options.cancelToken,
          )
        : queryParams != null
            ? RequestOptions(params: queryParams)
            : null;
    final data = await http.get<Map<String, dynamic>>(
      buildUrl(['upcoming']),
      options: merged,
    );
    return GenericResponse.fromJson(data);
  }

  Future<EclipseNatalCheckResponse> checkNatal(
    EclipseNatalCheckRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['natal-check']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<EclipseResponse> getInterpretation(
    EclipseInterpretationRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['interpretation']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }
}
