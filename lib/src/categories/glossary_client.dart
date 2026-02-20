import '../config/astrology_client_config.dart';
import '../http/http_helper.dart';
import '../models/requests/requests.dart';
import '../models/responses/responses.dart';
import 'base_category_client.dart';

class GlossaryClient extends BaseCategoryClient {
  static const String _apiPrefix = '/api/v3/glossary';

  GlossaryClient(HttpHelper http) : super(http, _apiPrefix);

  Future<GlossaryResponse> getActivePoints({
    RequestOptions? options,
  }) async {
    final data = await http.get<Map<String, dynamic>>(
      buildUrl(['active-points']),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<GlossaryResponse> getPrimaryActivePoints({
    RequestOptions? options,
  }) async {
    final data = await http.get<Map<String, dynamic>>(
      buildUrl(['active-points', 'primary']),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<GlossaryResponse> getCities({
    CitySearchParams? params,
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
      buildUrl(['cities']),
      options: merged,
    );
    return GenericResponse.fromJson(data);
  }

  Future<GlossaryResponse> getCountries({
    RequestOptions? options,
  }) async {
    final data = await http.get<Map<String, dynamic>>(
      buildUrl(['countries']),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<GlossaryResponse> getElements({
    RequestOptions? options,
  }) async {
    final data = await http.get<Map<String, dynamic>>(
      buildUrl(['elements']),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<GlossaryResponse> getFixedStars({
    RequestOptions? options,
  }) async {
    final data = await http.get<Map<String, dynamic>>(
      buildUrl(['fixed-stars']),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<GlossaryResponse> getHoraryCategoriesGlossary({
    RequestOptions? options,
  }) async {
    final data = await http.get<Map<String, dynamic>>(
      buildUrl(['horary-categories']),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<GlossaryResponse> getHouseSystems({
    RequestOptions? options,
  }) async {
    final data = await http.get<Map<String, dynamic>>(
      buildUrl(['house-systems']),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<GlossaryResponse> getHouses({
    RequestOptions? options,
  }) async {
    final data = await http.get<Map<String, dynamic>>(
      buildUrl(['houses']),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<GlossaryResponse> getKeywords({
    String? category,
    RequestOptions? options,
  }) async {
    final queryParams = category != null ? {'category': category} : null;
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
      buildUrl(['keywords']),
      options: merged,
    );
    return GenericResponse.fromJson(data);
  }

  Future<GlossaryResponse> getLanguages({
    RequestOptions? options,
  }) async {
    final data = await http.get<Map<String, dynamic>>(
      buildUrl(['languages']),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<GlossaryResponse> getLifeAreas({
    String? language,
    RequestOptions? options,
  }) async {
    final queryParams = language != null ? {'language': language} : null;
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
      buildUrl(['life-areas']),
      options: merged,
    );
    return GenericResponse.fromJson(data);
  }

  Future<GlossaryResponse> getThemes({
    RequestOptions? options,
  }) async {
    final data = await http.get<Map<String, dynamic>>(
      buildUrl(['themes']),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<GlossaryResponse> getZodiacTypes({
    RequestOptions? options,
  }) async {
    final data = await http.get<Map<String, dynamic>>(
      buildUrl(['zodiac-types']),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }
}
