import 'package:astroapi/astroapi.dart';
import 'package:test/test.dart';

import '../../helpers/test_helpers.dart';

void main() {
  late GlossaryClient client;
  late MockHttpHelper mockHttp;
  AstrologyClient? realClient;

  setUp(() {
    mockHttp = MockHttpHelper();
    client = GlossaryClient(mockHttp);
    realClient = createRealClient();
  });

  group('GlossaryClient (mock)', () {
    test('getActivePoints calls GET /api/v3/glossary/active-points', () async {
      stubGet(mockHttp, '/api/v3/glossary/active-points');
      await client.getActivePoints();
      verifyGet(mockHttp, '/api/v3/glossary/active-points');
    });

    test(
        'getPrimaryActivePoints calls GET /api/v3/glossary/active-points/primary',
        () async {
      stubGet(mockHttp, '/api/v3/glossary/active-points/primary');
      await client.getPrimaryActivePoints();
      verifyGet(mockHttp, '/api/v3/glossary/active-points/primary');
    });

    test('getCities calls GET /api/v3/glossary/cities', () async {
      stubGet(mockHttp, '/api/v3/glossary/cities');
      await client.getCities(
        params: CitySearchParams(search: 'London', countryCode: 'GB'),
      );
      verifyGet(mockHttp, '/api/v3/glossary/cities');
    });

    test('getCountries calls GET /api/v3/glossary/countries', () async {
      stubGet(mockHttp, '/api/v3/glossary/countries');
      await client.getCountries();
      verifyGet(mockHttp, '/api/v3/glossary/countries');
    });

    test('getElements calls GET /api/v3/glossary/elements', () async {
      stubGet(mockHttp, '/api/v3/glossary/elements');
      await client.getElements();
      verifyGet(mockHttp, '/api/v3/glossary/elements');
    });

    test('getFixedStars calls GET /api/v3/glossary/fixed-stars', () async {
      stubGet(mockHttp, '/api/v3/glossary/fixed-stars');
      await client.getFixedStars();
      verifyGet(mockHttp, '/api/v3/glossary/fixed-stars');
    });

    test(
        'getHoraryCategoriesGlossary calls GET /api/v3/glossary/horary-categories',
        () async {
      stubGet(mockHttp, '/api/v3/glossary/horary-categories');
      await client.getHoraryCategoriesGlossary();
      verifyGet(mockHttp, '/api/v3/glossary/horary-categories');
    });

    test('getHouseSystems calls GET /api/v3/glossary/house-systems', () async {
      stubGet(mockHttp, '/api/v3/glossary/house-systems');
      await client.getHouseSystems();
      verifyGet(mockHttp, '/api/v3/glossary/house-systems');
    });

    test('getHouses calls GET /api/v3/glossary/houses', () async {
      stubGet(mockHttp, '/api/v3/glossary/houses');
      await client.getHouses();
      verifyGet(mockHttp, '/api/v3/glossary/houses');
    });

    test('getKeywords calls GET /api/v3/glossary/keywords', () async {
      stubGet(mockHttp, '/api/v3/glossary/keywords');
      await client.getKeywords(category: 'planets');
      verifyGet(mockHttp, '/api/v3/glossary/keywords');
    });

    test('getLanguages calls GET /api/v3/glossary/languages', () async {
      stubGet(mockHttp, '/api/v3/glossary/languages');
      await client.getLanguages();
      verifyGet(mockHttp, '/api/v3/glossary/languages');
    });

    test('getLifeAreas calls GET /api/v3/glossary/life-areas', () async {
      stubGet(mockHttp, '/api/v3/glossary/life-areas');
      await client.getLifeAreas(language: 'en');
      verifyGet(mockHttp, '/api/v3/glossary/life-areas');
    });

    test('getThemes calls GET /api/v3/glossary/themes', () async {
      stubGet(mockHttp, '/api/v3/glossary/themes');
      await client.getThemes();
      verifyGet(mockHttp, '/api/v3/glossary/themes');
    });

    test('getZodiacTypes calls GET /api/v3/glossary/zodiac-types', () async {
      stubGet(mockHttp, '/api/v3/glossary/zodiac-types');
      await client.getZodiacTypes();
      verifyGet(mockHttp, '/api/v3/glossary/zodiac-types');
    });
  });

  group('GlossaryClient (integration)',
      skip: !isIntegrationMode ? 'No API key' : null, () {
    test('getActivePoints returns valid response', () async {
      final result = await realClient!.glossary.getActivePoints();
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getCountries returns valid response', () async {
      final result = await realClient!.glossary.getCountries();
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getLanguages returns valid response', () async {
      final result = await realClient!.glossary.getLanguages();
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getHouseSystems returns valid response', () async {
      final result = await realClient!.glossary.getHouseSystems();
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getZodiacTypes returns valid response', () async {
      final result = await realClient!.glossary.getZodiacTypes();
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));
  });
}
