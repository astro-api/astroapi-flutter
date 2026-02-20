import 'package:astroapi/astroapi.dart';
import 'package:test/test.dart';

import '../../helpers/test_helpers.dart';

void main() {
  late HoroscopeClient client;
  late MockHttpHelper mockHttp;
  AstrologyClient? realClient;

  final personalReq = PersonalHoroscopeRequest(subject: testSubject);
  final signReq = SunSignHoroscopeRequest(sign: SunSign.aries);
  final weeklyReq = SunSignWeeklyHoroscopeRequest(sign: SunSign.aries);
  final monthlyReq = SunSignMonthlyHoroscopeRequest(sign: SunSign.aries);
  final yearlyReq = SunSignYearlyHoroscopeRequest(sign: SunSign.aries);
  final chineseReq = ChineseHoroscopeRequest(
    subject: testChineseHoroscopeSubject,
  );

  setUp(() {
    mockHttp = MockHttpHelper();
    client = HoroscopeClient(mockHttp);
    realClient = createRealClient();
  });

  group('HoroscopeClient (mock)', () {
    test('getPersonalDailyHoroscope', () async {
      stubPost(mockHttp, '/api/v3/horoscope/personal/daily');
      await client.getPersonalDailyHoroscope(personalReq);
      verifyPost(mockHttp, '/api/v3/horoscope/personal/daily');
    });

    test('getPersonalDailyHoroscopeText', () async {
      stubPost(mockHttp, '/api/v3/horoscope/personal/daily/text');
      await client.getPersonalDailyHoroscopeText(personalReq);
      verifyPost(mockHttp, '/api/v3/horoscope/personal/daily/text');
    });

    test('getPersonalWeeklyHoroscope', () async {
      stubPost(mockHttp, '/api/v3/horoscope/personal/weekly');
      await client.getPersonalWeeklyHoroscope(personalReq);
      verifyPost(mockHttp, '/api/v3/horoscope/personal/weekly');
    });

    test('getPersonalWeeklyHoroscopeText', () async {
      stubPost(mockHttp, '/api/v3/horoscope/personal/weekly/text');
      await client.getPersonalWeeklyHoroscopeText(personalReq);
      verifyPost(mockHttp, '/api/v3/horoscope/personal/weekly/text');
    });

    test('getPersonalMonthlyHoroscope', () async {
      stubPost(mockHttp, '/api/v3/horoscope/personal/monthly');
      await client.getPersonalMonthlyHoroscope(personalReq);
      verifyPost(mockHttp, '/api/v3/horoscope/personal/monthly');
    });

    test('getPersonalMonthlyHoroscopeText', () async {
      stubPost(mockHttp, '/api/v3/horoscope/personal/monthly/text');
      await client.getPersonalMonthlyHoroscopeText(personalReq);
      verifyPost(mockHttp, '/api/v3/horoscope/personal/monthly/text');
    });

    test('getPersonalYearlyHoroscope', () async {
      stubPost(mockHttp, '/api/v3/horoscope/personal/yearly');
      await client.getPersonalYearlyHoroscope(personalReq);
      verifyPost(mockHttp, '/api/v3/horoscope/personal/yearly');
    });

    test('getPersonalYearlyHoroscopeText', () async {
      stubPost(mockHttp, '/api/v3/horoscope/personal/yearly/text');
      await client.getPersonalYearlyHoroscopeText(personalReq);
      verifyPost(mockHttp, '/api/v3/horoscope/personal/yearly/text');
    });

    test('getSignDailyHoroscope', () async {
      stubPost(mockHttp, '/api/v3/horoscope/sign/daily');
      await client.getSignDailyHoroscope(signReq);
      verifyPost(mockHttp, '/api/v3/horoscope/sign/daily');
    });

    test('getSignDailyHoroscopeText', () async {
      stubPost(mockHttp, '/api/v3/horoscope/sign/daily/text');
      await client.getSignDailyHoroscopeText(signReq);
      verifyPost(mockHttp, '/api/v3/horoscope/sign/daily/text');
    });

    test('getSignWeeklyHoroscope', () async {
      stubPost(mockHttp, '/api/v3/horoscope/sign/weekly');
      await client.getSignWeeklyHoroscope(weeklyReq);
      verifyPost(mockHttp, '/api/v3/horoscope/sign/weekly');
    });

    test('getSignWeeklyHoroscopeText', () async {
      stubPost(mockHttp, '/api/v3/horoscope/sign/weekly/text');
      await client.getSignWeeklyHoroscopeText(weeklyReq);
      verifyPost(mockHttp, '/api/v3/horoscope/sign/weekly/text');
    });

    test('getSignMonthlyHoroscope', () async {
      stubPost(mockHttp, '/api/v3/horoscope/sign/monthly');
      await client.getSignMonthlyHoroscope(monthlyReq);
      verifyPost(mockHttp, '/api/v3/horoscope/sign/monthly');
    });

    test('getSignMonthlyHoroscopeText', () async {
      stubPost(mockHttp, '/api/v3/horoscope/sign/monthly/text');
      await client.getSignMonthlyHoroscopeText(monthlyReq);
      verifyPost(mockHttp, '/api/v3/horoscope/sign/monthly/text');
    });

    test('getSignYearlyHoroscope', () async {
      stubPost(mockHttp, '/api/v3/horoscope/sign/yearly');
      await client.getSignYearlyHoroscope(yearlyReq);
      verifyPost(mockHttp, '/api/v3/horoscope/sign/yearly');
    });

    test('getSignYearlyHoroscopeText', () async {
      stubPost(mockHttp, '/api/v3/horoscope/sign/yearly/text');
      await client.getSignYearlyHoroscopeText(yearlyReq);
      verifyPost(mockHttp, '/api/v3/horoscope/sign/yearly/text');
    });

    test('getChineseHoroscope', () async {
      stubPost(mockHttp, '/api/v3/horoscope/chinese/bazi');
      await client.getChineseHoroscope(chineseReq);
      verifyPost(mockHttp, '/api/v3/horoscope/chinese/bazi');
    });
  });

  group('HoroscopeClient (integration)',
      skip: !isIntegrationMode ? 'No API key' : null, () {
    test('getPersonalDailyHoroscope returns valid response', () async {
      final result =
          await realClient!.horoscope.getPersonalDailyHoroscope(personalReq);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getSignDailyHoroscope returns valid response', () async {
      final result = await realClient!.horoscope.getSignDailyHoroscope(signReq);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getChineseHoroscope returns valid response', () async {
      final result =
          await realClient!.horoscope.getChineseHoroscope(chineseReq);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));
  });
}
