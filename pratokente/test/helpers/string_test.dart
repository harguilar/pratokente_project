import 'package:flutter_test/flutter_test.dart';
import 'package:pratokente/extensions/strings_extensions.dart';

void main() {
  group('StringTest -', () {
    group('toCityDocument -', () {
      test('When Called with Cape Town, should Return cape-town', () {
        final result = 'Cape Town'.toCityDocument;
        expect(result, 'cape-town');
      });
    });
  });
}
