import 'dart:io';

import 'package:astroapi/astroapi.dart';
import 'package:mocktail/mocktail.dart';

// ─── Mock ────────────────────────────────────────────────────────────────────
class MockHttpHelper extends Mock implements HttpHelper {}

// ─── Environment Detection ───────────────────────────────────────────────────
final String? _envApiKey = Platform.environment['ASTROLOGY_API_KEY'];
final bool isIntegrationMode = _envApiKey != null && _envApiKey!.isNotEmpty;

AstrologyClient? createRealClient() {
  if (!isIntegrationMode) return null;
  return AstrologyClient(
    AstrologyClientConfig(
      apiKey: _envApiKey,
      timeout: 30000,
      retry: RetryConfig(attempts: 2, delayMs: 1000),
    ),
  );
}

// ─── Shared Fixtures ─────────────────────────────────────────────────────────
final testSubject = Subject(
  name: 'Test User',
  birthData: BirthData(
    year: 1990,
    month: 5,
    day: 11,
    hour: 14,
    minute: 30,
    city: 'London',
    countryCode: 'GB',
  ),
);

final testSubject2 = Subject(
  name: 'Test User 2',
  birthData: BirthData(
    year: 1992,
    month: 8,
    day: 22,
    hour: 10,
    minute: 15,
    city: 'New York',
    countryCode: 'US',
  ),
);

final testDateTimeLocation = DateTimeLocation(
  year: 2024,
  month: 6,
  day: 21,
  hour: 12,
  minute: 0,
  city: 'London',
  countryCode: 'GB',
);

final testChineseSubject = ChineseSubject(
  name: 'Test Chinese',
  birthData: ChineseBirthData(
    year: 1990,
    month: 5,
    day: 11,
    hour: 14,
  ),
);

final testChineseHoroscopeSubject = ChineseHoroscopeSubject(
  name: 'Test Chinese Horoscope',
  birthData: ChineseHoroscopeSubjectBirthData(
    year: 1990,
    month: 5,
    day: 11,
  ),
);

final testFixedStarsConfig = FixedStarsConfig(
  presets: [FixedStarPresetName.essential],
);

// ─── Mock Responses ──────────────────────────────────────────────────────────
final mockGenericResponse = <String, dynamic>{'status': 'ok'};
const mockSvgResponse = '<svg xmlns="http://www.w3.org/2000/svg"></svg>';

final mockPositionsData = <String, dynamic>{
  'positions': [
    {
      'name': 'Sun',
      'sign': 'Taurus',
      'degree': 20.5,
      'retrograde': false,
    },
    {
      'name': 'Moon',
      'sign': 'Scorpio',
      'degree': 15.3,
      'retrograde': false,
    },
  ]
};

final mockAspectsData = <String, dynamic>{
  'aspects': [
    {
      'planet1': 'Sun',
      'planet2': 'Moon',
      'aspect': 'opposition',
      'orb': 5.2,
    },
  ]
};

final mockHouseCuspsData = <String, dynamic>{
  'house_cusps': [
    {'house': 1, 'sign': 'Virgo', 'degree': 15.0},
  ]
};

// ─── Stub Helpers ────────────────────────────────────────────────────────────
void stubPost(
  MockHttpHelper mockHttp,
  String path, [
  Map<String, dynamic>? response,
]) {
  when(() => mockHttp.post<Map<String, dynamic>>(
        path,
        any(),
        options: any(named: 'options'),
      )).thenAnswer((_) async => response ?? mockGenericResponse);
}

void stubGet(
  MockHttpHelper mockHttp,
  String path, [
  Map<String, dynamic>? response,
]) {
  when(() => mockHttp.get<Map<String, dynamic>>(
        path,
        options: any(named: 'options'),
      )).thenAnswer((_) async => response ?? mockGenericResponse);
}

void stubPostString(
  MockHttpHelper mockHttp,
  String path, [
  String? response,
]) {
  when(() => mockHttp.post<String>(
        path,
        any(),
        options: any(named: 'options'),
      )).thenAnswer((_) async => response ?? mockSvgResponse);
}

void verifyPost(MockHttpHelper mockHttp, String path) {
  verify(() => mockHttp.post<Map<String, dynamic>>(
        path,
        any(),
        options: any(named: 'options'),
      )).called(1);
}

void verifyGet(MockHttpHelper mockHttp, String path) {
  verify(() => mockHttp.get<Map<String, dynamic>>(
        path,
        options: any(named: 'options'),
      )).called(1);
}

void verifyPostString(MockHttpHelper mockHttp, String path) {
  verify(() => mockHttp.post<String>(
        path,
        any(),
        options: any(named: 'options'),
      )).called(1);
}
