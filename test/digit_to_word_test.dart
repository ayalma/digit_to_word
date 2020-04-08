
import 'package:flutter_test/flutter_test.dart';
import 'package:digit_to_word/digit_to_word.dart';

void main() {
  group('digit to word test', () {
    final digitToWord = DigitToWord();
    test('section to word ok', () {
      var word = digitToWord.sectionToString("123");
      print(word);
      expect(word, "صد و بیست و سه");
    });

    test('not supported exception', () {
      expect(() => digitToWord.toWord("121212121212222"),
          throwsA(isInstanceOf<NotSupportedException>()));
    });
    test('digit to word with zero ', () {
      var word = digitToWord.toWord("2000005");
      expect(word, "دو میلیون و پنج");
    });
    test('21 test', () {
      var word = digitToWord.toWord("21");
      expect(word, "بیست و یک");
    });

   test('eleven test', () {
      var word = digitToWord.toWord("11");
      expect(word, "یازده");
    });
      test('112 test', () {
      var word = digitToWord.toWord("112");
      expect(word, "صد و دوازده");
    });

        test('28035 test', () {
      var word = digitToWord.toWord("28035");
      expect(word, "بیست و هشت هزار و سی و پنج");
    });
    test(' miliard test ', () {
      var word = digitToWord.toWord("2000000000");
      expect(word, "دو میلیارد");
    });
    test(' 2 miliard and 1 test ', () {
      var word = digitToWord.toWord("2000000001");
      expect(word, "دو میلیارد و یک");
    });
    test('zero test ', () {
      var word = digitToWord.toWord("0");
      expect(word, "صفر");
    });
    test('negative zero ', () {
      var word = digitToWord.toWord("-0");
      expect(word, "صفر");
    });
    test('negative test ', () {
      var word = digitToWord.toWord("-2");
      expect(word, "منفی دو");
    });
    test('digit to work ok', () {
      var word = digitToWord.toWord("250825");
      expect(word, "دویست و پنجاه هزار و هشت صد و بیست و پنج");
    });
  });
}
