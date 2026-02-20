import 'package:astroapi/astroapi.dart';
import 'package:test/test.dart';

void main() {
  group('AstrologyClient', () {
    test('creates all sub-clients', () {
      final client = AstrologyClient(
        const AstrologyClientConfig(apiKey: 'test-key'),
      );

      expect(client.data, isNotNull);
      expect(client.charts, isNotNull);
      expect(client.horoscope, isNotNull);
      expect(client.analysis, isNotNull);
      expect(client.glossary, isNotNull);
      expect(client.astrocartography, isNotNull);
      expect(client.chinese, isNotNull);
      expect(client.eclipses, isNotNull);
      expect(client.lunar, isNotNull);
      expect(client.numerology, isNotNull);
      expect(client.tarot, isNotNull);
      expect(client.traditional, isNotNull);
      expect(client.fixedStars, isNotNull);
      expect(client.insights, isNotNull);
      expect(client.svg, isNotNull);
      expect(client.enhanced, isNotNull);
    });

    test('insights client has sub-clients', () {
      final client = AstrologyClient(
        const AstrologyClientConfig(apiKey: 'test-key'),
      );

      expect(client.insights.relationship, isNotNull);
      expect(client.insights.pet, isNotNull);
      expect(client.insights.wellness, isNotNull);
      expect(client.insights.financial, isNotNull);
      expect(client.insights.business, isNotNull);
    });

    test('AstrologyClientConfig defaults are correct', () {
      const config = AstrologyClientConfig();
      expect(config.timeout, 10000);
      expect(config.debug, isFalse);
      expect(config.apiKey, isNull);
    });

    test('AstrologyClientConfig resolves base URL', () {
      const config =
          AstrologyClientConfig(baseUrl: 'https://custom.example.com');
      expect(config.resolvedBaseUrl, 'https://custom.example.com');
    });

    test('AstrologyClientConfig uses default base URL when not specified', () {
      const config = AstrologyClientConfig();
      expect(config.resolvedBaseUrl, 'https://api.astrology-api.io');
    });

    test('AstrologyClientConfig resolves API key', () {
      const config = AstrologyClientConfig(apiKey: 'my-key');
      expect(config.resolvedApiKey, 'my-key');
    });
  });

  group('RetryConfig', () {
    test('has correct defaults', () {
      const config = RetryConfig();
      expect(config.attempts, 0);
      expect(config.delayMs, 250);
      expect(config.retryStatusCodes, [408, 425, 429, 500, 502, 503, 504]);
    });

    test('accepts custom values', () {
      const config = RetryConfig(
        attempts: 3,
        delayMs: 500,
        retryStatusCodes: [500, 503],
      );
      expect(config.attempts, 3);
      expect(config.delayMs, 500);
      expect(config.retryStatusCodes, [500, 503]);
    });
  });
}
