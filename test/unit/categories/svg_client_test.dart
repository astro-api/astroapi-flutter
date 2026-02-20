import 'package:astroapi/astroapi.dart';
import 'package:test/test.dart';

import '../../helpers/test_helpers.dart';

void main() {
  late SvgClient client;
  late MockHttpHelper mockHttp;
  AstrologyClient? realClient;

  setUp(() {
    mockHttp = MockHttpHelper();
    client = SvgClient(mockHttp);
    realClient = createRealClient();
  });

  group('SvgClient (mock)', () {
    test('getNatalChartSvg calls POST /api/v3/svg/natal', () async {
      stubPostString(mockHttp, '/api/v3/svg/natal');

      final result = await client.getNatalChartSvg(
        NatalChartSvgRequest(subject: testSubject),
      );

      expect(result, isA<String>());
      expect(result, contains('<svg'));
      verifyPostString(mockHttp, '/api/v3/svg/natal');
    });

    test('getSynastryChartSvg calls POST /api/v3/svg/synastry', () async {
      stubPostString(mockHttp, '/api/v3/svg/synastry');

      final result = await client.getSynastryChartSvg(
        SynastryChartSvgRequest(subject1: testSubject, subject2: testSubject2),
      );

      expect(result, contains('<svg'));
      verifyPostString(mockHttp, '/api/v3/svg/synastry');
    });

    test('getCompositeChartSvg calls POST /api/v3/svg/composite', () async {
      stubPostString(mockHttp, '/api/v3/svg/composite');

      await client.getCompositeChartSvg(
        CompositeChartSvgRequest(subject1: testSubject, subject2: testSubject2),
      );

      verifyPostString(mockHttp, '/api/v3/svg/composite');
    });

    test('getTransitChartSvg calls POST /api/v3/svg/transit', () async {
      stubPostString(mockHttp, '/api/v3/svg/transit');

      await client.getTransitChartSvg(
        TransitChartSvgRequest(
          natalSubject: testSubject,
          transitDatetime: testDateTimeLocation,
        ),
      );

      verifyPostString(mockHttp, '/api/v3/svg/transit');
    });
  });

  group('SvgClient (integration)',
      skip: !isIntegrationMode ? 'No API key' : null, () {
    test('getNatalChartSvg returns valid SVG', () async {
      final result = await realClient!.svg.getNatalChartSvg(
        NatalChartSvgRequest(subject: testSubject),
      );
      expect(result, isA<String>());
      expect(result, contains('<svg'));
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getSynastryChartSvg returns valid SVG', () async {
      final result = await realClient!.svg.getSynastryChartSvg(
        SynastryChartSvgRequest(subject1: testSubject, subject2: testSubject2),
      );
      expect(result, contains('<svg'));
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getCompositeChartSvg returns valid SVG', () async {
      final result = await realClient!.svg.getCompositeChartSvg(
        CompositeChartSvgRequest(subject1: testSubject, subject2: testSubject2),
      );
      expect(result, contains('<svg'));
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getTransitChartSvg returns valid SVG', () async {
      final result = await realClient!.svg.getTransitChartSvg(
        TransitChartSvgRequest(
          natalSubject: testSubject,
          transitDatetime: testDateTimeLocation,
        ),
      );
      expect(result, contains('<svg'));
    }, timeout: Timeout(Duration(seconds: 30)));
  });
}
