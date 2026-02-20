import 'package:astroapi/astroapi.dart';
import 'package:test/test.dart';

import '../../helpers/test_helpers.dart';

void main() {
  late AstrocartographyClient client;
  late MockHttpHelper mockHttp;
  AstrologyClient? realClient;

  setUp(() {
    mockHttp = MockHttpHelper();
    client = AstrocartographyClient(mockHttp);
    realClient = createRealClient();
  });

  group('AstrocartographyClient (mock)', () {
    test('getLines calls POST /api/v3/astrocartography/lines', () async {
      stubPost(mockHttp, '/api/v3/astrocartography/lines');
      await client.getLines(AstrocartographyLinesRequest(subject: testSubject));
      verifyPost(mockHttp, '/api/v3/astrocartography/lines');
    });

    test('getMap calls POST /api/v3/astrocartography/map', () async {
      stubPost(mockHttp, '/api/v3/astrocartography/map');
      await client.getMap(AstrocartographyMapRequest(subject: testSubject));
      verifyPost(mockHttp, '/api/v3/astrocartography/map');
    });

    test('getParanMap calls POST /api/v3/astrocartography/paran-map', () async {
      stubPost(mockHttp, '/api/v3/astrocartography/paran-map');
      await client.getParanMap(ParanMapRequest(subject: testSubject));
      verifyPost(mockHttp, '/api/v3/astrocartography/paran-map');
    });

    test(
        'getLocationAnalysis calls POST /api/v3/astrocartography/location-analysis',
        () async {
      stubPost(mockHttp, '/api/v3/astrocartography/location-analysis');
      await client.getLocationAnalysis(
        LocationAnalysisRequest(
          subject: testSubject,
          location: {'city': 'Tokyo', 'country_code': 'JP'},
        ),
      );
      verifyPost(mockHttp, '/api/v3/astrocartography/location-analysis');
    });

    test(
        'compareLocations calls POST /api/v3/astrocartography/compare-locations',
        () async {
      stubPost(mockHttp, '/api/v3/astrocartography/compare-locations');
      await client.compareLocations(
        CompareLocationsRequest(
          subject: testSubject,
          locations: [
            {'city': 'Tokyo', 'country_code': 'JP'},
            {'city': 'Paris', 'country_code': 'FR'},
          ],
        ),
      );
      verifyPost(mockHttp, '/api/v3/astrocartography/compare-locations');
    });

    test('getPowerZones calls POST /api/v3/astrocartography/power-zones',
        () async {
      stubPost(mockHttp, '/api/v3/astrocartography/power-zones');
      await client.getPowerZones(PowerZonesRequest(subject: testSubject));
      verifyPost(mockHttp, '/api/v3/astrocartography/power-zones');
    });

    test('searchLocations calls POST /api/v3/astrocartography/search-locations',
        () async {
      stubPost(mockHttp, '/api/v3/astrocartography/search-locations');
      await client
          .searchLocations(SearchLocationsRequest(subject: testSubject));
      verifyPost(mockHttp, '/api/v3/astrocartography/search-locations');
    });

    test(
        'getRelocationChart calls POST /api/v3/astrocartography/relocation-chart',
        () async {
      stubPost(mockHttp, '/api/v3/astrocartography/relocation-chart');
      await client.getRelocationChart(
        RelocationChartRequest(
          subject: testSubject,
          newLocation: {'city': 'Tokyo', 'country_code': 'JP'},
        ),
      );
      verifyPost(mockHttp, '/api/v3/astrocartography/relocation-chart');
    });

    test('getAstrodynes calls POST /api/v3/astrocartography/astrodynes',
        () async {
      stubPost(mockHttp, '/api/v3/astrocartography/astrodynes');
      await client.getAstrodynes(AstrodynamesRequest(subject: testSubject));
      verifyPost(mockHttp, '/api/v3/astrocartography/astrodynes');
    });

    test(
        'compareAstrodynes calls POST /api/v3/astrocartography/astrodynes/compare',
        () async {
      stubPost(mockHttp, '/api/v3/astrocartography/astrodynes/compare');
      await client.compareAstrodynes(
        AstrodynamesCompareRequest(
            subject1: testSubject, subject2: testSubject2),
      );
      verifyPost(mockHttp, '/api/v3/astrocartography/astrodynes/compare');
    });

    test('render calls POST /api/v3/astrocartography/render', () async {
      stubPost(mockHttp, '/api/v3/astrocartography/render');
      await client.render(AstrocartographyMapRequest(subject: testSubject));
      verifyPost(mockHttp, '/api/v3/astrocartography/render');
    });

    test('getLineMeanings calls GET /api/v3/astrocartography/line-meanings',
        () async {
      stubGet(mockHttp, '/api/v3/astrocartography/line-meanings');
      await client.getLineMeanings();
      verifyGet(mockHttp, '/api/v3/astrocartography/line-meanings');
    });

    test(
        'getSupportedFeatures calls GET /api/v3/astrocartography/supported-features',
        () async {
      stubGet(mockHttp, '/api/v3/astrocartography/supported-features');
      await client.getSupportedFeatures();
      verifyGet(mockHttp, '/api/v3/astrocartography/supported-features');
    });
  });

  group('AstrocartographyClient (integration)',
      skip: !isIntegrationMode ? 'No API key' : null, () {
    test('getLines returns valid response', () async {
      final result = await realClient!.astrocartography.getLines(
        AstrocartographyLinesRequest(subject: testSubject),
      );
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getLineMeanings returns valid response', () async {
      final result = await realClient!.astrocartography.getLineMeanings();
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getSupportedFeatures returns valid response', () async {
      final result = await realClient!.astrocartography.getSupportedFeatures();
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));
  });
}
