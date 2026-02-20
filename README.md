# AstroAPI

A comprehensive Dart SDK for the [Astrology API](https://astrology-api.io) v3.

## Installation

```yaml
dependencies:
  astroapi: ^1.0.0
```

```bash
dart pub get
```

## Quick Start

```dart
import 'package:astroapi/astroapi.dart';

final client = AstrologyClient(
  AstrologyClientConfig(
    apiKey: 'your-api-key',
    timeout: 15000,
    retry: RetryConfig(attempts: 3, delayMs: 500),
  ),
);

// Planetary positions
final positions = await client.data.getPositions(
  PlanetaryPositionsRequest(
    subject: Subject(
      birthData: BirthData(
        year: 1990, month: 5, day: 11,
        hour: 14, minute: 30,
        city: 'London', countryCode: 'GB',
      ),
    ),
  ),
);
print(positions.positions[0].sign);
```

## Features

16 API categories available via `AstrologyClient`:

| Client | Description |
|--------|-------------|
| `client.data` | Planetary positions, aspects, house cusps, lunar metrics |
| `client.charts` | Natal, synastry, composite, transit, solar/lunar return charts |
| `client.analysis` | Natal, synastry, composite, compatibility, progression reports |
| `client.horoscope` | Personal and sun-sign horoscopes (daily, weekly, monthly, yearly) |
| `client.glossary` | Zodiac signs, planets, aspects, house systems, cities lookup |
| `client.astrocartography` | Location analysis, power zones, relocation charts |
| `client.chinese` | Ba Zi, zodiac, solar terms, element balance |
| `client.eclipses` | Upcoming eclipses, natal checks, interpretations |
| `client.lunar` | Moon phases, lunar mansions, void-of-course periods |
| `client.numerology` | Core numbers, comprehensive analysis, compatibility |
| `client.tarot` | Card draws, spreads, birth cards, daily cards |
| `client.traditional` | Dignities, receptions, almutens, lots, profections, firdaria |
| `client.fixedStars` | Fixed star positions, conjunctions, presets |
| `client.svg` | SVG chart images (natal, synastry, composite, transit) |
| `client.enhanced` | Enhanced personal and global analysis |
| `client.insights` | Relationship, pet, wellness, financial, business insights |

## Insights Sub-clients

```dart
client.insights.relationship  // Compatibility, love languages, timing
client.insights.pet           // Pet personality, compatibility, training
client.insights.wellness      // Body mapping, biorhythms, energy patterns
client.insights.financial     // Market timing, Gann analysis, crypto/forex
client.insights.business      // Team dynamics, hiring, leadership, succession
```

## Configuration

```dart
final client = AstrologyClient(
  AstrologyClientConfig(
    apiKey: 'your-api-key',       // Required
    baseUrl: 'https://...',       // Optional, defaults to production
    timeout: 15000,               // Milliseconds
    debug: true,                  // Log requests/responses
    logger: (msg, details) {},    // Custom logger
    retry: RetryConfig(
      attempts: 3,
      delayMs: 500,
      retryStatusCodes: [429, 500, 502, 503],
    ),
  ),
);
```

## Error Handling

```dart
try {
  final result = await client.data.getPositions(request);
} on AstrologyException catch (e) {
  print(e.statusCode);   // HTTP status code
  print(e.code);          // Error classification
  print(e.message);       // Human-readable message
}
```

## Releasing a New Version

Publishing to pub.dev is automated via GitHub Actions and triggers when a git tag is pushed. The tag version **must match** `pubspec.yaml` exactly — CI enforces this.

```bash
# 1. Update version in pubspec.yaml (e.g. 1.0.0 → 1.1.0)

# 2. Update CHANGELOG.md — move [Unreleased] items to a new [1.1.0] section,
#    update the comparison links at the bottom

# 3. Commit
git add pubspec.yaml CHANGELOG.md
git commit -m "chore: release v1.1.0"

# 4. Tag — must be "v" + exact pubspec version
git tag v1.1.0

# 5. Push commit and tag (tag push triggers publish to pub.dev)
git push origin main
git push origin v1.1.0
```

Semver rules: `PATCH` for bug fixes, `MINOR` for new backwards-compatible features, `MAJOR` for breaking changes.

## License

MIT
