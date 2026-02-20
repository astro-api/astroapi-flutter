import '../config/astrology_client_config.dart';
import '../http/http_helper.dart';
import '../models/requests/requests.dart';
import '../models/responses/responses.dart';
import 'base_category_client.dart';

class TarotClient extends BaseCategoryClient {
  static const String _apiPrefix = '/api/v3/tarot';

  TarotClient(HttpHelper http) : super(http, _apiPrefix);

  Future<TarotResponse> drawCards(
    DrawCardsRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['draw']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<TarotResponse> getSpreadReading(
    Map<String, dynamic> request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['reading']),
      request,
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<TarotCardResponse> getCard(
    String cardId, {
    RequestOptions? options,
  }) async {
    final data = await http.get<Map<String, dynamic>>(
      buildUrl(['cards', cardId]),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<TarotResponse> getCards({
    TarotCardSearchParams? params,
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
      buildUrl(['cards']),
      options: merged,
    );
    return GenericResponse.fromJson(data);
  }

  Future<TarotResponse> getDailyCard({
    DailyCardParams? params,
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
      buildUrl(['daily-card']),
      options: merged,
    );
    return GenericResponse.fromJson(data);
  }

  Future<TarotResponse> getGlossary({
    TarotGlossaryParams? params,
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
      buildUrl(['glossary']),
      options: merged,
    );
    return GenericResponse.fromJson(data);
  }

  Future<TarotResponse> analyzeNatalReport(
    TarotNatalReportRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['analysis', 'natal-report']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<TarotResponse> analyzeTransitReport(
    TarotTransitReportRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['analysis', 'transit-report']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<TarotResponse> getBirthCards(
    BirthCardFlexibleRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['analysis', 'birth-cards']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<TarotResponse> analyzeElementalDignities(
    ElementalDignitiesRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['analysis', 'dignities']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<TarotResponse> getQuintessence(
    QuintessenceRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['analysis', 'quintessence']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<TarotResponse> analyzeTiming(
    TimingAnalysisRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['analysis', 'timing']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<TarotResponse> getOptimalTimes(
    OptimalTimesRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['analysis', 'optimal-times']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }
}
