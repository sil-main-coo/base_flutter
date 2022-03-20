import 'package:base_flutter/commons/constants/regex_constants.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyTextInputFormatter extends TextInputFormatter {
  CurrencyTextInputFormatter({this.maxDigits = 0});

  final int maxDigits;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText;

    if (newValue.text.isNotEmpty) {
      String textReg =
      newValue.text.replaceAll(RegExp(RegexConstants.notHasDigitRegex), '');

      int value = int.parse(textReg);
      final formatter = NumberFormat("#,###");
      newText = formatter.format(value);
    } else {
      newText = '';
    }
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
