import 'package:astroapi/astroapi.dart';
import 'package:test/test.dart';

import '../../helpers/test_helpers.dart';

void main() {
  late TraditionalClient client;
  late MockHttpHelper mockHttp;
  AstrologyClient? realClient;

  final tradReq = TraditionalAnalysisRequest(subject: testSubject);

  setUp(() {
    mockHttp = MockHttpHelper();
    client = TraditionalClient(mockHttp);
    realClient = createRealClient();
  });

  group('TraditionalClient (mock)', () {
    test('getAnalysis calls POST /api/v3/traditional/analysis', () async {
      stubPost(mockHttp, '/api/v3/traditional/analysis');
      await client.getAnalysis(tradReq);
      verifyPost(mockHttp, '/api/v3/traditional/analysis');
    });

    test('getDignities calls POST /api/v3/traditional/dignities', () async {
      stubPost(mockHttp, '/api/v3/traditional/dignities');
      await client.getDignities(tradReq);
      verifyPost(mockHttp, '/api/v3/traditional/dignities');
    });

    test('getReceptions calls POST /api/v3/traditional/receptions', () async {
      stubPost(mockHttp, '/api/v3/traditional/receptions');
      await client.getReceptions(tradReq);
      verifyPost(mockHttp, '/api/v3/traditional/receptions');
    });

    test('getAlmutens calls POST /api/v3/traditional/almutens', () async {
      stubPost(mockHttp, '/api/v3/traditional/almutens');
      await client.getAlmutens(tradReq);
      verifyPost(mockHttp, '/api/v3/traditional/almutens');
    });

    test('getLots calls POST /api/v3/traditional/lots', () async {
      stubPost(mockHttp, '/api/v3/traditional/lots');
      await client.getLots(tradReq);
      verifyPost(mockHttp, '/api/v3/traditional/lots');
    });

    test('getAnnualProfection calls POST /api/v3/traditional/annual-profection',
        () async {
      stubPost(mockHttp, '/api/v3/traditional/annual-profection');
      await client.getAnnualProfection(
        AnnualProfectionRequest(subject: testSubject),
      );
      verifyPost(mockHttp, '/api/v3/traditional/annual-profection');
    });

    test(
        'getProfectionTimeline calls POST /api/v3/traditional/profection-timeline',
        () async {
      stubPost(mockHttp, '/api/v3/traditional/profection-timeline');
      await client.getProfectionTimeline(
        ProfectionTimelineRequest(
          subject: testSubject,
          startAge: 25,
          endAge: 35,
        ),
      );
      verifyPost(mockHttp, '/api/v3/traditional/profection-timeline');
    });

    test('getFirdariaTimeline calls POST /api/v3/traditional/firdaria-timeline',
        () async {
      stubPost(mockHttp, '/api/v3/traditional/firdaria-timeline');
      await client.getFirdariaTimeline(tradReq);
      verifyPost(mockHttp, '/api/v3/traditional/firdaria-timeline');
    });

    test('getBoundsAnalysis calls POST /api/v3/traditional/bounds', () async {
      stubPost(mockHttp, '/api/v3/traditional/bounds');
      await client.getBoundsAnalysis(tradReq);
      verifyPost(mockHttp, '/api/v3/traditional/bounds');
    });

    test('getDecanates calls POST /api/v3/traditional/decanates', () async {
      stubPost(mockHttp, '/api/v3/traditional/decanates');
      await client.getDecanates(tradReq);
      verifyPost(mockHttp, '/api/v3/traditional/decanates');
    });
  });

  group('TraditionalClient (integration)',
      skip: !isIntegrationMode ? 'No API key' : null, () {
    test('getAnalysis returns valid response', () async {
      final result = await realClient!.traditional.getAnalysis(tradReq);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getDignities returns valid response', () async {
      final result = await realClient!.traditional.getDignities(tradReq);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getAnnualProfection returns valid response', () async {
      final result = await realClient!.traditional.getAnnualProfection(
        AnnualProfectionRequest(subject: testSubject),
      );
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));
  });
}
