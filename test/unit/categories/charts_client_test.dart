import 'package:astroapi/astroapi.dart';
import 'package:test/test.dart';

import '../../helpers/test_helpers.dart';

void main() {
  late ChartsClient client;
  late MockHttpHelper mockHttp;
  AstrologyClient? realClient;

  setUp(() {
    mockHttp = MockHttpHelper();
    client = ChartsClient(mockHttp);
    realClient = createRealClient();
  });

  group('ChartsClient (mock)', () {
    test('getNatalChart calls POST /api/v3/charts/natal', () async {
      stubPost(mockHttp, '/api/v3/charts/natal');
      await client.getNatalChart(NatalChartRequest(subject: testSubject));
      verifyPost(mockHttp, '/api/v3/charts/natal');
    });

    test('getCompositeChart calls POST /api/v3/charts/composite', () async {
      stubPost(mockHttp, '/api/v3/charts/composite');
      await client.getCompositeChart(
        CompositeChartRequest(subject1: testSubject, subject2: testSubject2),
      );
      verifyPost(mockHttp, '/api/v3/charts/composite');
    });

    test('getSynastryChart calls POST /api/v3/charts/synastry', () async {
      stubPost(mockHttp, '/api/v3/charts/synastry');
      await client.getSynastryChart(
        SynastryChartRequest(subject1: testSubject, subject2: testSubject2),
      );
      verifyPost(mockHttp, '/api/v3/charts/synastry');
    });

    test('getTransitChart calls POST /api/v3/charts/transit', () async {
      stubPost(mockHttp, '/api/v3/charts/transit');
      await client.getTransitChart(
        TransitChartRequest(
          natalSubject: testSubject,
          transitDatetime: testDateTimeLocation,
        ),
      );
      verifyPost(mockHttp, '/api/v3/charts/transit');
    });

    test('getSolarReturnChart calls POST /api/v3/charts/solar-return',
        () async {
      stubPost(mockHttp, '/api/v3/charts/solar-return');
      await client.getSolarReturnChart(
        SolarReturnRequest(subject: testSubject, returnYear: 2024),
      );
      verifyPost(mockHttp, '/api/v3/charts/solar-return');
    });

    test('getLunarReturnChart calls POST /api/v3/charts/lunar-return',
        () async {
      stubPost(mockHttp, '/api/v3/charts/lunar-return');
      await client.getLunarReturnChart(
        LunarReturnRequest(subject: testSubject, returnDate: '2024-01-15'),
      );
      verifyPost(mockHttp, '/api/v3/charts/lunar-return');
    });

    test(
        'getSolarReturnTransits calls POST /api/v3/charts/solar-return-transits',
        () async {
      stubPost(mockHttp, '/api/v3/charts/solar-return-transits');
      await client.getSolarReturnTransits(
        SolarReturnTransitRequest(
          subject: testSubject,
          returnYear: 2024,
          transitDatetime: testDateTimeLocation,
        ),
      );
      verifyPost(mockHttp, '/api/v3/charts/solar-return-transits');
    });

    test(
        'getLunarReturnTransits calls POST /api/v3/charts/lunar-return-transits',
        () async {
      stubPost(mockHttp, '/api/v3/charts/lunar-return-transits');
      await client.getLunarReturnTransits(
        LunarReturnTransitRequest(
          subject: testSubject,
          returnDate: '2024-01-15',
          transitDatetime: testDateTimeLocation,
        ),
      );
      verifyPost(mockHttp, '/api/v3/charts/lunar-return-transits');
    });

    test('getProgressions calls POST /api/v3/charts/progressions', () async {
      stubPost(mockHttp, '/api/v3/charts/progressions');
      await client.getProgressions(
        ProgressionRequest(
          subject: testSubject,
          targetDate: '2024-06-21',
          progressionType: ProgressionType.secondary,
        ),
      );
      verifyPost(mockHttp, '/api/v3/charts/progressions');
    });

    test('getDirections calls POST /api/v3/charts/directions', () async {
      stubPost(mockHttp, '/api/v3/charts/directions');
      await client.getDirections(
        DirectionRequest(subject: testSubject, targetDate: '2024-06-21'),
      );
      verifyPost(mockHttp, '/api/v3/charts/directions');
    });

    test('getNatalTransits calls POST /api/v3/charts/natal-transits', () async {
      stubPost(mockHttp, '/api/v3/charts/natal-transits');
      await client.getNatalTransits(
        NatalTransitRequest(
          natalSubject: testSubject,
          transitDatetime: testDateTimeLocation,
        ),
      );
      verifyPost(mockHttp, '/api/v3/charts/natal-transits');
    });

    test('getVenusReturnChart calls POST /api/v3/charts/venus-return',
        () async {
      stubPost(mockHttp, '/api/v3/charts/venus-return');
      await client.getVenusReturnChart(
        VenusReturnRequest(subject: testSubject, returnYear: 2024),
      );
      verifyPost(mockHttp, '/api/v3/charts/venus-return');
    });

    test(
        'getVenusReturnTransits calls POST /api/v3/charts/venus-return-transits',
        () async {
      stubPost(mockHttp, '/api/v3/charts/venus-return-transits');
      await client.getVenusReturnTransits(
        VenusReturnRequest(subject: testSubject, returnYear: 2024),
      );
      verifyPost(mockHttp, '/api/v3/charts/venus-return-transits');
    });
  });

  group('ChartsClient (integration)',
      skip: !isIntegrationMode ? 'No API key' : null, () {
    test('getNatalChart returns valid response', () async {
      final result = await realClient!.charts.getNatalChart(
        NatalChartRequest(subject: testSubject),
      );
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getCompositeChart returns valid response', () async {
      final result = await realClient!.charts.getCompositeChart(
        CompositeChartRequest(subject1: testSubject, subject2: testSubject2),
      );
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getSynastryChart returns valid response', () async {
      final result = await realClient!.charts.getSynastryChart(
        SynastryChartRequest(subject1: testSubject, subject2: testSubject2),
      );
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getTransitChart returns valid response', () async {
      final result = await realClient!.charts.getTransitChart(
        TransitChartRequest(
          natalSubject: testSubject,
          transitDatetime: testDateTimeLocation,
        ),
      );
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getSolarReturnChart returns valid response', () async {
      final result = await realClient!.charts.getSolarReturnChart(
        SolarReturnRequest(subject: testSubject, returnYear: 2024),
      );
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getLunarReturnChart returns valid response', () async {
      final result = await realClient!.charts.getLunarReturnChart(
        LunarReturnRequest(subject: testSubject, returnDate: '2024-01-15'),
      );
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getProgressions returns valid response', () async {
      final result = await realClient!.charts.getProgressions(
        ProgressionRequest(
          subject: testSubject,
          targetDate: '2024-06-21',
          progressionType: ProgressionType.secondary,
        ),
      );
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getDirections returns valid response', () async {
      final result = await realClient!.charts.getDirections(
        DirectionRequest(subject: testSubject, targetDate: '2024-06-21'),
      );
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getNatalTransits returns valid response', () async {
      final result = await realClient!.charts.getNatalTransits(
        NatalTransitRequest(
          natalSubject: testSubject,
          transitDatetime: testDateTimeLocation,
        ),
      );
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getVenusReturnChart returns valid response', () async {
      final result = await realClient!.charts.getVenusReturnChart(
        VenusReturnRequest(subject: testSubject, returnYear: 2024),
      );
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));
  });
}
