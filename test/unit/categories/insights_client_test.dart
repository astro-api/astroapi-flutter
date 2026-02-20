import 'package:astroapi/astroapi.dart';
import 'package:test/test.dart';

import '../../helpers/test_helpers.dart';

void main() {
  late InsightsClient client;
  late MockHttpHelper mockHttp;
  AstrologyClient? realClient;

  final singleSubjectReq = SingleSubjectRequest(subject: testSubject);
  final multiSubjectsReq = MultipleSubjectsRequest(
    subjects: [testSubject, testSubject2],
  );
  final compatReq = CompatibilityRequest(
    subjects: [testSubject, testSubject2],
  );
  final petReq = PetSingleSubjectRequest(pet: testSubject);
  final petCompatReq = PetCompatibilityRequest(
    pet: testSubject,
    owner: testSubject2,
  );
  final petMultiReq = PetMultiSubjectRequest(
    pets: [testSubject, testSubject2],
  );
  final dateRange = {'start': '2024-01-01', 'end': '2024-12-31'};
  final businessMultiReq = BusinessMultipleRequest(
    subjects: [testSubject, testSubject2],
  );
  final businessSingleReq = BusinessSingleRequest(subject: testSubject);

  setUp(() {
    mockHttp = MockHttpHelper();
    client = InsightsClient(mockHttp);
    realClient = createRealClient();
  });

  // ─── InsightsClient (top-level) ──────────────────────────────────────────
  group('InsightsClient (mock)', () {
    test('has all sub-clients', () {
      expect(client.relationship, isNotNull);
      expect(client.pet, isNotNull);
      expect(client.wellness, isNotNull);
      expect(client.financial, isNotNull);
      expect(client.business, isNotNull);
    });

    test('discover calls GET /api/v3/insights', () async {
      stubGet(mockHttp, '/api/v3/insights');
      await client.discover();
      verifyGet(mockHttp, '/api/v3/insights');
    });
  });

  // ─── RelationshipInsightsClient ──────────────────────────────────────────
  group('RelationshipInsightsClient (mock)', () {
    test('getCompatibility calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/relationship/compatibility');
      await client.relationship.getCompatibility(compatReq);
      verifyPost(mockHttp, '/api/v3/insights/relationship/compatibility');
    });

    test('getCompatibilityScore calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/relationship/compatibility-score');
      await client.relationship.getCompatibilityScore(multiSubjectsReq);
      verifyPost(mockHttp, '/api/v3/insights/relationship/compatibility-score');
    });

    test('getLoveLanguages calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/relationship/love-languages');
      await client.relationship.getLoveLanguages(singleSubjectReq);
      verifyPost(mockHttp, '/api/v3/insights/relationship/love-languages');
    });

    test('getDavisonReport calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/relationship/davison');
      await client.relationship.getDavisonReport(multiSubjectsReq);
      verifyPost(mockHttp, '/api/v3/insights/relationship/davison');
    });

    test('getTiming calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/relationship/timing');
      await client.relationship.getTiming(compatReq);
      verifyPost(mockHttp, '/api/v3/insights/relationship/timing');
    });

    test('getRedFlags calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/relationship/red-flags');
      await client.relationship.getRedFlags(singleSubjectReq);
      verifyPost(mockHttp, '/api/v3/insights/relationship/red-flags');
    });

    test('discover calls GET /api/v3/insights/relationship', () async {
      stubGet(mockHttp, '/api/v3/insights/relationship');
      await client.relationship.discover();
      verifyGet(mockHttp, '/api/v3/insights/relationship');
    });
  });

  // ─── PetInsightsClient ───────────────────────────────────────────────────
  group('PetInsightsClient (mock)', () {
    test('getPersonality calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/pet/personality');
      await client.pet.getPersonality(petReq);
      verifyPost(mockHttp, '/api/v3/insights/pet/personality');
    });

    test('getCompatibility calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/pet/compatibility');
      await client.pet.getCompatibility(petCompatReq);
      verifyPost(mockHttp, '/api/v3/insights/pet/compatibility');
    });

    test('getTrainingWindows calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/pet/training-windows');
      await client.pet.getTrainingWindows(petReq);
      verifyPost(mockHttp, '/api/v3/insights/pet/training-windows');
    });

    test('getHealthSensitivities calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/pet/health-sensitivities');
      await client.pet.getHealthSensitivities(petReq);
      verifyPost(mockHttp, '/api/v3/insights/pet/health-sensitivities');
    });

    test('getMultiPetDynamics calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/pet/multi-pet-dynamics');
      await client.pet.getMultiPetDynamics(petMultiReq);
      verifyPost(mockHttp, '/api/v3/insights/pet/multi-pet-dynamics');
    });
  });

  // ─── WellnessInsightsClient ──────────────────────────────────────────────
  group('WellnessInsightsClient (mock)', () {
    test('getBodyMapping calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/wellness/body-mapping');
      await client.wellness.getBodyMapping(singleSubjectReq);
      verifyPost(mockHttp, '/api/v3/insights/wellness/body-mapping');
    });

    test('getBiorhythms calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/wellness/biorhythms');
      await client.wellness.getBiorhythms(singleSubjectReq);
      verifyPost(mockHttp, '/api/v3/insights/wellness/biorhythms');
    });

    test('getWellnessTiming calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/wellness/wellness-timing');
      await client.wellness.getWellnessTiming(singleSubjectReq);
      verifyPost(mockHttp, '/api/v3/insights/wellness/wellness-timing');
    });

    test('getEnergyPatterns calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/wellness/energy-patterns');
      await client.wellness.getEnergyPatterns(singleSubjectReq);
      verifyPost(mockHttp, '/api/v3/insights/wellness/energy-patterns');
    });

    test('getWellnessScore calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/wellness/wellness-score');
      await client.wellness.getWellnessScore(singleSubjectReq);
      verifyPost(mockHttp, '/api/v3/insights/wellness/wellness-score');
    });

    test('getMoonWellness calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/wellness/moon-wellness');
      await client.wellness.getMoonWellness(singleSubjectReq);
      verifyPost(mockHttp, '/api/v3/insights/wellness/moon-wellness');
    });
  });

  // ─── FinancialInsightsClient ─────────────────────────────────────────────
  group('FinancialInsightsClient (mock)', () {
    test('getMarketTiming calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/financial/market-timing');
      await client.financial.getMarketTiming(
        MarketTimingRequest(dateRange: dateRange),
      );
      verifyPost(mockHttp, '/api/v3/insights/financial/market-timing');
    });

    test('analyzePersonalTrading calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/financial/personal-trading');
      await client.financial.analyzePersonalTrading(
        PersonalTradingRequest(subject: testSubject),
      );
      verifyPost(mockHttp, '/api/v3/insights/financial/personal-trading');
    });

    test('getGannAnalysis calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/financial/gann-analysis');
      await client.financial.getGannAnalysis(
        GannAnalysisRequest(dateRange: dateRange),
      );
      verifyPost(mockHttp, '/api/v3/insights/financial/gann-analysis');
    });

    test('getBradleySiderograph calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/financial/bradley-siderograph');
      await client.financial.getBradleySiderograph(
        BradleySiderographRequest(dateRange: dateRange),
      );
      verifyPost(mockHttp, '/api/v3/insights/financial/bradley-siderograph');
    });

    test('getCryptoTiming calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/financial/crypto-timing');
      await client.financial.getCryptoTiming(
        CryptoTimingRequest(dateRange: dateRange),
      );
      verifyPost(mockHttp, '/api/v3/insights/financial/crypto-timing');
    });

    test('getForexTiming calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/financial/forex-timing');
      await client.financial.getForexTiming(
        ForexTimingRequest(dateRange: dateRange),
      );
      verifyPost(mockHttp, '/api/v3/insights/financial/forex-timing');
    });
  });

  // ─── BusinessInsightsClient ──────────────────────────────────────────────
  group('BusinessInsightsClient (mock)', () {
    test('getTeamDynamics calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/business/team-dynamics');
      await client.business.getTeamDynamics(businessMultiReq);
      verifyPost(mockHttp, '/api/v3/insights/business/team-dynamics');
    });

    test('getHiringCompatibility calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/business/hiring-compatibility');
      await client.business.getHiringCompatibility(businessMultiReq);
      verifyPost(mockHttp, '/api/v3/insights/business/hiring-compatibility');
    });

    test('getLeadershipStyle calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/business/leadership-style');
      await client.business.getLeadershipStyle(businessSingleReq);
      verifyPost(mockHttp, '/api/v3/insights/business/leadership-style');
    });

    test('getBusinessTiming calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/business/business-timing');
      await client.business.getBusinessTiming(
        BusinessTimingRequest(subject: testSubject, dateRange: dateRange),
      );
      verifyPost(mockHttp, '/api/v3/insights/business/business-timing');
    });

    test('getDepartmentCompatibility calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/business/department-compatibility');
      await client.business.getDepartmentCompatibility(businessMultiReq);
      verifyPost(
          mockHttp, '/api/v3/insights/business/department-compatibility');
    });

    test('getSuccessionPlanning calls correct endpoint', () async {
      stubPost(mockHttp, '/api/v3/insights/business/succession-planning');
      await client.business.getSuccessionPlanning(businessMultiReq);
      verifyPost(mockHttp, '/api/v3/insights/business/succession-planning');
    });
  });

  // ─── Integration Tests ───────────────────────────────────────────────────
  group('InsightsClient (integration)',
      skip: !isIntegrationMode ? 'No API key' : null, () {
    test('discover returns valid response', () async {
      final result = await realClient!.insights.discover();
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('relationship.getCompatibility returns valid response', () async {
      final result =
          await realClient!.insights.relationship.getCompatibility(compatReq);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('relationship.getLoveLanguages returns valid response', () async {
      final result = await realClient!.insights.relationship
          .getLoveLanguages(singleSubjectReq);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('pet.getPersonality returns valid response', () async {
      final result = await realClient!.insights.pet.getPersonality(petReq);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('wellness.getBiorhythms returns valid response', () async {
      final result =
          await realClient!.insights.wellness.getBiorhythms(singleSubjectReq);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('financial.getMarketTiming returns valid response', () async {
      final result = await realClient!.insights.financial.getMarketTiming(
        MarketTimingRequest(dateRange: dateRange),
      );
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));

    test('business.getTeamDynamics returns valid response', () async {
      final result =
          await realClient!.insights.business.getTeamDynamics(businessMultiReq);
      expect(result.raw, isNotEmpty);
    }, timeout: Timeout(Duration(seconds: 30)));
  });
}
