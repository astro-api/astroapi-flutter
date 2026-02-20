import 'package:astroapi/astroapi.dart';
import 'package:test/test.dart';

import '../../helpers/test_helpers.dart';

void main() {
  late TarotClient client;
  late MockHttpHelper mockHttp;
  AstrologyClient? realClient;

  setUp(() {
    mockHttp = MockHttpHelper();
    client = TarotClient(mockHttp);
    realClient = createRealClient();
  });

  group('TarotClient (mock)', () {
    test('drawCards calls POST /api/v3/tarot/draw', () async {
      stubPost(mockHttp, '/api/v3/tarot/draw');
      await client.drawCards(DrawCardsRequest(count: 3));
      verifyPost(mockHttp, '/api/v3/tarot/draw');
    });

    test('getSpreadReading calls POST /api/v3/tarot/reading', () async {
      stubPost(mockHttp, '/api/v3/tarot/reading');
      await client.getSpreadReading({
        'spread': 'celtic_cross',
        'question': 'What does the future hold?',
      });
      verifyPost(mockHttp, '/api/v3/tarot/reading');
    });

    test('getCard calls GET /api/v3/tarot/cards/the-fool', () async {
      stubGet(mockHttp, '/api/v3/tarot/cards/the-fool');
      await client.getCard('the-fool');
      verifyGet(mockHttp, '/api/v3/tarot/cards/the-fool');
    });

    test('getCards calls GET /api/v3/tarot/cards', () async {
      stubGet(mockHttp, '/api/v3/tarot/cards');
      await client.getCards();
      verifyGet(mockHttp, '/api/v3/tarot/cards');
    });

    test('getCards with params calls correct endpoint', () async {
      stubGet(mockHttp, '/api/v3/tarot/cards');
      await client.getCards(params: TarotCardSearchParams(arcana: 'major'));
      verifyGet(mockHttp, '/api/v3/tarot/cards');
    });

    test('getDailyCard calls GET /api/v3/tarot/daily-card', () async {
      stubGet(mockHttp, '/api/v3/tarot/daily-card');
      await client.getDailyCard();
      verifyGet(mockHttp, '/api/v3/tarot/daily-card');
    });

    test('getGlossary calls GET /api/v3/tarot/glossary', () async {
      stubGet(mockHttp, '/api/v3/tarot/glossary');
      await client.getGlossary();
      verifyGet(mockHttp, '/api/v3/tarot/glossary');
    });

    test('analyzeNatalReport calls POST /api/v3/tarot/analysis/natal-report',
        () async {
      stubPost(mockHttp, '/api/v3/tarot/analysis/natal-report');
      await client.analyzeNatalReport(
        TarotNatalReportRequest(subject: testSubject),
      );
      verifyPost(mockHttp, '/api/v3/tarot/analysis/natal-report');
    });

    test(
        'analyzeTransitReport calls POST /api/v3/tarot/analysis/transit-report',
        () async {
      stubPost(mockHttp, '/api/v3/tarot/analysis/transit-report');
      await client.analyzeTransitReport(
        TarotTransitReportRequest(natalSubject: testSubject),
      );
      verifyPost(mockHttp, '/api/v3/tarot/analysis/transit-report');
    });

    test('getBirthCards calls POST /api/v3/tarot/analysis/birth-cards',
        () async {
      stubPost(mockHttp, '/api/v3/tarot/analysis/birth-cards');
      await client.getBirthCards(
        BirthCardFlexibleRequest(subject: testSubject),
      );
      verifyPost(mockHttp, '/api/v3/tarot/analysis/birth-cards');
    });

    test(
        'analyzeElementalDignities calls POST /api/v3/tarot/analysis/dignities',
        () async {
      stubPost(mockHttp, '/api/v3/tarot/analysis/dignities');
      await client.analyzeElementalDignities(
        ElementalDignitiesRequest(cards: [
          {'name': 'The Fool'},
          {'name': 'The Magician'},
        ]),
      );
      verifyPost(mockHttp, '/api/v3/tarot/analysis/dignities');
    });

    test('getQuintessence calls POST /api/v3/tarot/analysis/quintessence',
        () async {
      stubPost(mockHttp, '/api/v3/tarot/analysis/quintessence');
      await client.getQuintessence(
        QuintessenceRequest(cards: [
          {'name': 'The Fool'},
        ]),
      );
      verifyPost(mockHttp, '/api/v3/tarot/analysis/quintessence');
    });

    test('analyzeTiming calls POST /api/v3/tarot/analysis/timing', () async {
      stubPost(mockHttp, '/api/v3/tarot/analysis/timing');
      await client.analyzeTiming(
        TimingAnalysisRequest(subject: testSubject),
      );
      verifyPost(mockHttp, '/api/v3/tarot/analysis/timing');
    });

    test('getOptimalTimes calls POST /api/v3/tarot/analysis/optimal-times',
        () async {
      stubPost(mockHttp, '/api/v3/tarot/analysis/optimal-times');
      await client.getOptimalTimes(
        OptimalTimesRequest(subject: testSubject),
      );
      verifyPost(mockHttp, '/api/v3/tarot/analysis/optimal-times');
    });
  });

  group('TarotClient (integration)',
      skip: !isIntegrationMode ? 'No API key' : null, () {
    test('drawCards returns valid response', () async {
      final result = await realClient!.tarot.drawCards(
        DrawCardsRequest(count: 3),
      );
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getCards returns valid response', () async {
      final result = await realClient!.tarot.getCards();
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getGlossary returns valid response', () async {
      final result = await realClient!.tarot.getGlossary();
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('getBirthCards returns valid response', () async {
      final result = await realClient!.tarot.getBirthCards(
        BirthCardFlexibleRequest(subject: testSubject),
      );
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));
  });
}
