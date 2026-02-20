# AstroAPI Flutter/Dart SDK

Dart/Flutter SDK for the Astrology API v3. No code generation (no freezed/json_serializable) — uses plain Dart classes with manual `toJson()`.

## Setup

```bash
dart pub get
```

## Development Commands

```bash
# Install dependencies
dart pub get

# Analyze code
dart analyze

# Run tests
dart test

# Run tests with coverage
dart test --coverage=coverage

# Check publish readiness (dry run)
dart pub publish --dry-run
```

## Releasing a New Version

Publishing to pub.dev is automated via GitHub Actions (`.github/workflows/publish.yml`). It triggers when a git tag matching `v*.*.*` is pushed. **The tag version must exactly match `pubspec.yaml`** — CI enforces this and fails the pipeline if they differ.

Steps to release:

```bash
# 1. Update version in pubspec.yaml
#    e.g., change:  version: 1.0.0
#    to:            version: 1.1.0

# 2. Update CHANGELOG.md
#    - Move all items from [Unreleased] into a new versioned section:
#      ## [1.1.0] - 2026-03-01
#    - Add the new version comparison link at the bottom:
#      [1.1.0]: https://github.com/astro-api/astroapi-flutter/compare/v1.0.0...v1.1.0
#    - Update the [Unreleased] link to compare from the new tag:
#      [Unreleased]: https://github.com/astro-api/astroapi-flutter/compare/v1.1.0...HEAD

# 3. Commit both files
git add pubspec.yaml CHANGELOG.md
git commit -m "chore: release v1.1.0"

# 4. Create an annotated git tag — must be "v" + exact pubspec version
git tag v1.1.0

# 5. Push the commit and the tag (tag push triggers publish.yml)
git push origin main
git push origin v1.1.0
```

The CI pipeline then:
1. Validates tag version == pubspec.yaml version
2. Runs `dart analyze` + `dart format` check
3. Runs `dart test`
4. Publishes via `dart pub publish --force` to pub.dev

**Semantic versioning rules** (follow [semver.org](https://semver.org)):
- `PATCH` (1.0.x) — bug fixes, no API changes
- `MINOR` (1.x.0) — new features, backwards-compatible
- `MAJOR` (x.0.0) — breaking API changes

## Architecture

```
lib/
  astroapi.dart                          # Barrel export (public API)
  src/
    client/astrology_client.dart         # Main AstrologyClient class
    config/astrology_client_config.dart  # Config, RetryConfig, RequestOptions
    http/
      http_helper.dart                   # Abstract HttpHelper interface
      dio_http_client.dart               # Dio-based implementation with retry
    errors/astrology_exception.dart      # AstrologyException
    categories/                          # 16 category clients
      base_category_client.dart          # Base class all clients extend
    models/
      requests/                          # Request types (toJson())
        requests.dart                    # Omnibus file, ~1750 lines, all request classes
        birth_data.dart, subject.dart    # Core shared request models
        chart_options.dart, data_options.dart, standard_options.dart
        report_options.dart, date_time_location.dart, fixed_stars_config.dart
      responses/
        responses.dart                   # All response types (fromJson() + GenericResponse typedefs)
      enums/                             # Language, HouseSystem, ZodiacType, Tradition,
                                         # PerspectiveType, DetailLevel
```

## Layer-by-Layer Reference

### Entry Point

`lib/astroapi.dart` is the barrel export. Everything a user (or AI) needs is re-exported from here: the main client, config, errors, HttpHelper, all 16 category clients, all 6 enums, all request and response models.

### AstrologyClient (`lib/src/client/astrology_client.dart`)

Creates a single `DioHttpClient` from the config and passes it to all 16 category clients. Exposes them as named getters:

| Getter | Client class | Description |
|--------|-------------|-------------|
| `.data` | `DataClient` | Planetary positions, aspects, house cusps, lunar metrics |
| `.charts` | `ChartsClient` | Natal, synastry, composite, transit, solar/lunar return charts |
| `.analysis` | `AnalysisClient` | Natal, synastry, composite, compatibility, progression reports |
| `.horoscope` | `HoroscopeClient` | Personal and sun-sign horoscopes (daily/weekly/monthly/yearly) |
| `.glossary` | `GlossaryClient` | Zodiac signs, planets, aspects, house systems, cities lookup |
| `.astrocartography` | `AstrocartographyClient` | Location analysis, power zones, relocation charts |
| `.chinese` | `ChineseClient` | Ba Zi, zodiac, solar terms, element balance |
| `.eclipses` | `EclipsesClient` | Upcoming eclipses, natal checks, interpretations |
| `.lunar` | `LunarClient` | Moon phases, lunar mansions, void-of-course periods |
| `.numerology` | `NumerologyClient` | Core numbers, comprehensive analysis, compatibility |
| `.tarot` | `TarotClient` | Card draws, spreads, birth cards, daily cards |
| `.traditional` | `TraditionalClient` | Dignities, receptions, almutens, lots, profections, firdaria |
| `.fixedStars` | `FixedStarsClient` | Fixed star positions, conjunctions, presets |
| `.svg` | `SvgClient` | SVG chart images — returns `String`, not JSON |
| `.enhanced` | `EnhancedClient` | Enhanced personal and global analysis |
| `.insights` | `InsightsClient` | Has 5 sub-clients (see below) |

`InsightsClient` exposes: `.relationship`, `.pet`, `.wellness`, `.financial`, `.business`

### Config Layer (`lib/src/config/astrology_client_config.dart`)

- **`AstrologyClientConfig`**: `apiKey` (required), `baseUrl`, `timeout` (ms, default 10000), `debug` (bool), `logger` (function), `retry` (RetryConfig)
  - Env var fallbacks: `ASTROLOGY_API_KEY`, `ASTROLOGY_API_BASE_URL`
- **`RetryConfig`**: `attempts`, `delayMs`, `retryStatusCodes` (default: `[408, 425, 429, 500, 502, 503, 504]`)
- **`RequestOptions`**: per-request `headers`, `queryParams`, `timeout` override, Dio `CancelToken`

### HTTP Layer (`lib/src/http/`)

- **`HttpHelper`** (abstract interface): `get`, `post`, `put`, `delete` — the only dependency injected into category clients; mock this in tests
- **`DioHttpClient`** (concrete Dio implementation):
  - Injects `Authorization: Bearer <apiKey>` via Dio interceptor
  - Auto-unwraps `data` or `result` envelope keys from API responses
  - Implements retry logic based on `RetryConfig`

### Category Clients (`lib/src/categories/`)

- All extend `BaseCategoryClient` (holds the `HttpHelper` reference)
- Each exposes typed `async` methods returning response model instances
- `SvgClient` is the exception: returns raw `String` (SVG markup), not a model

### Request Models (`lib/src/models/requests/`)

Plain Dart classes with `toJson()` — **no code generation**. The main file `requests.dart` is an omnibus (~1750 lines) with all request classes. Shared building blocks live in separate files (`BirthData`, `Subject`, `ChartOptions`, etc.) and are exported from the barrel.

### Response Models (`lib/src/models/responses/responses.dart`)

Two strategies:
- **Fully typed** (commonly-accessed fields): `PlanetaryPositionsResponse`, `AspectsResponse`, `HouseCuspsResponse`, `ChartData` — have real `fromJson()` factories
- **`GenericResponse`** (variable/complex schemas): wraps `Map<String, dynamic>`; dozens of `typedef` aliases provide semantic names (e.g., `typedef HoroscopeResponse = GenericResponse`). This is intentional — not a TODO.

### Error Handling (`lib/src/errors/astrology_exception.dart`)

`AstrologyException` fields: `statusCode`, `code`, `message`. Factory `fromDioError()` normalises Dio errors into `AstrologyException`.

## Testing

Uses `mocktail` to mock `HttpHelper`:

```dart
class MockHttpHelper extends Mock implements HttpHelper {}

final client = DataClient(MockHttpHelper());
```

Test layout:
- `test/helpers/test_helpers.dart` — `MockHttpHelper`, shared test data factories
- `test/unit/client_test.dart` — `AstrologyClient` construction and sub-client wiring
- `test/unit/errors/astrology_exception_test.dart` — exception parsing
- `test/unit/categories/` — one test file per category client (16 files)

## Usage Example

```dart
import 'package:astroapi/astroapi.dart';

final client = AstrologyClient(
  AstrologyClientConfig(
    apiKey: 'your-api-key',
    timeout: 15000,
    retry: RetryConfig(attempts: 3, delayMs: 500),
  ),
);

// Get planetary positions
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

// Get natal chart
final chart = await client.charts.getNatalChart(
  NatalChartRequest(subject: subject),
);

// Insights sub-clients
final compat = await client.insights.relationship.getCompatibility(
  CompatibilityRequest(subjects: [subject1, subject2]),
);

// SVG chart (returns String)
final svg = await client.svg.getNatalChartSvg(
  NatalChartSvgRequest(subject: subject),
);
```

## Key Design Decisions

- **No code generation**: Plain Dart classes instead of freezed/json_serializable for simplicity and faster compilation
- **GenericResponse**: Complex API responses use `GenericResponse` (wraps `Map<String, dynamic>`) — intentional, not a gap to fill
- **HttpHelper abstraction**: The `HttpHelper` interface enables easy mocking in tests with `mocktail`
- **Retry logic**: Built into `DioHttpClient`, configurable via `RetryConfig`
- **SVG responses**: `SvgClient` returns `String` directly instead of JSON
- **InsightsClient**: Has 5 sub-clients (relationship, pet, wellness, financial, business)

## Extending the SDK

**Add a new category client:**
1. Create `lib/src/categories/<name>_client.dart`, extend `BaseCategoryClient`
2. Add a getter to `AstrologyClient` in `lib/src/client/astrology_client.dart`
3. Export from `lib/astroapi.dart`

**Add a new request model:**
1. Add the class with `toJson()` to `lib/src/models/requests/requests.dart` (or its own file)
2. Export from `lib/astroapi.dart`

**Add a new response model:**
1. Add `fromJson()` factory to `lib/src/models/responses/responses.dart`
2. Export from `lib/astroapi.dart`

**Add a new enum:**
1. Create `lib/src/models/enums/<name>.dart`
2. Export from `lib/astroapi.dart`
