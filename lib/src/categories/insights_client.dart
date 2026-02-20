import '../config/astrology_client_config.dart';
import '../http/http_helper.dart';
import '../models/requests/requests.dart';
import '../models/responses/responses.dart';
import 'base_category_client.dart';

class InsightsClient extends BaseCategoryClient {
  static const String _apiPrefix = '/api/v3/insights';

  late final RelationshipInsightsClient relationship;
  late final PetInsightsClient pet;
  late final WellnessInsightsClient wellness;
  late final FinancialInsightsClient financial;
  late final BusinessInsightsClient business;

  InsightsClient(HttpHelper http) : super(http, _apiPrefix) {
    relationship = RelationshipInsightsClient(http);
    pet = PetInsightsClient(http);
    wellness = WellnessInsightsClient(http);
    financial = FinancialInsightsClient(http);
    business = BusinessInsightsClient(http);
  }

  Future<InsightsResponse> discover({RequestOptions? options}) async {
    final data = await http.get<Map<String, dynamic>>(
      buildUrl([]),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }
}

class RelationshipInsightsClient extends BaseCategoryClient {
  static const String _apiPrefix = '/api/v3/insights/relationship';

  RelationshipInsightsClient(HttpHelper http) : super(http, _apiPrefix);

  Future<InsightsResponse> getCompatibility(
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

  Future<InsightsResponse> getCompatibilityScore(
    MultipleSubjectsRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['compatibility-score']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<InsightsResponse> getLoveLanguages(
    SingleSubjectRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['love-languages']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<InsightsResponse> getDavisonReport(
    MultipleSubjectsRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['davison']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<InsightsResponse> getTiming(
    CompatibilityRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['timing']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<InsightsResponse> getRedFlags(
    SingleSubjectRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['red-flags']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<InsightsResponse> discover({RequestOptions? options}) async {
    final data = await http.get<Map<String, dynamic>>(
      buildUrl([]),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }
}

class PetInsightsClient extends BaseCategoryClient {
  static const String _apiPrefix = '/api/v3/insights/pet';

  PetInsightsClient(HttpHelper http) : super(http, _apiPrefix);

  Future<PetPersonalityResponse> getPersonality(
    PetSingleSubjectRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['personality']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<PetCompatibilityResponse> getCompatibility(
    PetCompatibilityRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['compatibility']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<PetTrainingWindowsResponse> getTrainingWindows(
    PetSingleSubjectRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['training-windows']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<PetHealthSensitivitiesResponse> getHealthSensitivities(
    PetSingleSubjectRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['health-sensitivities']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<MultiPetDynamicsResponse> getMultiPetDynamics(
    PetMultiSubjectRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['multi-pet-dynamics']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }
}

class WellnessInsightsClient extends BaseCategoryClient {
  static const String _apiPrefix = '/api/v3/insights/wellness';

  WellnessInsightsClient(HttpHelper http) : super(http, _apiPrefix);

  Future<InsightsResponse> getBodyMapping(
    SingleSubjectRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['body-mapping']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<InsightsResponse> getBiorhythms(
    SingleSubjectRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['biorhythms']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<InsightsResponse> getWellnessTiming(
    SingleSubjectRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['wellness-timing']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<InsightsResponse> getEnergyPatterns(
    SingleSubjectRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['energy-patterns']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<InsightsResponse> getWellnessScore(
    SingleSubjectRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['wellness-score']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<InsightsResponse> getMoonWellness(
    SingleSubjectRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['moon-wellness']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }
}

class FinancialInsightsClient extends BaseCategoryClient {
  static const String _apiPrefix = '/api/v3/insights/financial';

  FinancialInsightsClient(HttpHelper http) : super(http, _apiPrefix);

  Future<MarketTimingResponse> getMarketTiming(
    MarketTimingRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['market-timing']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<PersonalTradingResponse> analyzePersonalTrading(
    PersonalTradingRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['personal-trading']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<GannAnalysisResponse> getGannAnalysis(
    GannAnalysisRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['gann-analysis']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<BradleySiderographResponse> getBradleySiderograph(
    BradleySiderographRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['bradley-siderograph']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<CryptoTimingResponse> getCryptoTiming(
    CryptoTimingRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['crypto-timing']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<ForexTimingResponse> getForexTiming(
    ForexTimingRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['forex-timing']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }
}

class BusinessInsightsClient extends BaseCategoryClient {
  static const String _apiPrefix = '/api/v3/insights/business';

  BusinessInsightsClient(HttpHelper http) : super(http, _apiPrefix);

  Future<BusinessInsightsResponse> getTeamDynamics(
    BusinessMultipleRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['team-dynamics']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<BusinessInsightsResponse> getHiringCompatibility(
    BusinessMultipleRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['hiring-compatibility']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<BusinessInsightsResponse> getLeadershipStyle(
    BusinessSingleRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['leadership-style']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<BusinessInsightsResponse> getBusinessTiming(
    BusinessTimingRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['business-timing']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<BusinessInsightsResponse> getDepartmentCompatibility(
    BusinessMultipleRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['department-compatibility']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }

  Future<BusinessInsightsResponse> getSuccessionPlanning(
    BusinessMultipleRequest request, {
    RequestOptions? options,
  }) async {
    final data = await http.post<Map<String, dynamic>>(
      buildUrl(['succession-planning']),
      request.toJson(),
      options: options,
    );
    return GenericResponse.fromJson(data);
  }
}
