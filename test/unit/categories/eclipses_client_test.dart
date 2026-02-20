import 'package:astroapi/astroapi.dart';
import 'package:test/test.dart';

import '../../helpers/test_helpers.dart';

void main() {
  late EclipsesClient client;
  late MockHttpHelper mockHttp;
  AstrologyClient? realClient;

  setUp(() {
    mockHttp = MockHttpHelper();
    client = EclipsesClient(mockHttp);
    realClient = createRealClient();
  });

  group('EclipsesClient (mock)', () {
    test('getUpcoming calls GET /api/v3/eclipses/upcoming', () async {
      stubGet(mockHttp, '/api/v3/eclipses/upcoming');
      await client.getUpcoming();
      verifyGet(mockHttp, '/api/v3/eclipses/upcoming');
    });

    test('getUpcoming with params calls correct endpoint', () async {
      stubGet(mockHttp, '/api/v3/eclipses/upcoming');
      await client.getUpcoming(params: UpcomingEclipsesParams(count: 5));
      verifyGet(mockHttp, '/api/v3/eclipses/upcoming');
    });

    test('checkNatal calls POST /api/v3/eclipses/natal-check', () async {
      stubPost(mockHttp, '/api/v3/eclipses/natal-check');
      await client.checkNatal(EclipseNatalCheckRequest(subject: testSubject));
      verifyPost(mockHttp, '/api/v3/eclipses/natal-check');
    });

    test('getInterpretation calls POST /api/v3/eclipses/interpretation',
        () async {
      stubPost(mockHttp, '/api/v3/eclipses/interpretation');
      await client.getInterpretation(
        EclipseInterpretationRequest(
          eclipse: {'type': 'solar', 'date': '2024-04-08'},
        ),
      );
      verifyPost(mockHttp, '/api/v3/eclipses/interpretation');
    });
  });

  group('EclipsesClient (integration)',
      skip: !isIntegrationMode ? 'No API key' : null, () {
    test('getUpcoming returns valid response', () async {
      final result = await realClient!.eclipses.getUpcoming();
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('checkNatal returns valid response', () async {
      final result = await realClient!.eclipses.checkNatal(
        EclipseNatalCheckRequest(subject: testSubject),
      );
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));
  });
}
