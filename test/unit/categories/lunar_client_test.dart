import 'package:astroapi/astroapi.dart';
import 'package:test/test.dart';

import '../../helpers/test_helpers.dart';

void main() {
  late LunarClient client;
  late MockHttpHelper mockHttp;
  AstrologyClient? realClient;

  setUp(() {
    mockHttp = MockHttpHelper();
    client = LunarClient(mockHttp);
    realClient = createRealClient();
  });

  group('LunarClient (mock)', () {
    test('getCalendar calls GET /api/v3/lunar/calendar/2024', () async {
      stubGet(mockHttp, '/api/v3/lunar/calendar/2024');
      await client.getCalendar(2024);
      verifyGet(mockHttp, '/api/v3/lunar/calendar/2024');
    });

    test('getCalendar with params calls correct endpoint', () async {
      stubGet(mockHttp, '/api/v3/lunar/calendar/2024');
      await client.getCalendar(2024, params: LunarCalendarParams(month: 6));
      verifyGet(mockHttp, '/api/v3/lunar/calendar/2024');
    });

    test('getPhases calls POST /api/v3/lunar/phases', () async {
      stubPost(mockHttp, '/api/v3/lunar/phases');
      await client.getPhases(LunarPhasesRequest(year: 2024));
      verifyPost(mockHttp, '/api/v3/lunar/phases');
    });

    test('getEvents calls POST /api/v3/lunar/events', () async {
      stubPost(mockHttp, '/api/v3/lunar/events');
      await client.getEvents(LunarEventsRequest(year: 2024));
      verifyPost(mockHttp, '/api/v3/lunar/events');
    });

    test('getMansions calls POST /api/v3/lunar/mansions', () async {
      stubPost(mockHttp, '/api/v3/lunar/mansions');
      await client.getMansions(
        LunarMansionsRequest(datetimeLocation: testDateTimeLocation),
      );
      verifyPost(mockHttp, '/api/v3/lunar/mansions');
    });

    test('getVoidOfCourse calls POST /api/v3/lunar/void-of-course', () async {
      stubPost(mockHttp, '/api/v3/lunar/void-of-course');
      await client.getVoidOfCourse(
        VoidOfCourseRequest(datetimeLocation: testDateTimeLocation),
      );
      verifyPost(mockHttp, '/api/v3/lunar/void-of-course');
    });
  });

  group('LunarClient (integration)',
      skip: !isIntegrationMode ? 'No API key' : null, () {
    test('getCalendar returns valid response', () async {
      final result = await realClient!.lunar.getCalendar(2024);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getPhases returns valid response', () async {
      final result = await realClient!.lunar.getPhases(
        LunarPhasesRequest(year: 2024),
      );
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getVoidOfCourse returns valid response', () async {
      final result = await realClient!.lunar.getVoidOfCourse(
        VoidOfCourseRequest(datetimeLocation: testDateTimeLocation),
      );
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));
  });
}
