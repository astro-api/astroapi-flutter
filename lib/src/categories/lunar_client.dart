import '../config/astrology_client_config.dart';
import '../http/http_helper.dart';
import '../models/requests/requests.dart';
import '../models/responses/responses.dart';
import 'base_category_client.dart';

class LunarClient extends BaseCategoryClient {
  static const String _apiPrefix = '/api/v3/lunar';

  LunarClient(HttpHelper http) : super(http, _apiPrefix);

  Future<LunarCalendarResponse> getCalendar(
    int year, {
    LunarCalendarParams? params,
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
      buildUrl(['calendar', year.toString()]),
      options: merged,
    );
    return GenericResponse.fromJson(data);
  }

  Future<LunarPhasesResponse> getPhases(
    LunarPhasesRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['phases']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<LunarEventsResponse> getEvents(
    LunarEventsRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['events']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<LunarMansionsResponse> getMansions(
    LunarMansionsRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['mansions']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<VoidOfCourseResponse> getVoidOfCourse(
    VoidOfCourseRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['void-of-course']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }
}
