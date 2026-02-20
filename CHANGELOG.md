# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0] - 2026-02-20

### Added
- `AstrologyClient` with 16 category sub-clients: `data`, `charts`,
  `horoscope`, `analysis`, `glossary`, `astrocartography`, `chinese`,
  `eclipses`, `lunar`, `numerology`, `tarot`, `traditional`, `fixedStars`,
  `insights`, `svg`, and `enhanced`.
- `InsightsClient` with 5 typed sub-clients: `relationship`, `pet`,
  `wellness`, `financial`, and `business`.
- `AstrologyClientConfig` with configurable API key, base URL, timeout,
  debug mode, and custom logger.
- `RetryConfig` for automatic retry on transient errors with configurable
  attempt count, delay, and retry status codes.
- `RequestOptions` for per-request headers, query parameters, timeout
  override, and Dio `CancelToken` support.
- `AstrologyException` with HTTP status code, error code, and detail fields.
- `HttpHelper` abstract interface for mock-based unit testing.
- Dio-based `DioHttpClient` with Bearer token injection, automatic response
  unwrapping, and retry logic.
- SVG chart support via `SvgClient` returning raw `String`.
- `GenericResponse` for complex or schema-variable API responses.
- Request and response model classes for all 16 API categories.
- Enum types: `Language`, `HouseSystem`, `ZodiacType`, `Tradition`,
  `PerspectiveType`, `DetailLevel`.

[Unreleased]: https://github.com/astro-api/astroapi-flutter/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/astro-api/astroapi-flutter/releases/tag/v1.0.0
