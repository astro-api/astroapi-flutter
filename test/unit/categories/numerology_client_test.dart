import 'package:astroapi/astroapi.dart';
import 'package:test/test.dart';

import '../../helpers/test_helpers.dart';

void main() {
  late NumerologyClient client;
  late MockHttpHelper mockHttp;
  AstrologyClient? realClient;

  final coreReq = NumerologyCoreRequest(
    name: 'John Doe',
    birthYear: 1990,
    birthMonth: 5,
    birthDay: 11,
  );

  final compatReq = NumerologyCompatibilityRequest(
    name1: 'John Doe',
    birthYear1: 1990,
    birthMonth1: 5,
    birthDay1: 11,
    name2: 'Jane Doe',
    birthYear2: 1992,
    birthMonth2: 8,
    birthDay2: 22,
  );

  setUp(() {
    mockHttp = MockHttpHelper();
    client = NumerologyClient(mockHttp);
    realClient = createRealClient();
  });

  group('NumerologyClient (mock)', () {
    test('getCoreNumbers calls POST /api/v3/numerology/core-numbers', () async {
      stubPost(mockHttp, '/api/v3/numerology/core-numbers');
      await client.getCoreNumbers(coreReq);
      verifyPost(mockHttp, '/api/v3/numerology/core-numbers');
    });

    test('getComprehensive calls POST /api/v3/numerology/comprehensive',
        () async {
      stubPost(mockHttp, '/api/v3/numerology/comprehensive');
      await client.getComprehensive(coreReq);
      verifyPost(mockHttp, '/api/v3/numerology/comprehensive');
    });

    test('getCompatibility calls POST /api/v3/numerology/compatibility',
        () async {
      stubPost(mockHttp, '/api/v3/numerology/compatibility');
      await client.getCompatibility(compatReq);
      verifyPost(mockHttp, '/api/v3/numerology/compatibility');
    });
  });

  group('NumerologyClient (integration)',
      skip: !isIntegrationMode ? 'No API key' : null, () {
    test('getCoreNumbers returns valid response', () async {
      final result = await realClient!.numerology.getCoreNumbers(coreReq);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getComprehensive returns valid response', () async {
      final result = await realClient!.numerology.getComprehensive(coreReq);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getCompatibility returns valid response', () async {
      final result = await realClient!.numerology.getCompatibility(compatReq);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));
  });
}
