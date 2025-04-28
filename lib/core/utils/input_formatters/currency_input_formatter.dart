import 'package:demo_structure/core/utils/currency_utils.dart';
import 'package:flutter/services.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  const CurrencyInputFormatter({this.maxLength = 13});

  final int maxLength;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.trim().isEmpty) {
      return newValue;
    }

    double value = double.tryParse(newValue.text) ?? 0;

    String newText = CurrencyUtils.doubleToString(value);
    if (newText.length > maxLength) {
      return oldValue;
    }
    // Vị trí con trỏ hiện tại
    int baseOffset = newValue.selection.baseOffset;
    int totalDots = (newValue.text.length - 1) ~/ 3;

    // Tính lại offset mới cho con trỏ
    if (newText.length <= baseOffset) {
      baseOffset = newText.length;
    } else {
      String textAfterOffset = newValue.text.substring(baseOffset);
      int dotsAfterOffset = textAfterOffset.length ~/ 3;
      int dotsBeforeOffset = totalDots - dotsAfterOffset;

      baseOffset += dotsBeforeOffset;

      if (baseOffset > newText.length) baseOffset = newText.length;
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: baseOffset),
    );
  }
}
