import 'dart:math' as Math;

import 'package:digit_to_word/src/not_supported_exeption.dart';

class DigitToWord {
  final words = [
    [
      "صد",
      "دویست",
      "سیصد",
      "چهارصد",
      "پانصد",
      "ششصد",
      "هفت صد",
      "هشت صد",
      "نه صد"
    ],
    ["ده", "بیست", "سی", "چهل", "پنجاه", "شصت", "هفتاد", "هشتاد", "نود"],
    ["یک", "دو", "سه", "چهار", "پنج", "شش", "هفت", "هشت", "نه"]
  ];
  final dahyek = [
    'یازده',
    'دوازده',
    'سیزده',
    'چهارده',
    'پانزده',
    'شانزده',
    'هفده',
    'هجده',
    'نوزده'
  ];
  final zero = "صفر";
  final andis = ["", "هزار", "میلیون", "میلیارد"];

  String toWord(String input) {
    if (input.length > 12) {
      throw NotSupportedException('Max supported digit length is 12');
    }
    var isNegative = input[0] == '-';
    if (isNegative) input = input.replaceAll('-', '');
    if (input == "0") return zero;
    var sections = splitToSections(input);

    var word = sections
        .map((section) {
          if (section == "0" || section == "00" || section == "000") return "";
          StringBuffer wordBuffer = StringBuffer();
          int index = sections.length - sections.indexOf(section) - 1;
          var sectionWord = sectionToString(section);
          wordBuffer.write(sectionWord);
          if (index > 0) wordBuffer.write(" ");
          wordBuffer.write(andis[index]);
          return wordBuffer.toString();
        })
        .where((item) => item.isNotEmpty)
        .join(' و ');
    if (isNegative) return "منفی $word";
    return word;
  }

  List<String> splitToSections(String input) {
    List<String> sections = List<String>();

    for (int i = input.length; i > 0; i -= 3) {
      var section = input.substring(Math.max(0, i - 3), i);
      sections.add(section);
    }
    return sections.reversed.toList();
  }

  String sectionToString(String section) {
    section = section.padLeft(3, "0");
    StringBuffer wordBuffer = StringBuffer();
    for (int i = 0; i < section.length; i++) {
      var iValue = int.tryParse(section[i]);
      if (iValue == 0) continue;
      if (i > 0 && wordBuffer.isNotEmpty) wordBuffer.write(" و ");
      if (i == 1 && iValue == 1 && int.tryParse(section[i + 1]) > 0) {
        wordBuffer.write(dahyek[int.tryParse(section[i + 1]) - 1]);
        break;
      }
      var tempString = words[i][iValue - 1];
      wordBuffer.write(tempString);
    }
    return wordBuffer.toString();
  }
}
