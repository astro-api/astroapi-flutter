import 'package:astroapi/astroapi.dart';
import 'package:test/test.dart';

void main() {
  group('AstrologyException', () {
    test('constructs with message', () {
      const e = AstrologyException('test error');
      expect(e.message, 'test error');
      expect(e.statusCode, isNull);
      expect(e.code, isNull);
    });

    test('constructs with all fields', () {
      const e = AstrologyException(
        'test error',
        statusCode: 404,
        code: 'NOT_FOUND',
        details: {'key': 'value'},
      );
      expect(e.message, 'test error');
      expect(e.statusCode, 404);
      expect(e.code, 'NOT_FOUND');
      expect(e.details, {'key': 'value'});
    });

    test('isClientError returns true for 4xx', () {
      const e = AstrologyException('error', statusCode: 400);
      expect(e.isClientError(), isTrue);
      expect(e.isServerError(), isFalse);
    });

    test('isClientError returns false for 5xx', () {
      const e = AstrologyException('error', statusCode: 500);
      expect(e.isClientError(), isFalse);
      expect(e.isServerError(), isTrue);
    });

    test('isClientError returns false for 2xx', () {
      const e = AstrologyException('error', statusCode: 200);
      expect(e.isClientError(), isFalse);
      expect(e.isServerError(), isFalse);
    });

    test('isClientError returns false when statusCode is null', () {
      const e = AstrologyException('error');
      expect(e.isClientError(), isFalse);
      expect(e.isServerError(), isFalse);
    });

    test('normalize returns same AstrologyException', () {
      const original = AstrologyException('original');
      final normalized = AstrologyException.normalize(original);
      expect(identical(normalized, original), isTrue);
    });

    test('normalize wraps unknown exception', () {
      final e = Exception('some error');
      final normalized = AstrologyException.normalize(e);
      expect(normalized, isA<AstrologyException>());
      expect(normalized.cause, e);
    });

    test('toString includes message and statusCode', () {
      const e = AstrologyException('test', statusCode: 403);
      expect(e.toString(), contains('test'));
      expect(e.toString(), contains('403'));
    });

    group('isClientError boundary', () {
      test('399 is not client error', () {
        const e = AstrologyException('', statusCode: 399);
        expect(e.isClientError(), isFalse);
      });

      test('400 is client error', () {
        const e = AstrologyException('', statusCode: 400);
        expect(e.isClientError(), isTrue);
      });

      test('499 is client error', () {
        const e = AstrologyException('', statusCode: 499);
        expect(e.isClientError(), isTrue);
      });

      test('500 is server error, not client error', () {
        const e = AstrologyException('', statusCode: 500);
        expect(e.isClientError(), isFalse);
        expect(e.isServerError(), isTrue);
      });
    });
  });
}
