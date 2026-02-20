import '../config/astrology_client_config.dart';
import '../http/http_helper.dart';
import '../models/requests/requests.dart';
import '../models/responses/responses.dart';
import 'base_category_client.dart';

class HoroscopeClient extends BaseCategoryClient {
  static const String _apiPrefix = '/api/v3/horoscope';

  HoroscopeClient(HttpHelper http) : super(http, _apiPrefix);

  Future<PersonalDailyHoroscopeResponse> getPersonalDailyHoroscope(
    PersonalHoroscopeRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['personal', 'daily']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<HoroscopeTextResponse> getPersonalDailyHoroscopeText(
    PersonalHoroscopeRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['personal', 'daily', 'text']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<PersonalDailyHoroscopeResponse> getPersonalWeeklyHoroscope(
    PersonalHoroscopeRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['personal', 'weekly']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<HoroscopeTextResponse> getPersonalWeeklyHoroscopeText(
    PersonalHoroscopeRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['personal', 'weekly', 'text']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<PersonalDailyHoroscopeResponse> getPersonalMonthlyHoroscope(
    PersonalHoroscopeRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['personal', 'monthly']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<HoroscopeTextResponse> getPersonalMonthlyHoroscopeText(
    PersonalHoroscopeRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['personal', 'monthly', 'text']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<PersonalDailyHoroscopeResponse> getPersonalYearlyHoroscope(
    PersonalHoroscopeRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['personal', 'yearly']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<HoroscopeTextResponse> getPersonalYearlyHoroscopeText(
    PersonalHoroscopeRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['personal', 'yearly', 'text']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<PersonalDailyHoroscopeResponse> getSignDailyHoroscope(
    SunSignHoroscopeRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['sign', 'daily']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<HoroscopeTextResponse> getSignDailyHoroscopeText(
    SunSignHoroscopeRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['sign', 'daily', 'text']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<SunSignWeeklyHoroscopeResponse> getSignWeeklyHoroscope(
    SunSignWeeklyHoroscopeRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['sign', 'weekly']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<HoroscopeTextResponse> getSignWeeklyHoroscopeText(
    SunSignWeeklyHoroscopeRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['sign', 'weekly', 'text']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<SunSignMonthlyHoroscopeResponse> getSignMonthlyHoroscope(
    SunSignMonthlyHoroscopeRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['sign', 'monthly']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<HoroscopeTextResponse> getSignMonthlyHoroscopeText(
    SunSignMonthlyHoroscopeRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['sign', 'monthly', 'text']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<SunSignYearlyHoroscopeResponse> getSignYearlyHoroscope(
    SunSignYearlyHoroscopeRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['sign', 'yearly']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<HoroscopeTextResponse> getSignYearlyHoroscopeText(
    SunSignYearlyHoroscopeRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['sign', 'yearly', 'text']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<ChineseHoroscopeResponse> getChineseHoroscope(
    ChineseHoroscopeRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['chinese', 'bazi']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }
}
