import 'package:astroapi/astroapi.dart';
import 'package:test/test.dart';

import '../../helpers/test_helpers.dart';

void main() {
  late ChineseClient client;
  late MockHttpHelper mockHttp;
  AstrologyClient? realClient;

  setUp(() {
    mockHttp = MockHttpHelper();
    client = ChineseClient(mockHttp);
    realClient = createRealClient();
  });

  group('ChineseClient (mock)', () {
    test('getBaZi calls POST /api/v3/chinese/bazi', () async {
      stubPost(mockHttp, '/api/v3/chinese/bazi');
      await client.getBaZi(BaZiRequest(subject: testChineseSubject));
      verifyPost(mockHttp, '/api/v3/chinese/bazi');
    });

    test('getLuckPillars calls POST /api/v3/chinese/luck-pillars', () async {
      stubPost(mockHttp, '/api/v3/chinese/luck-pillars');
      await client
          .getLuckPillars(LuckPillarsRequest(subject: testChineseSubject));
      verifyPost(mockHttp, '/api/v3/chinese/luck-pillars');
    });

    test('getCompatibility calls POST /api/v3/chinese/compatibility', () async {
      stubPost(mockHttp, '/api/v3/chinese/compatibility');
      await client.getCompatibility({
        'subject1': testChineseSubject.toJson(),
        'subject2': testChineseSubject.toJson(),
      });
      verifyPost(mockHttp, '/api/v3/chinese/compatibility');
    });

    test('getYearlyForecast calls POST /api/v3/chinese/yearly-forecast',
        () async {
      stubPost(mockHttp, '/api/v3/chinese/yearly-forecast');
      await client.getYearlyForecast(
        ChineseYearlyRequest(subject: testChineseSubject, year: 2024),
      );
      verifyPost(mockHttp, '/api/v3/chinese/yearly-forecast');
    });

    test('getMingGua calls POST /api/v3/chinese/ming-gua', () async {
      stubPost(mockHttp, '/api/v3/chinese/ming-gua');
      await client.getMingGua({'year': 1990, 'gender': 'male'});
      verifyPost(mockHttp, '/api/v3/chinese/ming-gua');
    });

    test('getSolarTerms calls GET /api/v3/chinese/calendar/solar-terms/2024',
        () async {
      stubGet(mockHttp, '/api/v3/chinese/calendar/solar-terms/2024');
      await client.getSolarTerms(2024);
      verifyGet(mockHttp, '/api/v3/chinese/calendar/solar-terms/2024');
    });

    test('getElementsBalance calls GET /api/v3/chinese/elements/balance/2024',
        () async {
      stubGet(mockHttp, '/api/v3/chinese/elements/balance/2024');
      await client.getElementsBalance(2024);
      verifyGet(mockHttp, '/api/v3/chinese/elements/balance/2024');
    });

    test('getZodiac calls GET /api/v3/chinese/zodiac/dragon', () async {
      stubGet(mockHttp, '/api/v3/chinese/zodiac/dragon');
      await client.getZodiac('dragon');
      verifyGet(mockHttp, '/api/v3/chinese/zodiac/dragon');
    });
  });

  group('ChineseClient (integration)',
      skip: !isIntegrationMode ? 'No API key' : null, () {
    test('getBaZi returns valid response', () async {
      final result = await realClient!.chinese.getBaZi(
        BaZiRequest(subject: testChineseSubject),
      );
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getSolarTerms returns valid response', () async {
      final result = await realClient!.chinese.getSolarTerms(2024);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getZodiac returns valid response', () async {
      final result = await realClient!.chinese.getZodiac('dragon');
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));
  });
}
