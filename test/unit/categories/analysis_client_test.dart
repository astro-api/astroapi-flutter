import 'package:astroapi/astroapi.dart';
import 'package:test/test.dart';

import '../../helpers/test_helpers.dart';

void main() {
  late AnalysisClient client;
  late MockHttpHelper mockHttp;
  AstrologyClient? realClient;

  final natalChartReq = NatalChartRequest(subject: testSubject);
  final natalTransitReq = NatalTransitRequest(
    natalSubject: testSubject,
    transitDatetime: testDateTimeLocation,
  );
  final compatReq = CompatibilityRequest(
    subjects: [testSubject, testSubject2],
  );

  setUp(() {
    mockHttp = MockHttpHelper();
    client = AnalysisClient(mockHttp);
    realClient = createRealClient();
  });

  group('AnalysisClient (mock)', () {
    test('getNatalReport calls POST /api/v3/analysis/natal-report', () async {
      stubPost(mockHttp, '/api/v3/analysis/natal-report');
      await client.getNatalReport(NatalReportRequest(subject: testSubject));
      verifyPost(mockHttp, '/api/v3/analysis/natal-report');
    });

    test('getSynastryReport calls POST /api/v3/analysis/synastry-report',
        () async {
      stubPost(mockHttp, '/api/v3/analysis/synastry-report');
      await client.getSynastryReport(
        SynastryReportRequest(subject1: testSubject, subject2: testSubject2),
      );
      verifyPost(mockHttp, '/api/v3/analysis/synastry-report');
    });

    test('getCompositeReport calls POST /api/v3/analysis/composite-report',
        () async {
      stubPost(mockHttp, '/api/v3/analysis/composite-report');
      await client.getCompositeReport(
        CompositeReportRequest(subject1: testSubject, subject2: testSubject2),
      );
      verifyPost(mockHttp, '/api/v3/analysis/composite-report');
    });

    test('getCompatibility calls POST /api/v3/analysis/compatibility',
        () async {
      stubPost(mockHttp, '/api/v3/analysis/compatibility');
      await client.getCompatibility(compatReq);
      verifyPost(mockHttp, '/api/v3/analysis/compatibility');
    });

    test(
        'getCompatibilityScore calls POST /api/v3/analysis/compatibility-score',
        () async {
      stubPost(mockHttp, '/api/v3/analysis/compatibility-score');
      await client.getCompatibilityScore(compatReq);
      verifyPost(mockHttp, '/api/v3/analysis/compatibility-score');
    });

    test('getRelationship calls POST /api/v3/analysis/relationship', () async {
      stubPost(mockHttp, '/api/v3/analysis/relationship');
      await client.getRelationship(
        RelationshipAnalysisRequest(subjects: [testSubject, testSubject2]),
      );
      verifyPost(mockHttp, '/api/v3/analysis/relationship');
    });

    test('getRelationshipScore calls POST /api/v3/analysis/relationship-score',
        () async {
      stubPost(mockHttp, '/api/v3/analysis/relationship-score');
      await client.getRelationshipScore(compatReq);
      verifyPost(mockHttp, '/api/v3/analysis/relationship-score');
    });

    test('getTransitReport calls POST /api/v3/analysis/transit-report',
        () async {
      stubPost(mockHttp, '/api/v3/analysis/transit-report');
      await client.getTransitReport(natalTransitReq);
      verifyPost(mockHttp, '/api/v3/analysis/transit-report');
    });

    test(
        'getNatalTransitReport calls POST /api/v3/analysis/natal-transit-report',
        () async {
      stubPost(mockHttp, '/api/v3/analysis/natal-transit-report');
      await client.getNatalTransitReport(natalTransitReq);
      verifyPost(mockHttp, '/api/v3/analysis/natal-transit-report');
    });

    test('getProgressionReport calls POST /api/v3/analysis/progression-report',
        () async {
      stubPost(mockHttp, '/api/v3/analysis/progression-report');
      await client.getProgressionReport(
        ProgressionReportRequest(
          subject: testSubject,
          targetDate: '2024-06-21',
          progressionType: ProgressionType.secondary,
        ),
      );
      verifyPost(mockHttp, '/api/v3/analysis/progression-report');
    });

    test('getDirectionReport calls POST /api/v3/analysis/direction-report',
        () async {
      stubPost(mockHttp, '/api/v3/analysis/direction-report');
      await client.getDirectionReport(
        DirectionReportRequest(subject: testSubject, targetDate: '2024-06-21'),
      );
      verifyPost(mockHttp, '/api/v3/analysis/direction-report');
    });

    test('getSolarReturnReport calls POST /api/v3/analysis/solar-return-report',
        () async {
      stubPost(mockHttp, '/api/v3/analysis/solar-return-report');
      await client.getSolarReturnReport(
        SolarReturnReportRequest(subject: testSubject, returnYear: 2024),
      );
      verifyPost(mockHttp, '/api/v3/analysis/solar-return-report');
    });

    test('getSolarReturnTransitReport calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/analysis/solar-return-transit-report');
      await client.getSolarReturnTransitReport(
        SolarReturnTransitRequest(
          subject: testSubject,
          returnYear: 2024,
          transitDatetime: testDateTimeLocation,
        ),
      );
      verifyPost(mockHttp, '/api/v3/analysis/solar-return-transit-report');
    });

    test('getLunarReturnReport calls POST /api/v3/analysis/lunar-return-report',
        () async {
      stubPost(mockHttp, '/api/v3/analysis/lunar-return-report');
      await client.getLunarReturnReport(
        LunarReturnReportRequest(
            subject: testSubject, returnDate: '2024-01-15'),
      );
      verifyPost(mockHttp, '/api/v3/analysis/lunar-return-report');
    });

    test('getLunarReturnTransitReport calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/analysis/lunar-return-transit-report');
      await client.getLunarReturnTransitReport(
        LunarReturnTransitRequest(
          subject: testSubject,
          returnDate: '2024-01-15',
          transitDatetime: testDateTimeLocation,
        ),
      );
      verifyPost(mockHttp, '/api/v3/analysis/lunar-return-transit-report');
    });

    test('getVenusReturnReport calls POST /api/v3/analysis/venus-return-report',
        () async {
      stubPost(mockHttp, '/api/v3/analysis/venus-return-report');
      await client.getVenusReturnReport(
        VenusReturnRequest(subject: testSubject, returnYear: 2024),
      );
      verifyPost(mockHttp, '/api/v3/analysis/venus-return-report');
    });

    test('getVenusReturnTransitReport calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/analysis/venus-return-transit-report');
      await client.getVenusReturnTransitReport(
        VenusReturnRequest(subject: testSubject, returnYear: 2024),
      );
      verifyPost(mockHttp, '/api/v3/analysis/venus-return-transit-report');
    });

    test('getLunarAnalysis calls POST /api/v3/analysis/lunar-analysis',
        () async {
      stubPost(mockHttp, '/api/v3/analysis/lunar-analysis');
      await client.getLunarAnalysis(
        LunarAnalysisRequest(datetimeLocation: testDateTimeLocation),
      );
      verifyPost(mockHttp, '/api/v3/analysis/lunar-analysis');
    });

    test('getPsychological calls POST /api/v3/analysis/psychological',
        () async {
      stubPost(mockHttp, '/api/v3/analysis/psychological');
      await client.getPsychological(natalChartReq);
      verifyPost(mockHttp, '/api/v3/analysis/psychological');
    });

    test('getKarmic calls POST /api/v3/analysis/karmic', () async {
      stubPost(mockHttp, '/api/v3/analysis/karmic');
      await client.getKarmic(natalChartReq);
      verifyPost(mockHttp, '/api/v3/analysis/karmic');
    });

    test('getSpiritual calls POST /api/v3/analysis/spiritual', () async {
      stubPost(mockHttp, '/api/v3/analysis/spiritual');
      await client.getSpiritual(natalChartReq);
      verifyPost(mockHttp, '/api/v3/analysis/spiritual');
    });

    test('getCareer calls POST /api/v3/analysis/career', () async {
      stubPost(mockHttp, '/api/v3/analysis/career');
      await client.getCareer(natalChartReq);
      verifyPost(mockHttp, '/api/v3/analysis/career');
    });

    test('getVocational calls POST /api/v3/analysis/vocational', () async {
      stubPost(mockHttp, '/api/v3/analysis/vocational');
      await client.getVocational(natalChartReq);
      verifyPost(mockHttp, '/api/v3/analysis/vocational');
    });

    test('getHealth calls POST /api/v3/analysis/health', () async {
      stubPost(mockHttp, '/api/v3/analysis/health');
      await client.getHealth(natalChartReq);
      verifyPost(mockHttp, '/api/v3/analysis/health');
    });

    test('getPredictive calls POST /api/v3/analysis/predictive', () async {
      stubPost(mockHttp, '/api/v3/analysis/predictive');
      await client.getPredictive(natalTransitReq);
      verifyPost(mockHttp, '/api/v3/analysis/predictive');
    });

    test('getRelocation calls POST /api/v3/analysis/relocation', () async {
      stubPost(mockHttp, '/api/v3/analysis/relocation');
      await client.getRelocation(
        RelocationChartRequest(
          subject: testSubject,
          newLocation: {'city': 'Tokyo', 'country_code': 'JP'},
        ),
      );
      verifyPost(mockHttp, '/api/v3/analysis/relocation');
    });
  });

  group('AnalysisClient (integration)',
      skip: !isIntegrationMode ? 'No API key' : null, () {
    test('getNatalReport returns valid response', () async {
      final result = await realClient!.analysis.getNatalReport(
        NatalReportRequest(subject: testSubject),
      );
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getCompatibility returns valid response', () async {
      final result = await realClient!.analysis.getCompatibility(compatReq);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getPsychological returns valid response', () async {
      final result = await realClient!.analysis.getPsychological(natalChartReq);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getCareer returns valid response', () async {
      final result = await realClient!.analysis.getCareer(natalChartReq);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getTransitReport returns valid response', () async {
      final result =
          await realClient!.analysis.getTransitReport(natalTransitReq);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getLunarAnalysis returns valid response', () async {
      final result = await realClient!.analysis.getLunarAnalysis(
        LunarAnalysisRequest(datetimeLocation: testDateTimeLocation),
      );
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getRelocation returns valid response', () async {
      final result = await realClient!.analysis.getRelocation(
        RelocationChartRequest(
          subject: testSubject,
          newLocation: {'city': 'Tokyo', 'country_code': 'JP'},
        ),
      );
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));
  });
}
