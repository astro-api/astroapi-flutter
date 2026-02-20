// All response types use Map<String, dynamic> as the base since the API returns
// complex JSON structures. Typed wrappers are provided where the structure is
// well-known and consistent across API versions.

/// Generic API response — used when the structure is dynamic or unknown.
typedef ApiResponse = Map<String, dynamic>;

// ─── Data ────────────────────────────────────────────────────────────────────

class PlanetaryPosition {
  final String name;
  final String sign;
  final double degree;
  final bool retrograde;
  final int? house;
  final Map<String, dynamic> raw;

  const PlanetaryPosition({
    required this.name,
    required this.sign,
    required this.degree,
    required this.retrograde,
    this.house,
    required this.raw,
  });

  factory PlanetaryPosition.fromJson(Map<String, dynamic> json) =>
      PlanetaryPosition(
        name: json['name'] as String? ?? '',
        sign: json['sign'] as String? ?? '',
        degree: (json['degree'] as num?)?.toDouble() ?? 0.0,
        retrograde: json['retrograde'] as bool? ?? false,
        house: json['house'] as int?,
        raw: json,
      );
}

class HouseCusp {
  final int house;
  final String sign;
  final double degree;
  final Map<String, dynamic> raw;

  const HouseCusp({
    required this.house,
    required this.sign,
    required this.degree,
    required this.raw,
  });

  factory HouseCusp.fromJson(Map<String, dynamic> json) => HouseCusp(
        house: json['house'] as int? ?? 0,
        sign: json['sign'] as String? ?? '',
        degree: (json['degree'] as num?)?.toDouble() ?? 0.0,
        raw: json,
      );
}

class Aspect {
  final String planet1;
  final String planet2;
  final String aspect;
  final double orb;
  final Map<String, dynamic> raw;

  const Aspect({
    required this.planet1,
    required this.planet2,
    required this.aspect,
    required this.orb,
    required this.raw,
  });

  factory Aspect.fromJson(Map<String, dynamic> json) => Aspect(
        planet1: json['planet1'] as String? ?? '',
        planet2: json['planet2'] as String? ?? '',
        aspect: json['aspect'] as String? ?? '',
        orb: (json['orb'] as num?)?.toDouble() ?? 0.0,
        raw: json,
      );
}

class PlanetaryPositionsResponse {
  final List<PlanetaryPosition> positions;
  final Map<String, dynamic> raw;

  const PlanetaryPositionsResponse(
      {required this.positions, required this.raw});

  factory PlanetaryPositionsResponse.fromJson(Map<String, dynamic> json) {
    final list = (json['positions'] as List?)
            ?.map((e) => PlanetaryPosition.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
    return PlanetaryPositionsResponse(positions: list, raw: json);
  }
}

class AspectsResponse {
  final List<Aspect> aspects;
  final Map<String, dynamic> raw;

  const AspectsResponse({required this.aspects, required this.raw});

  factory AspectsResponse.fromJson(Map<String, dynamic> json) {
    final list = (json['aspects'] as List?)
            ?.map((e) => Aspect.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
    return AspectsResponse(aspects: list, raw: json);
  }
}

class HouseCuspsResponse {
  final List<HouseCusp> houseCusps;
  final Map<String, dynamic> raw;

  const HouseCuspsResponse({required this.houseCusps, required this.raw});

  factory HouseCuspsResponse.fromJson(Map<String, dynamic> json) {
    final list = (json['house_cusps'] as List?)
            ?.map((e) => HouseCusp.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
    return HouseCuspsResponse(houseCusps: list, raw: json);
  }
}

class ChartData {
  final List<PlanetaryPosition> planetaryPositions;
  final List<HouseCusp> houseCusps;
  final List<Aspect> aspects;
  final Map<String, dynamic> raw;

  const ChartData({
    required this.planetaryPositions,
    required this.houseCusps,
    required this.aspects,
    required this.raw,
  });

  factory ChartData.fromJson(Map<String, dynamic> json) => ChartData(
        planetaryPositions: (json['planetary_positions'] as List?)
                ?.map((e) =>
                    PlanetaryPosition.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        houseCusps: (json['house_cusps'] as List?)
                ?.map((e) => HouseCusp.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        aspects: (json['aspects'] as List?)
                ?.map((e) => Aspect.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        raw: json,
      );
}

/// For responses that are fully dynamic (complex nested objects from the API).
/// Use .raw to access all fields.
class GenericResponse {
  final Map<String, dynamic> raw;
  const GenericResponse(this.raw);

  factory GenericResponse.fromJson(Map<String, dynamic> json) =>
      GenericResponse(json);

  dynamic operator [](String key) => raw[key];
}

// Type aliases for category-specific responses that are complex/dynamic:
typedef EnhancedPositionsResponse = GenericResponse;
typedef GlobalPositionsResponse = GenericResponse;
typedef EnhancedAspectsResponse = GenericResponse;
typedef LunarMetricsResponse = GenericResponse;
typedef EnhancedLunarMetricsResponse = GenericResponse;
typedef CurrentMomentResponse = GenericResponse;

// Charts responses
typedef NatalChartResponse = GenericResponse;
typedef CompositeChartResponse = GenericResponse;
typedef SynastryChartResponse = GenericResponse;
typedef TransitChartResponse = GenericResponse;
typedef SolarReturnChartResponse = GenericResponse;
typedef LunarReturnChartResponse = GenericResponse;
typedef SolarReturnTransitChartResponse = GenericResponse;
typedef LunarReturnTransitChartResponse = GenericResponse;
typedef ProgressionChartResponse = GenericResponse;
typedef DirectionChartResponse = GenericResponse;
typedef NatalTransitChartResponse = GenericResponse;
typedef VenusReturnChartResponse = GenericResponse;
typedef VenusReturnTransitChartResponse = GenericResponse;

// Horoscope responses
typedef PersonalDailyHoroscopeResponse = GenericResponse;
typedef HoroscopeTextResponse = GenericResponse;
typedef SunSignWeeklyHoroscopeResponse = GenericResponse;
typedef SunSignMonthlyHoroscopeResponse = GenericResponse;
typedef SunSignYearlyHoroscopeResponse = GenericResponse;
typedef ChineseHoroscopeResponse = GenericResponse;

// Analysis responses
typedef AnalysisResponse = GenericResponse;
typedef CompatibilityScoreResponse = GenericResponse;
typedef RelationshipScoreResponse = GenericResponse;

// Glossary responses
typedef GlossaryResponse = GenericResponse;

// Astrocartography responses
typedef AstrocartographyResponse = GenericResponse;
typedef AstrodynamesResponse = GenericResponse;

// Chinese responses
typedef BaZiResponse = GenericResponse;
typedef ChineseCompatibilityResponse = GenericResponse;
typedef ChineseLuckPillarsResponse = GenericResponse;
typedef ChineseYearlyResponse = GenericResponse;
typedef ChineseZodiacResponse = GenericResponse;
typedef ChineseSolarTermsResponse = GenericResponse;
typedef ChineseElementsBalanceResponse = GenericResponse;
typedef ChineseMingGuaResponse = GenericResponse;

// Eclipse responses
typedef EclipseResponse = GenericResponse;
typedef EclipseNatalCheckResponse = GenericResponse;

// Lunar responses
typedef LunarPhasesResponse = GenericResponse;
typedef LunarEventsResponse = GenericResponse;
typedef LunarMansionsResponse = GenericResponse;
typedef VoidOfCourseResponse = GenericResponse;
typedef LunarCalendarResponse = GenericResponse;

// Numerology responses
typedef NumerologyResponse = GenericResponse;

// Tarot responses
typedef TarotResponse = GenericResponse;
typedef TarotCardResponse = GenericResponse;

// Fixed stars responses
typedef FixedStarsResponse = GenericResponse;

// Traditional responses
typedef TraditionalResponse = GenericResponse;

// Insights responses
typedef InsightsResponse = GenericResponse;
typedef PetPersonalityResponse = GenericResponse;
typedef PetCompatibilityResponse = GenericResponse;
typedef PetTrainingWindowsResponse = GenericResponse;
typedef PetHealthSensitivitiesResponse = GenericResponse;
typedef MultiPetDynamicsResponse = GenericResponse;
typedef MarketTimingResponse = GenericResponse;
typedef CryptoTimingResponse = GenericResponse;
typedef BradleySiderographResponse = GenericResponse;
typedef ForexTimingResponse = GenericResponse;
typedef GannAnalysisResponse = GenericResponse;
typedef PersonalTradingResponse = GenericResponse;
typedef BusinessInsightsResponse = GenericResponse;

// Enhanced responses
typedef EnhancedAnalysisResponse = GenericResponse;
typedef EnhancedChartAnalysisResponse = GenericResponse;

// SVG — returns String
// (handled directly in SvgClient)
