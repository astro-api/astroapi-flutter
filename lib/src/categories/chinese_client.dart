import '../config/astrology_client_config.dart';
import '../http/http_helper.dart';
import '../models/requests/requests.dart';
import '../models/responses/responses.dart';
import 'base_category_client.dart';

class ChineseClient extends BaseCategoryClient {
  static const String _apiPrefix = '/api/v3/chinese';

  ChineseClient(HttpHelper http) : super(http, _apiPrefix);

  Future<BaZiResponse> getBaZi(
    BaZiRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['bazi']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<ChineseLuckPillarsResponse> getLuckPillars(
    LuckPillarsRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['luck-pillars']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<ChineseCompatibilityResponse> getCompatibility(
    Map<String, dynamic> request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['compatibility']),
      request,
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<ChineseYearlyResponse> getYearlyForecast(
    ChineseYearlyRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['yearly-forecast']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<ChineseMingGuaResponse> getMingGua(
    Map<String, dynamic> request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['ming-gua']),
      request,
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<ChineseSolarTermsResponse> getSolarTerms(
    int year, {
    RequestOptions? options,
  }) async {
    final data = await http.get<Map<String, dynamic>>(
      buildUrl(['calendar', 'solar-terms', year.toString()]),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<ChineseElementsBalanceResponse> getElementsBalance(
    int year, {
    RequestOptions? options,
  }) async {
    final data = await http.get<Map<String, dynamic>>(
      buildUrl(['elements', 'balance', year.toString()]),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<ChineseZodiacResponse> getZodiac(
    String animal, {
    RequestOptions? options,
  }) async {
    final data = await http.get<Map<String, dynamic>>(
      buildUrl(['zodiac', animal]),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }
}
