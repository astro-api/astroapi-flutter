import 'package:astroapi/astroapi.dart';
import 'package:test/test.dart';

import '../../helpers/test_helpers.dart';

void main() {
  late EnhancedClient client;
  late MockHttpHelper mockHttp;
  AstrologyClient? realClient;

  final personalReq = PersonalAnalysisRequest(subject: testSubject);
  final globalReq = GlobalAnalysisRequest(
    datetimeLocation: testDateTimeLocation,
  );

  setUp(() {
    mockHttp = MockHttpHelper();
    client = EnhancedClient(mockHttp);
    realClient = createRealClient();
  });

  group('EnhancedClient (mock)', () {
    test('getPersonalAnalysis calls POST /api/v3/enhanced/personal-analysis',
        () async {
      stubPost(mockHttp, '/api/v3/enhanced/personal-analysis');
      await client.getPersonalAnalysis(personalReq);
      verifyPost(mockHttp, '/api/v3/enhanced/personal-analysis');
    });

    test('getGlobalAnalysis calls POST /api/v3/enhanced/global-analysis',
        () async {
      stubPost(mockHttp, '/api/v3/enhanced/global-analysis');
      await client.getGlobalAnalysis(globalReq);
      verifyPost(mockHttp, '/api/v3/enhanced/global-analysis');
    });

    test(
        'getPersonalChartAnalysis calls POST /api/v3/enhanced_charts/personal-analysis',
        () async {
      stubPost(mockHttp, '/api/v3/enhanced_charts/personal-analysis');
      await client.getPersonalChartAnalysis(personalReq);
      verifyPost(mockHttp, '/api/v3/enhanced_charts/personal-analysis');
    });

    test(
        'getGlobalChartAnalysis calls POST /api/v3/enhanced_charts/global-analysis',
        () async {
      stubPost(mockHttp, '/api/v3/enhanced_charts/global-analysis');
      await client.getGlobalChartAnalysis(globalReq);
      verifyPost(mockHttp, '/api/v3/enhanced_charts/global-analysis');
    });
  });

  group('EnhancedClient (integration)',
      skip: !isIntegrationMode ? 'No API key' : null, () {
    test('getPersonalAnalysis returns valid response', () async {
      final result =
          await realClient!.enhanced.getPersonalAnalysis(personalReq);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getGlobalAnalysis returns valid response', () async {
      final result = await realClient!.enhanced.getGlobalAnalysis(globalReq);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getPersonalChartAnalysis returns valid response', () async {
      final result =
          await realClient!.enhanced.getPersonalChartAnalysis(personalReq);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getGlobalChartAnalysis returns valid response', () async {
      final result =
          await realClient!.enhanced.getGlobalChartAnalysis(globalReq);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));
  });
}
