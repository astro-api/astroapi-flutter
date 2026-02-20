import '../enums/language.dart';
import '../enums/tradition.dart';
import 'chart_options.dart';
import 'data_options.dart';
import 'date_time_location.dart';
import 'fixed_stars_config.dart';
import 'report_options.dart';
import 'standard_options.dart';
import 'subject.dart';

// ─── Data ────────────────────────────────────────────────────────────────────

class DataRequest {
  final Subject subject;
  final DataOptions? options;

  const DataRequest({required this.subject, this.options});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (options != null) 'options': options!.toJson(),
      };
}

typedef PlanetaryPositionsRequest = DataRequest;

class GlobalDataRequest {
  final int year;
  final int month;
  final int day;
  final int hour;
  final int minute;
  final int second;
  final DataOptions? options;

  const GlobalDataRequest({
    required this.year,
    required this.month,
    required this.day,
    required this.hour,
    required this.minute,
    required this.second,
    this.options,
  });

  Map<String, dynamic> toJson() => {
        'year': year,
        'month': month,
        'day': day,
        'hour': hour,
        'minute': minute,
        'second': second,
        if (options != null) 'options': options!.toJson(),
      };
}

class LunarMetricsRequest {
  final DateTimeLocation datetimeLocation;
  final Language? language;

  const LunarMetricsRequest({required this.datetimeLocation, this.language});

  Map<String, dynamic> toJson() => {
        'datetime_location': datetimeLocation.toJson(),
        if (language != null) 'language': language!.value,
      };
}

// ─── Charts ───────────────────────────────────────────────────────────────────

class NatalChartRequest {
  final Subject subject;
  final ChartOptions? options;

  const NatalChartRequest({required this.subject, this.options});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (options != null) 'options': options!.toJson(),
      };
}

class CompositeChartRequest {
  final Subject subject1;
  final Subject subject2;
  final ChartOptions? options;

  const CompositeChartRequest(
      {required this.subject1, required this.subject2, this.options});

  Map<String, dynamic> toJson() => {
        'subject1': subject1.toJson(),
        'subject2': subject2.toJson(),
        if (options != null) 'options': options!.toJson(),
      };
}

class SynastryChartRequest {
  final Subject subject1;
  final Subject subject2;
  final ChartOptions? options;

  const SynastryChartRequest(
      {required this.subject1, required this.subject2, this.options});

  Map<String, dynamic> toJson() => {
        'subject1': subject1.toJson(),
        'subject2': subject2.toJson(),
        if (options != null) 'options': options!.toJson(),
      };
}

class TransitChartRequest {
  final Subject natalSubject;
  final DateTimeLocation transitDatetime;
  final ChartOptions? options;
  final Map<String, dynamic>? orbs;

  const TransitChartRequest({
    required this.natalSubject,
    required this.transitDatetime,
    this.options,
    this.orbs,
  });

  Map<String, dynamic> toJson() => {
        'natal_subject': natalSubject.toJson(),
        'transit_datetime': transitDatetime.toJson(),
        if (options != null) 'options': options!.toJson(),
        if (orbs != null) 'orbs': orbs,
      };
}

class SolarReturnRequest {
  final Subject subject;
  final int returnYear;
  final DateTimeLocation? returnLocation;
  final ChartOptions? options;

  const SolarReturnRequest({
    required this.subject,
    required this.returnYear,
    this.returnLocation,
    this.options,
  });

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        'return_year': returnYear,
        if (returnLocation != null) 'return_location': returnLocation!.toJson(),
        if (options != null) 'options': options!.toJson(),
      };
}

class LunarReturnRequest {
  final Subject subject;
  final String returnDate;
  final DateTimeLocation? returnLocation;
  final ChartOptions? options;

  const LunarReturnRequest({
    required this.subject,
    required this.returnDate,
    this.returnLocation,
    this.options,
  });

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        'return_date': returnDate,
        if (returnLocation != null) 'return_location': returnLocation!.toJson(),
        if (options != null) 'options': options!.toJson(),
      };
}

enum ProgressionType { secondary, primary, tertiary, minor }

class ProgressionRequest {
  final Subject subject;
  final String targetDate;
  final ProgressionType progressionType;
  final DateTimeLocation? location;
  final ChartOptions? options;

  const ProgressionRequest({
    required this.subject,
    required this.targetDate,
    required this.progressionType,
    this.location,
    this.options,
  });

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        'target_date': targetDate,
        'progression_type': progressionType.name,
        if (location != null) 'location': location!.toJson(),
        if (options != null) 'options': options!.toJson(),
      };
}

class DirectionRequest {
  final Subject subject;
  final String targetDate;
  final DateTimeLocation? location;
  final ChartOptions? options;

  const DirectionRequest({
    required this.subject,
    required this.targetDate,
    this.location,
    this.options,
  });

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        'target_date': targetDate,
        if (location != null) 'location': location!.toJson(),
        if (options != null) 'options': options!.toJson(),
      };
}

class SolarReturnTransitRequest {
  final Subject subject;
  final int returnYear;
  final DateTimeLocation transitDatetime;
  final DateTimeLocation? returnLocation;
  final ChartOptions? options;

  const SolarReturnTransitRequest({
    required this.subject,
    required this.returnYear,
    required this.transitDatetime,
    this.returnLocation,
    this.options,
  });

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        'return_year': returnYear,
        'transit_datetime': transitDatetime.toJson(),
        if (returnLocation != null) 'return_location': returnLocation!.toJson(),
        if (options != null) 'options': options!.toJson(),
      };
}

class LunarReturnTransitRequest {
  final Subject subject;
  final String returnDate;
  final DateTimeLocation transitDatetime;
  final DateTimeLocation? returnLocation;
  final ChartOptions? options;

  const LunarReturnTransitRequest({
    required this.subject,
    required this.returnDate,
    required this.transitDatetime,
    this.returnLocation,
    this.options,
  });

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        'return_date': returnDate,
        'transit_datetime': transitDatetime.toJson(),
        if (returnLocation != null) 'return_location': returnLocation!.toJson(),
        if (options != null) 'options': options!.toJson(),
      };
}

class NatalTransitRequest {
  final Subject natalSubject;
  final DateTimeLocation transitDatetime;
  final ChartOptions? options;

  const NatalTransitRequest({
    required this.natalSubject,
    required this.transitDatetime,
    this.options,
  });

  Map<String, dynamic> toJson() => {
        'natal_subject': natalSubject.toJson(),
        'transit_datetime': transitDatetime.toJson(),
        if (options != null) 'options': options!.toJson(),
      };
}

class VenusReturnRequest {
  final Subject subject;
  final int returnYear;
  final DateTimeLocation? returnLocation;
  final ChartOptions? options;

  const VenusReturnRequest({
    required this.subject,
    required this.returnYear,
    this.returnLocation,
    this.options,
  });

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        'return_year': returnYear,
        if (returnLocation != null) 'return_location': returnLocation!.toJson(),
        if (options != null) 'options': options!.toJson(),
      };
}

// ─── Analysis ─────────────────────────────────────────────────────────────────

class NatalReportRequest {
  final Subject subject;
  final ReportTradition? tradition;
  final Language? language;
  final FixedStarsConfig? fixedStars;

  const NatalReportRequest({
    required this.subject,
    this.tradition,
    this.language,
    this.fixedStars,
  });

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (tradition != null) 'tradition': tradition!.value,
        if (language != null) 'language': language!.value,
        if (fixedStars != null) 'fixed_stars': fixedStars!.toJson(),
      };
}

class SynastryReportRequest {
  final Subject subject1;
  final Subject subject2;
  final ChartOptions? options;
  final ReportOptions? reportOptions;
  final FixedStarsConfig? fixedStars;

  const SynastryReportRequest({
    required this.subject1,
    required this.subject2,
    this.options,
    this.reportOptions,
    this.fixedStars,
  });

  Map<String, dynamic> toJson() => {
        'subject1': subject1.toJson(),
        'subject2': subject2.toJson(),
        if (options != null) 'options': options!.toJson(),
        if (reportOptions != null) 'report_options': reportOptions!.toJson(),
        if (fixedStars != null) 'fixed_stars': fixedStars!.toJson(),
      };
}

class CompositeReportRequest {
  final Subject subject1;
  final Subject subject2;
  final ChartOptions? options;
  final ReportOptions? reportOptions;
  final FixedStarsConfig? fixedStars;

  const CompositeReportRequest({
    required this.subject1,
    required this.subject2,
    this.options,
    this.reportOptions,
    this.fixedStars,
  });

  Map<String, dynamic> toJson() => {
        'subject1': subject1.toJson(),
        'subject2': subject2.toJson(),
        if (options != null) 'options': options!.toJson(),
        if (reportOptions != null) 'report_options': reportOptions!.toJson(),
        if (fixedStars != null) 'fixed_stars': fixedStars!.toJson(),
      };
}

class CompatibilityRequest {
  final List<Subject>? subjects;
  final StandardOptions? options;
  final Map<String, dynamic>? compatibilityOptions;

  const CompatibilityRequest(
      {this.subjects, this.options, this.compatibilityOptions});

  Map<String, dynamic> toJson() => {
        if (subjects != null)
          'subjects': subjects!.map((s) => s.toJson()).toList(),
        if (options != null) 'options': options!.toJson(),
        if (compatibilityOptions != null)
          'compatibility_options': compatibilityOptions,
      };
}

class RelationshipAnalysisRequest {
  final List<Subject> subjects;
  final StandardOptions? options;
  final ReportOptions? reportOptions;

  const RelationshipAnalysisRequest(
      {required this.subjects, this.options, this.reportOptions});

  Map<String, dynamic> toJson() => {
        'subjects': subjects.map((s) => s.toJson()).toList(),
        if (options != null) 'options': options!.toJson(),
        if (reportOptions != null) 'report_options': reportOptions!.toJson(),
      };
}

class LunarAnalysisRequest {
  final DateTimeLocation datetimeLocation;
  final String? tradition;
  final String? language;

  const LunarAnalysisRequest(
      {required this.datetimeLocation, this.tradition, this.language});

  Map<String, dynamic> toJson() => {
        'datetime_location': datetimeLocation.toJson(),
        if (tradition != null) 'tradition': tradition,
        if (language != null) 'language': language,
      };
}

class TraditionalAnalysisRequest {
  final Subject subject;
  final ChartOptions? options;
  final Map<String, dynamic>? orbs;

  const TraditionalAnalysisRequest(
      {required this.subject, this.options, this.orbs});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (options != null) 'options': options!.toJson(),
        if (orbs != null) 'orbs': orbs,
      };
}

class ProgressionReportRequest extends ProgressionRequest {
  final ReportOptions? reportOptions;

  const ProgressionReportRequest({
    required super.subject,
    required super.targetDate,
    required super.progressionType,
    super.location,
    super.options,
    this.reportOptions,
  });

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        if (reportOptions != null) 'report_options': reportOptions!.toJson(),
      };
}

class DirectionReportRequest extends DirectionRequest {
  final ReportOptions? reportOptions;

  const DirectionReportRequest({
    required super.subject,
    required super.targetDate,
    super.location,
    super.options,
    this.reportOptions,
  });

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        if (reportOptions != null) 'report_options': reportOptions!.toJson(),
      };
}

class SolarReturnReportRequest extends SolarReturnRequest {
  final ReportOptions? reportOptions;

  const SolarReturnReportRequest({
    required super.subject,
    required super.returnYear,
    super.returnLocation,
    super.options,
    this.reportOptions,
  });

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        if (reportOptions != null) 'report_options': reportOptions!.toJson(),
      };
}

class LunarReturnReportRequest extends LunarReturnRequest {
  final ReportOptions? reportOptions;

  const LunarReturnReportRequest({
    required super.subject,
    required super.returnDate,
    super.returnLocation,
    super.options,
    this.reportOptions,
  });

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        if (reportOptions != null) 'report_options': reportOptions!.toJson(),
      };
}

class SingleSubjectRequest {
  final Subject subject;

  const SingleSubjectRequest({required this.subject});

  Map<String, dynamic> toJson() => {'subject': subject.toJson()};
}

class MultipleSubjectsRequest {
  final List<Subject> subjects;

  const MultipleSubjectsRequest({required this.subjects});

  Map<String, dynamic> toJson() => {
        'subjects': subjects.map((s) => s.toJson()).toList(),
      };
}

// ─── Horoscope ────────────────────────────────────────────────────────────────

enum SunSign {
  aries,
  taurus,
  gemini,
  cancer,
  leo,
  virgo,
  libra,
  scorpio,
  sagittarius,
  capricorn,
  aquarius,
  pisces;

  String get value => name;
}

enum HoroscopeTextFormat { plain, markdown, html }

class SunSignHoroscopeRequest {
  final SunSign sign;
  final String? date;
  final Language? language;
  final ReportTradition? tradition;
  final HoroscopeTextFormat? format;
  final bool? useEmoji;

  const SunSignHoroscopeRequest({
    required this.sign,
    this.date,
    this.language,
    this.tradition,
    this.format,
    this.useEmoji,
  });

  Map<String, dynamic> toJson() => {
        'sign': sign.value,
        if (date != null) 'date': date,
        if (language != null) 'language': language!.value,
        if (tradition != null) 'tradition': tradition!.value,
        if (format != null) 'format': format!.name,
        if (useEmoji != null) 'use_emoji': useEmoji,
      };
}

class SunSignWeeklyHoroscopeRequest {
  final SunSign sign;
  final String? startDate;
  final Language? language;
  final ReportTradition? tradition;
  final HoroscopeTextFormat? format;
  final bool? useEmoji;

  const SunSignWeeklyHoroscopeRequest({
    required this.sign,
    this.startDate,
    this.language,
    this.tradition,
    this.format,
    this.useEmoji,
  });

  Map<String, dynamic> toJson() => {
        'sign': sign.value,
        if (startDate != null) 'start_date': startDate,
        if (language != null) 'language': language!.value,
        if (tradition != null) 'tradition': tradition!.value,
        if (format != null) 'format': format!.name,
        if (useEmoji != null) 'use_emoji': useEmoji,
      };
}

class SunSignMonthlyHoroscopeRequest {
  final SunSign sign;
  final String? month;
  final int? year;
  final Language? language;
  final ReportTradition? tradition;
  final HoroscopeTextFormat? format;
  final bool? useEmoji;

  const SunSignMonthlyHoroscopeRequest({
    required this.sign,
    this.month,
    this.year,
    this.language,
    this.tradition,
    this.format,
    this.useEmoji,
  });

  Map<String, dynamic> toJson() => {
        'sign': sign.value,
        if (month != null) 'month': month,
        if (year != null) 'year': year,
        if (language != null) 'language': language!.value,
        if (tradition != null) 'tradition': tradition!.value,
        if (format != null) 'format': format!.name,
        if (useEmoji != null) 'use_emoji': useEmoji,
      };
}

class SunSignYearlyHoroscopeRequest {
  final SunSign sign;
  final int? year;
  final Language? language;

  const SunSignYearlyHoroscopeRequest(
      {required this.sign, this.year, this.language});

  Map<String, dynamic> toJson() => {
        'sign': sign.value,
        if (year != null) 'year': year,
        if (language != null) 'language': language!.value,
      };
}

class PersonalHoroscopeRequest {
  final Subject subject;
  final String? date;
  final Language? language;
  final ReportTradition? tradition;
  final HoroscopeTextFormat? format;
  final bool? useEmoji;

  const PersonalHoroscopeRequest({
    required this.subject,
    this.date,
    this.language,
    this.tradition,
    this.format,
    this.useEmoji,
  });

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (date != null) 'date': date,
        if (language != null) 'language': language!.value,
        if (tradition != null) 'tradition': tradition!.value,
        if (format != null) 'format': format!.name,
        if (useEmoji != null) 'use_emoji': useEmoji,
      };
}

class ChineseHoroscopeSubjectBirthData {
  final int year;
  final int? month;
  final int? day;
  final int? hour;
  final int? minute;
  final String? gender;

  const ChineseHoroscopeSubjectBirthData({
    required this.year,
    this.month,
    this.day,
    this.hour,
    this.minute,
    this.gender,
  });

  Map<String, dynamic> toJson() => {
        'year': year,
        if (month != null) 'month': month,
        if (day != null) 'day': day,
        if (hour != null) 'hour': hour,
        if (minute != null) 'minute': minute,
        if (gender != null) 'gender': gender,
      };
}

class ChineseHoroscopeSubject {
  final String? name;
  final ChineseHoroscopeSubjectBirthData birthData;

  const ChineseHoroscopeSubject({this.name, required this.birthData});

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        'birth_data': birthData.toJson(),
      };
}

class ChineseHoroscopeRequest {
  final ChineseHoroscopeSubject subject;
  final int? year;
  final Language? language;

  const ChineseHoroscopeRequest(
      {required this.subject, this.year, this.language});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (year != null) 'year': year,
        if (language != null) 'language': language!.value,
      };
}

// ─── Fixed Stars ──────────────────────────────────────────────────────────────

class FixedStarsPositionsRequest {
  final Subject subject;
  final FixedStarsConfig fixedStars;

  const FixedStarsPositionsRequest(
      {required this.subject, required this.fixedStars});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        'fixed_stars': fixedStars.toJson(),
      };
}

class FixedStarsConjunctionsRequest extends FixedStarsPositionsRequest {
  final bool? includeOppositions;

  const FixedStarsConjunctionsRequest({
    required super.subject,
    required super.fixedStars,
    this.includeOppositions,
  });

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        if (includeOppositions != null)
          'include_oppositions': includeOppositions,
      };
}

typedef FixedStarsReportRequest = FixedStarsPositionsRequest;

// ─── Eclipses ─────────────────────────────────────────────────────────────────

class EclipseNatalCheckRequest {
  final Subject subject;
  final Map<String, dynamic>? options;

  const EclipseNatalCheckRequest({required this.subject, this.options});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (options != null) 'options': options,
      };
}

class EclipseInterpretationRequest {
  final Map<String, dynamic> eclipse;
  final Subject? subject;

  const EclipseInterpretationRequest({required this.eclipse, this.subject});

  Map<String, dynamic> toJson() => {
        'eclipse': eclipse,
        if (subject != null) 'subject': subject!.toJson(),
      };
}

class UpcomingEclipsesParams {
  final int? count;

  const UpcomingEclipsesParams({this.count});

  Map<String, dynamic> toQueryParams() => {
        if (count != null) 'count': count,
      };
}

// ─── Lunar ────────────────────────────────────────────────────────────────────

class LunarPhasesRequest {
  final int year;
  final int? month;
  final Language? language;

  const LunarPhasesRequest({required this.year, this.month, this.language});

  Map<String, dynamic> toJson() => {
        'year': year,
        if (month != null) 'month': month,
        if (language != null) 'language': language!.value,
      };
}

class LunarEventsRequest {
  final int year;
  final int? month;
  final Language? language;

  const LunarEventsRequest({required this.year, this.month, this.language});

  Map<String, dynamic> toJson() => {
        'year': year,
        if (month != null) 'month': month,
        if (language != null) 'language': language!.value,
      };
}

class LunarMansionsRequest {
  final DateTimeLocation datetimeLocation;
  final Language? language;

  const LunarMansionsRequest({required this.datetimeLocation, this.language});

  Map<String, dynamic> toJson() => {
        'datetime_location': datetimeLocation.toJson(),
        if (language != null) 'language': language!.value,
      };
}

class VoidOfCourseRequest {
  final DateTimeLocation datetimeLocation;
  final Language? language;

  const VoidOfCourseRequest({required this.datetimeLocation, this.language});

  Map<String, dynamic> toJson() => {
        'datetime_location': datetimeLocation.toJson(),
        if (language != null) 'language': language!.value,
      };
}

class LunarCalendarParams {
  final int? month;

  const LunarCalendarParams({this.month});

  Map<String, dynamic> toQueryParams() => {if (month != null) 'month': month};
}

// ─── Numerology ───────────────────────────────────────────────────────────────

class NumerologyCoreRequest {
  final String name;
  final int birthYear;
  final int birthMonth;
  final int birthDay;
  final Language? language;

  const NumerologyCoreRequest({
    required this.name,
    required this.birthYear,
    required this.birthMonth,
    required this.birthDay,
    this.language,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'birth_year': birthYear,
        'birth_month': birthMonth,
        'birth_day': birthDay,
        if (language != null) 'language': language!.value,
      };
}

class NumerologyCompatibilityRequest {
  final String name1;
  final int birthYear1;
  final int birthMonth1;
  final int birthDay1;
  final String name2;
  final int birthYear2;
  final int birthMonth2;
  final int birthDay2;
  final Language? language;

  const NumerologyCompatibilityRequest({
    required this.name1,
    required this.birthYear1,
    required this.birthMonth1,
    required this.birthDay1,
    required this.name2,
    required this.birthYear2,
    required this.birthMonth2,
    required this.birthDay2,
    this.language,
  });

  Map<String, dynamic> toJson() => {
        'name1': name1,
        'birth_year1': birthYear1,
        'birth_month1': birthMonth1,
        'birth_day1': birthDay1,
        'name2': name2,
        'birth_year2': birthYear2,
        'birth_month2': birthMonth2,
        'birth_day2': birthDay2,
        if (language != null) 'language': language!.value,
      };
}

// ─── Tarot ────────────────────────────────────────────────────────────────────

class TarotGlossaryParams {
  final String? arcana;
  final String? suit;
  final String? element;
  final String? planet;
  final String? sign;
  final int? house;

  const TarotGlossaryParams({
    this.arcana,
    this.suit,
    this.element,
    this.planet,
    this.sign,
    this.house,
  });

  Map<String, dynamic> toQueryParams() => {
        if (arcana != null) 'arcana': arcana,
        if (suit != null) 'suit': suit,
        if (element != null) 'element': element,
        if (planet != null) 'planet': planet,
        if (sign != null) 'sign': sign,
        if (house != null) 'house': house,
      };
}

class TarotCardSearchParams {
  final String? keyword;
  final String? lifeArea;
  final String? element;
  final String? planet;
  final String? sign;
  final String? arcana;
  final int? page;
  final int? pageSize;

  const TarotCardSearchParams({
    this.keyword,
    this.lifeArea,
    this.element,
    this.planet,
    this.sign,
    this.arcana,
    this.page,
    this.pageSize,
  });

  Map<String, dynamic> toQueryParams() => {
        if (keyword != null) 'keyword': keyword,
        if (lifeArea != null) 'life_area': lifeArea,
        if (element != null) 'element': element,
        if (planet != null) 'planet': planet,
        if (sign != null) 'sign': sign,
        if (arcana != null) 'arcana': arcana,
        if (page != null) 'page': page,
        if (pageSize != null) 'page_size': pageSize,
      };
}

class DailyCardParams {
  final String userId;
  final String? lifeArea;
  final int? birthYear;
  final int? birthMonth;
  final int? birthDay;
  final int? birthHour;
  final int? birthMinute;
  final String? city;
  final String? countryCode;

  const DailyCardParams({
    required this.userId,
    this.lifeArea,
    this.birthYear,
    this.birthMonth,
    this.birthDay,
    this.birthHour,
    this.birthMinute,
    this.city,
    this.countryCode,
  });

  Map<String, dynamic> toQueryParams() => {
        'user_id': userId,
        if (lifeArea != null) 'life_area': lifeArea,
        if (birthYear != null) 'birth_year': birthYear,
        if (birthMonth != null) 'birth_month': birthMonth,
        if (birthDay != null) 'birth_day': birthDay,
        if (birthHour != null) 'birth_hour': birthHour,
        if (birthMinute != null) 'birth_minute': birthMinute,
        if (city != null) 'city': city,
        if (countryCode != null) 'country_code': countryCode,
      };
}

// ─── SVG ──────────────────────────────────────────────────────────────────────

class SvgOptions {
  final int? width;
  final int? height;
  final String? theme;
  final bool? showAspects;
  final bool? showDegrees;

  const SvgOptions({
    this.width,
    this.height,
    this.theme,
    this.showAspects,
    this.showDegrees,
  });

  Map<String, dynamic> toJson() => {
        if (width != null) 'width': width,
        if (height != null) 'height': height,
        if (theme != null) 'theme': theme,
        if (showAspects != null) 'show_aspects': showAspects,
        if (showDegrees != null) 'show_degrees': showDegrees,
      };
}

class NatalChartSvgRequest {
  final Subject subject;
  final ChartOptions? options;
  final SvgOptions? svgOptions;

  const NatalChartSvgRequest(
      {required this.subject, this.options, this.svgOptions});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (options != null) 'options': options!.toJson(),
        if (svgOptions != null) 'svg_options': svgOptions!.toJson(),
      };
}

class SynastryChartSvgRequest {
  final Subject subject1;
  final Subject subject2;
  final ChartOptions? options;
  final SvgOptions? svgOptions;

  const SynastryChartSvgRequest({
    required this.subject1,
    required this.subject2,
    this.options,
    this.svgOptions,
  });

  Map<String, dynamic> toJson() => {
        'subject1': subject1.toJson(),
        'subject2': subject2.toJson(),
        if (options != null) 'options': options!.toJson(),
        if (svgOptions != null) 'svg_options': svgOptions!.toJson(),
      };
}

class CompositeChartSvgRequest {
  final Subject subject1;
  final Subject subject2;
  final ChartOptions? options;
  final SvgOptions? svgOptions;

  const CompositeChartSvgRequest({
    required this.subject1,
    required this.subject2,
    this.options,
    this.svgOptions,
  });

  Map<String, dynamic> toJson() => {
        'subject1': subject1.toJson(),
        'subject2': subject2.toJson(),
        if (options != null) 'options': options!.toJson(),
        if (svgOptions != null) 'svg_options': svgOptions!.toJson(),
      };
}

class TransitChartSvgRequest {
  final Subject natalSubject;
  final DateTimeLocation transitDatetime;
  final ChartOptions? options;
  final SvgOptions? svgOptions;

  const TransitChartSvgRequest({
    required this.natalSubject,
    required this.transitDatetime,
    this.options,
    this.svgOptions,
  });

  Map<String, dynamic> toJson() => {
        'natal_subject': natalSubject.toJson(),
        'transit_datetime': transitDatetime.toJson(),
        if (options != null) 'options': options!.toJson(),
        if (svgOptions != null) 'svg_options': svgOptions!.toJson(),
      };
}

// ─── Enhanced ─────────────────────────────────────────────────────────────────

class GlobalAnalysisRequest {
  final DateTimeLocation datetimeLocation;
  final StandardOptions? options;

  const GlobalAnalysisRequest({required this.datetimeLocation, this.options});

  Map<String, dynamic> toJson() => {
        'datetime_location': datetimeLocation.toJson(),
        if (options != null) 'options': options!.toJson(),
      };
}

class PersonalAnalysisRequest {
  final Subject subject;
  final StandardOptions? options;

  const PersonalAnalysisRequest({required this.subject, this.options});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (options != null) 'options': options!.toJson(),
      };
}

// ─── Chinese ──────────────────────────────────────────────────────────────────

class ChineseBirthData {
  final int year;
  final int? month;
  final int? day;
  final int? hour;
  final String? gender;

  const ChineseBirthData({
    required this.year,
    this.month,
    this.day,
    this.hour,
    this.gender,
  });

  Map<String, dynamic> toJson() => {
        'year': year,
        if (month != null) 'month': month,
        if (day != null) 'day': day,
        if (hour != null) 'hour': hour,
        if (gender != null) 'gender': gender,
      };
}

class ChineseSubject {
  final String? name;
  final ChineseBirthData birthData;

  const ChineseSubject({this.name, required this.birthData});

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        'birth_data': birthData.toJson(),
      };
}

class BaZiRequest {
  final ChineseSubject subject;
  final Language? language;

  const BaZiRequest({required this.subject, this.language});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (language != null) 'language': language!.value,
      };
}

class LuckPillarsRequest {
  final ChineseSubject subject;
  final Language? language;

  const LuckPillarsRequest({required this.subject, this.language});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (language != null) 'language': language!.value,
      };
}

class ChineseYearlyRequest {
  final ChineseSubject subject;
  final int? year;
  final Language? language;

  const ChineseYearlyRequest({required this.subject, this.year, this.language});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (year != null) 'year': year,
        if (language != null) 'language': language!.value,
      };
}

// ─── Astrocartography ─────────────────────────────────────────────────────────

class AstrocartographyLinesRequest {
  final Subject subject;
  final Map<String, dynamic>? options;

  const AstrocartographyLinesRequest({required this.subject, this.options});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (options != null) 'options': options,
      };
}

class AstrocartographyMapRequest {
  final Subject subject;
  final Map<String, dynamic>? options;
  final Map<String, dynamic>? visualOptions;
  final Map<String, dynamic>? region;

  const AstrocartographyMapRequest({
    required this.subject,
    this.options,
    this.visualOptions,
    this.region,
  });

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (options != null) 'options': options,
        if (visualOptions != null) 'visual_options': visualOptions,
        if (region != null) 'region': region,
      };
}

class LocationAnalysisRequest {
  final Subject subject;
  final Map<String, dynamic> location;
  final Map<String, dynamic>? options;

  const LocationAnalysisRequest(
      {required this.subject, required this.location, this.options});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        'location': location,
        if (options != null) 'options': options,
      };
}

class CompareLocationsRequest {
  final Subject subject;
  final List<Map<String, dynamic>> locations;
  final Map<String, dynamic>? options;

  const CompareLocationsRequest(
      {required this.subject, required this.locations, this.options});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        'locations': locations,
        if (options != null) 'options': options,
      };
}

class RelocationChartRequest {
  final Subject subject;
  final Map<String, dynamic> newLocation;
  final ChartOptions? options;

  const RelocationChartRequest({
    required this.subject,
    required this.newLocation,
    this.options,
  });

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        'new_location': newLocation,
        if (options != null) 'options': options!.toJson(),
      };
}

class AstrodynamesRequest {
  final Subject subject;
  final Map<String, dynamic>? options;

  const AstrodynamesRequest({required this.subject, this.options});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (options != null) 'options': options,
      };
}

class AstrodynamesCompareRequest {
  final Subject subject1;
  final Subject subject2;
  final Map<String, dynamic>? options;

  const AstrodynamesCompareRequest({
    required this.subject1,
    required this.subject2,
    this.options,
  });

  Map<String, dynamic> toJson() => {
        'subject1': subject1.toJson(),
        'subject2': subject2.toJson(),
        if (options != null) 'options': options,
      };
}

class PowerZonesRequest {
  final Subject subject;
  final Map<String, dynamic>? searchCriteria;
  final Map<String, dynamic>? filters;

  const PowerZonesRequest(
      {required this.subject, this.searchCriteria, this.filters});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (searchCriteria != null) 'search_criteria': searchCriteria,
        if (filters != null) 'filters': filters,
      };
}

class SearchLocationsRequest {
  final Subject subject;
  final Map<String, dynamic>? searchCriteria;
  final Map<String, dynamic>? filters;

  const SearchLocationsRequest(
      {required this.subject, this.searchCriteria, this.filters});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (searchCriteria != null) 'search_criteria': searchCriteria,
        if (filters != null) 'filters': filters,
      };
}

class ParanMapRequest {
  final Subject subject;
  final Map<String, dynamic>? options;
  final Map<String, dynamic>? visualOptions;
  final Map<String, dynamic>? region;

  const ParanMapRequest(
      {required this.subject, this.options, this.visualOptions, this.region});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (options != null) 'options': options,
        if (visualOptions != null) 'visual_options': visualOptions,
        if (region != null) 'region': region,
      };
}

// ─── Traditional ──────────────────────────────────────────────────────────────

class AnnualProfectionRequest {
  final Subject subject;
  final String? currentDate;
  final int? currentAge;

  const AnnualProfectionRequest(
      {required this.subject, this.currentDate, this.currentAge});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (currentDate != null) 'current_date': currentDate,
        if (currentAge != null) 'current_age': currentAge,
      };
}

class ProfectionTimelineRequest {
  final Subject subject;
  final int startAge;
  final int endAge;

  const ProfectionTimelineRequest({
    required this.subject,
    required this.startAge,
    required this.endAge,
  });

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        'start_age': startAge,
        'end_age': endAge,
      };
}

// ─── Insights ─────────────────────────────────────────────────────────────────

class PetOptions {
  final String? species;
  final String? breed;
  final String? gender;

  const PetOptions({this.species, this.breed, this.gender});

  Map<String, dynamic> toJson() => {
        if (species != null) 'species': species,
        if (breed != null) 'breed': breed,
        if (gender != null) 'gender': gender,
      };
}

class PetSingleSubjectRequest {
  final Subject pet;
  final PetOptions? petOptions;
  final Subject? owner;

  const PetSingleSubjectRequest(
      {required this.pet, this.petOptions, this.owner});

  Map<String, dynamic> toJson() => {
        'pet': pet.toJson(),
        if (petOptions != null) 'pet_options': petOptions!.toJson(),
        if (owner != null) 'owner': owner!.toJson(),
      };
}

class PetCompatibilityRequest {
  final Subject pet;
  final Subject owner;
  final PetOptions? petOptions;

  const PetCompatibilityRequest(
      {required this.pet, required this.owner, this.petOptions});

  Map<String, dynamic> toJson() => {
        'pet': pet.toJson(),
        'owner': owner.toJson(),
        if (petOptions != null) 'pet_options': petOptions!.toJson(),
      };
}

class PetMultiSubjectRequest {
  final List<Subject> pets;
  final List<PetOptions>? petOptions;

  const PetMultiSubjectRequest({required this.pets, this.petOptions});

  Map<String, dynamic> toJson() => {
        'pets': pets.map((p) => p.toJson()).toList(),
        if (petOptions != null)
          'pet_options': petOptions!.map((o) => o.toJson()).toList(),
      };
}

class MarketTimingRequest {
  final Map<String, dynamic> dateRange;
  final String? market;
  final Map<String, dynamic>? options;

  const MarketTimingRequest(
      {required this.dateRange, this.market, this.options});

  Map<String, dynamic> toJson() => {
        'date_range': dateRange,
        if (market != null) 'market': market,
        if (options != null) 'options': options,
      };
}

class CryptoTimingRequest {
  final Map<String, dynamic> dateRange;
  final String? crypto;
  final Map<String, dynamic>? options;

  const CryptoTimingRequest(
      {required this.dateRange, this.crypto, this.options});

  Map<String, dynamic> toJson() => {
        'date_range': dateRange,
        if (crypto != null) 'crypto': crypto,
        if (options != null) 'options': options,
      };
}

class BradleySiderographRequest {
  final Map<String, dynamic> dateRange;
  final Map<String, dynamic>? options;

  const BradleySiderographRequest({required this.dateRange, this.options});

  Map<String, dynamic> toJson() => {
        'date_range': dateRange,
        if (options != null) 'options': options,
      };
}

class ForexTimingRequest {
  final Map<String, dynamic> dateRange;
  final String? currencyPair;
  final Map<String, dynamic>? options;

  const ForexTimingRequest(
      {required this.dateRange, this.currencyPair, this.options});

  Map<String, dynamic> toJson() => {
        'date_range': dateRange,
        if (currencyPair != null) 'currency_pair': currencyPair,
        if (options != null) 'options': options,
      };
}

class GannAnalysisRequest {
  final Map<String, dynamic> dateRange;
  final Map<String, dynamic>? options;

  const GannAnalysisRequest({required this.dateRange, this.options});

  Map<String, dynamic> toJson() => {
        'date_range': dateRange,
        if (options != null) 'options': options,
      };
}

class BusinessSingleRequest {
  final Subject subject;
  final Map<String, dynamic>? options;

  const BusinessSingleRequest({required this.subject, this.options});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (options != null) 'options': options,
      };
}

class BusinessMultipleRequest {
  final List<Subject> subjects;
  final Map<String, dynamic>? options;

  const BusinessMultipleRequest({required this.subjects, this.options});

  Map<String, dynamic> toJson() => {
        'subjects': subjects.map((s) => s.toJson()).toList(),
        if (options != null) 'options': options,
      };
}

class BusinessTimingRequest {
  final Subject subject;
  final Map<String, dynamic>? dateRange;
  final Map<String, dynamic>? options;

  const BusinessTimingRequest(
      {required this.subject, this.dateRange, this.options});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (dateRange != null) 'date_range': dateRange,
        if (options != null) 'options': options,
      };
}

class PersonalTradingRequest {
  final Subject? subject;
  final Map<String, dynamic>? options;

  const PersonalTradingRequest({this.subject, this.options});

  Map<String, dynamic> toJson() => {
        if (subject != null) 'subject': subject!.toJson(),
        if (options != null) 'options': options,
      };
}

// ─── Glossary ─────────────────────────────────────────────────────────────────

class CitySearchParams {
  final String? search;
  final String? countryCode;
  final String? sortBy;
  final String? sortOrder;
  final int? limit;
  final int? offset;

  const CitySearchParams({
    this.search,
    this.countryCode,
    this.sortBy,
    this.sortOrder,
    this.limit,
    this.offset,
  });

  Map<String, dynamic> toQueryParams() => {
        if (search != null) 'search': search,
        if (countryCode != null) 'country_code': countryCode,
        if (sortBy != null) 'sort_by': sortBy,
        if (sortOrder != null) 'sort_order': sortOrder,
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,
      };
}

// ─── Tarot request models ─────────────────────────────────────────────────────

class DrawCardsRequest {
  final int? count;
  final String? spread;
  final String? context;

  const DrawCardsRequest({this.count, this.spread, this.context});

  Map<String, dynamic> toJson() => {
        if (count != null) 'count': count,
        if (spread != null) 'spread': spread,
        if (context != null) 'context': context,
      };
}

class TarotReportRequest {
  final Subject subject;
  final Map<String, dynamic>? options;

  const TarotReportRequest({required this.subject, this.options});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (options != null) 'options': options,
      };
}

class TarotNatalReportRequest {
  final Subject subject;
  final Map<String, dynamic>? options;

  const TarotNatalReportRequest({required this.subject, this.options});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (options != null) 'options': options,
      };
}

class BirthCardFlexibleRequest {
  final Subject? subject;
  final Map<String, dynamic>? birthData;

  const BirthCardFlexibleRequest({this.subject, this.birthData});

  Map<String, dynamic> toJson() => {
        if (subject != null) 'subject': subject!.toJson(),
        if (birthData != null) 'birth_data': birthData,
      };
}

class QuintessenceRequest {
  final List<Map<String, dynamic>> cards;
  final Map<String, dynamic>? options;

  const QuintessenceRequest({required this.cards, this.options});

  Map<String, dynamic> toJson() => {
        'cards': cards,
        if (options != null) 'options': options,
      };
}

class ElementalDignitiesRequest {
  final List<Map<String, dynamic>> cards;
  final Map<String, dynamic>? options;

  const ElementalDignitiesRequest({required this.cards, this.options});

  Map<String, dynamic> toJson() => {
        'cards': cards,
        if (options != null) 'options': options,
      };
}

class TimingAnalysisRequest {
  final Subject subject;
  final Map<String, dynamic>? dateRange;
  final Map<String, dynamic>? options;

  const TimingAnalysisRequest(
      {required this.subject, this.dateRange, this.options});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (dateRange != null) 'date_range': dateRange,
        if (options != null) 'options': options,
      };
}

class OptimalTimesRequest {
  final Subject subject;
  final String? goal;
  final Map<String, dynamic>? dateRange;
  final Map<String, dynamic>? options;

  const OptimalTimesRequest(
      {required this.subject, this.goal, this.dateRange, this.options});

  Map<String, dynamic> toJson() => {
        'subject': subject.toJson(),
        if (goal != null) 'goal': goal,
        if (dateRange != null) 'date_range': dateRange,
        if (options != null) 'options': options,
      };
}

class TarotTransitReportRequest {
  final Subject natalSubject;
  final DateTimeLocation? transitDatetime;
  final Map<String, dynamic>? options;

  const TarotTransitReportRequest(
      {required this.natalSubject, this.transitDatetime, this.options});

  Map<String, dynamic> toJson() => {
        'natal_subject': natalSubject.toJson(),
        if (transitDatetime != null)
          'transit_datetime': transitDatetime!.toJson(),
        if (options != null) 'options': options,
      };
}
