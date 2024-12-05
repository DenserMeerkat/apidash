import 'package:apidash_core/apidash_core.dart';
import 'package:test/test.dart';

void main() {
  group('Testing MapExtensions', () {
    group('Testing hasKeyContentType()', () {
      test('Content-Type present should return true', () {
        Map<String, String> mapEx = {"Content-Type": "x", "Agent": "Test"};
        expect(mapEx.hasKeyContentType(), true);
      });

      test('content-Type present should return true', () {
        Map<String, String> mapEx = {"content-Type": "x", "Agent": "Test"};
        expect(mapEx.hasKeyContentType(), true);
      });

      test('empty should return false', () {
        Map<String, String> mapEx = {};
        expect(mapEx.hasKeyContentType(), false);
      });

      test('No content-type present should return false', () {
        Map<String, String> mapEx = {"Agent": "Test"};
        expect(mapEx.hasKeyContentType(), false);
      });

      test('Different datatype should return false', () {
        Map mapEx = {1: "Test"};
        expect(mapEx.hasKeyContentType(), false);
      });

      test('Mixed datatype but should return true', () {
        Map mapEx = {1: "Test", "content-type": "x"};
        expect(mapEx.hasKeyContentType(), true);
      });
    });

    group('Testing getKeyContentType()', () {
      test('Content-Type present', () {
        Map<String, String> mapEx = {"Agent": "Test", "Content-Type": "x"};
        expect(mapEx.getKeyContentType(), "Content-Type");
      });

      test('content-Type present should return true', () {
        Map<String, String> mapEx = {"Agent": "Test", "content-Type": "x"};
        expect(mapEx.getKeyContentType(), "content-Type");
      });

      test('empty should return null', () {
        Map<String, String> mapEx = {};
        expect(mapEx.getKeyContentType(), null);
      });

      test('No content-type present should return null', () {
        Map<String, String> mapEx = {"Agent": "Test"};
        expect(mapEx.getKeyContentType(), null);
      });

      test('Different datatype should return null', () {
        Map mapEx = {1: "Test"};
        expect(mapEx.getKeyContentType(), null);
      });

      test('Mixed datatype but should return content-type', () {
        Map mapEx = {1: "Test", "content-type": "x"};
        expect(mapEx.getKeyContentType(), "content-type");
      });

      test('Multiple occurence should return first', () {
        Map mapEx = {1: "Test", "content-Type": "y", "content-type": "x"};
        expect(mapEx.getKeyContentType(), "content-Type");
      });
    });
  });
}
