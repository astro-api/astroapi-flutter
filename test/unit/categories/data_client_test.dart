import 'package:astroapi/astroapi.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../helpers/test_helpers.dart';

void main() {
  late DataClient client;
  late MockHttpHelper mockHttp;
  AstrologyClient? realClient;

  final testRequest = PlanetaryPositionsRequest(subject: testSubject);
  final lunarMetricsRequest = LunarMetricsRequest(
    datetimeLocation: testDateTimeLocation,
  );
  final globalRequest = GlobalDataRequest(
    year: 2024,
    month: 1,
    day: 1,
    hour: 12,
    minute: 0,
    second: 0,
  );

  setUp(() {
    mockHttp = MockHttpHelper();
    client = DataClient(mockHttp);
    realClient = createRealClient();
  });

  group('DataClient (mock)', () {
    test('getPositions calls POST /api/v3/data/positions', () async {
      stubPost(mockHttp, '/api/v3/data/positions', mockPositionsData);

      final result = await client.getPositions(testRequest);

      expect(result.positions, hasLength(2));
      expect(result.positions[0].name, 'Sun');
      expect(result.positions[0].sign, 'Taurus');
      verifyPost(mockHttp, '/api/v3/data/positions');
    });

    test('getEnhancedPositions calls POST /api/v3/data/positions/enhanced',
        () async {
      stubPost(mockHttp, '/api/v3/data/positions/enhanced');
      await client.getEnhancedPositions(testRequest);
      verifyPost(mockHttp, '/api/v3/data/positions/enhanced');
    });

    test('getGlobalPositions calls POST /api/v3/data/global-positions',
        () async {
      stubPost(mockHttp, '/api/v3/data/global-positions');
      await client.getGlobalPositions(globalRequest);
      verifyPost(mockHttp, '/api/v3/data/global-positions');
    });

    test('getAspects calls POST /api/v3/data/aspects', () async {
      stubPost(mockHttp, '/api/v3/data/aspects', mockAspectsData);

      final result = await client.getAspects(testRequest);

      expect(result.aspects, hasLength(1));
      expect(result.aspects[0].planet1, 'Sun');
      expect(result.aspects[0].planet2, 'Moon');
      verifyPost(mockHttp, '/api/v3/data/aspects');
    });

    test('getEnhancedAspects calls POST /api/v3/data/aspects/enhanced',
        () async {
      stubPost(mockHttp, '/api/v3/data/aspects/enhanced');
      await client.getEnhancedAspects(testRequest);
      verifyPost(mockHttp, '/api/v3/data/aspects/enhanced');
    });

    test('getHouseCusps calls POST /api/v3/data/house-cusps', () async {
      stubPost(mockHttp, '/api/v3/data/house-cusps', mockHouseCuspsData);

      final result = await client.getHouseCusps(testRequest);

      expect(result.houseCusps, hasLength(1));
      expect(result.houseCusps[0].house, 1);
      verifyPost(mockHttp, '/api/v3/data/house-cusps');
    });

    test('getLunarMetrics calls POST /api/v3/data/lunar-metrics', () async {
      stubPost(mockHttp, '/api/v3/data/lunar-metrics');
      await client.getLunarMetrics(lunarMetricsRequest);
      verifyPost(mockHttp, '/api/v3/data/lunar-metrics');
    });

    test(
        'getEnhancedLunarMetrics calls POST /api/v3/data/lunar-metrics/enhanced',
        () async {
      stubPost(mockHttp, '/api/v3/data/lunar-metrics/enhanced');
      await client.getEnhancedLunarMetrics(lunarMetricsRequest);
      verifyPost(mockHttp, '/api/v3/data/lunar-metrics/enhanced');
    });

    test('getCurrentMoment calls GET /api/v3/data/now', () async {
      stubGet(mockHttp, '/api/v3/data/now');
      await client.getCurrentMoment();
      verifyGet(mockHttp, '/api/v3/data/now');
    });

    test('serializes request correctly', () async {
      Map<String, dynamic>? capturedBody;
      when(() => mockHttp.post<Map<String, dynamic>>(
            any(),
            any(),
            options: any(named: 'options'),
          )).thenAnswer((invocation) async {
        capturedBody =
            invocation.positionalArguments[1] as Map<String, dynamic>;
        return mockPositionsData;
      });

      await client.getPositions(testRequest);

      expect(capturedBody, isNotNull);
      expect(capturedBody!['subject'], isNotNull);
      final subject = capturedBody!['subject'] as Map<String, dynamic>;
      expect(subject['name'], 'Test User');
      final birthData = subject['birth_data'] as Map<String, dynamic>;
      expect(birthData['year'], 1990);
      expect(birthData['month'], 5);
    });
  });

  group('DataClient (integration)',
      skip: !isIntegrationMode ? 'No API key' : null, () {
    test('getPositions returns valid response', () async {
      final result = await realClient!.data.getPositions(testRequest);
      expect(result.positions, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getEnhancedPositions returns valid response', () async {
      final result = await realClient!.data.getEnhancedPositions(testRequest);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getGlobalPositions returns valid response', () async {
      final result = await realClient!.data.getGlobalPositions(globalRequest);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getAspects returns valid response', () async {
      final result = await realClient!.data.getAspects(testRequest);
      expect(result.aspects, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getEnhancedAspects returns valid response', () async {
      final result = await realClient!.data.getEnhancedAspects(testRequest);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getHouseCusps returns valid response', () async {
      final result = await realClient!.data.getHouseCusps(testRequest);
      expect(result.houseCusps, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getLunarMetrics returns valid response', () async {
      final result =
          await realClient!.data.getLunarMetrics(lunarMetricsRequest);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getEnhancedLunarMetrics returns valid response', () async {
      final result =
          await realClient!.data.getEnhancedLunarMetrics(lunarMetricsRequest);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getCurrentMoment returns valid response', () async {
      final result = await realClient!.data.getCurrentMoment();
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));
  });
}
