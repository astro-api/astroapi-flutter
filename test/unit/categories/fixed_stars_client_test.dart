import 'package:astroapi/astroapi.dart';
import 'package:test/test.dart';

import '../../helpers/test_helpers.dart';

void main() {
  late FixedStarsClient client;
  late MockHttpHelper mockHttp;
  AstrologyClient? realClient;

  final posReq = FixedStarsPositionsRequest(
    subject: testSubject,
    fixedStars: testFixedStarsConfig,
  );
  final conjReq = FixedStarsConjunctionsRequest(
    subject: testSubject,
    fixedStars: testFixedStarsConfig,
  );

  setUp(() {
    mockHttp = MockHttpHelper();
    client = FixedStarsClient(mockHttp);
    realClient = createRealClient();
  });

  group('FixedStarsClient (mock)', () {
    test('getPositions calls POST /api/v3/fixed-stars/positions', () async {
      stubPost(mockHttp, '/api/v3/fixed-stars/positions');
      await client.getPositions(posReq);
      verifyPost(mockHttp, '/api/v3/fixed-stars/positions');
    });

    test('getConjunctions calls POST /api/v3/fixed-stars/conjunctions',
        () async {
      stubPost(mockHttp, '/api/v3/fixed-stars/conjunctions');
      await client.getConjunctions(conjReq);
      verifyPost(mockHttp, '/api/v3/fixed-stars/conjunctions');
    });

    test('getReport calls POST /api/v3/fixed-stars/report', () async {
      stubPost(mockHttp, '/api/v3/fixed-stars/report');
      await client.getReport(posReq);
      verifyPost(mockHttp, '/api/v3/fixed-stars/report');
    });

    test('getPresets calls GET /api/v3/fixed-stars/presets', () async {
      stubGet(mockHttp, '/api/v3/fixed-stars/presets');
      await client.getPresets();
      verifyGet(mockHttp, '/api/v3/fixed-stars/presets');
    });
  });

  group('FixedStarsClient (integration)',
      skip: !isIntegrationMode ? 'No API key' : null, () {
    test('getPositions returns valid response', () async {
      final result = await realClient!.fixedStars.getPositions(posReq);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getPresets returns valid response', () async {
      final result = await realClient!.fixedStars.getPresets();
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));
  });
}
