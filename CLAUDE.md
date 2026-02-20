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
```

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
    models/
      requests/                          # Request types (toJson())
      responses/                         # Response types (fromJson())
      enums/                             # Language, HouseSystem, etc.
```

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

// SVG chart
final svg = await client.svg.getNatalChartSvg(
  NatalChartSvgRequest(subject: subject),
);
```

## Key Design Decisions

- **No code generation**: Plain Dart classes instead of freezed/json_serializable for simplicity and faster compilation
- **GenericResponse**: Complex API responses use `GenericResponse` (wraps `Map<String, dynamic>`) with typed fields for commonly-used properties
- **HttpHelper abstraction**: The `HttpHelper` interface enables easy mocking in tests with `mocktail`
- **Retry logic**: Built into `DioHttpClient`, configurable via `RetryConfig`
- **SVG responses**: `SvgClient` returns `String` directly instead of JSON
- **InsightsClient**: Has 5 sub-clients (relationship, pet, wellness, financial, business)

## Testing

Uses `mocktail` to mock `HttpHelper`:

```dart
class MockHttpHelper extends Mock implements HttpHelper {}

final client = DataClient(MockHttpHelper());
```
