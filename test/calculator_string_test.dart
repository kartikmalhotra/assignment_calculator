import 'package:test/test.dart';
import 'package:assignment_calculator/calculator_string.dart';

void main() {
  group('String Calculator', () {
    test('returns 0 when input is empty', () {
      expect(add(''), equals(0));
    });

    test('returns the number itself for single input', () {
      expect(add('4'), equals(4));
    });

    test('adds two numbers separated by a comma', () {
      expect(add('1,2'), equals(3));
    });

    test('adds multiple numbers', () {
      expect(add('1,2,3,4'), equals(10));
    });

    test('supports newlines as valid delimiters', () {
      expect(add('1\n2,3'), equals(6));
    });

    test('handles custom delimiter syntax', () {
      expect(add('//;\n2;3'), equals(5));
    });

    test('throws exception for negative numbers with all values shown', () {
      expect(
        () => add('1,-3,-7'),
        throwsA(
          predicate(
            (e) => e.toString().contains('-3') && e.toString().contains('-7'),
          ),
        ),
      );
    });
  });
}
