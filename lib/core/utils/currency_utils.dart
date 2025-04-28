import 'package:intl/intl.dart';

import 'converter.dart';

class CurrencyUtils {
  CurrencyUtils._();

  static String doubleToString(num number) {
    final formatter = NumberFormat("#,###", "vi_VN");

    String temp = formatter.format(number);
    return temp.replaceAll(RegExp(r','), ".");
  }

  static double stringToDouble(String currency) {
    return cvToDouble(currency.replaceAll(RegExp(r'[^0-9]'), ''));
  }

  static String formatString(String raw, {bool acceptZero = false}) {
    raw = raw.replaceAll(RegExp(r'[^0-9]'), '');
    final formatter = NumberFormat("#,###", "vi_VN");

    int value = cvToInt(raw);
    if (!acceptZero && value == 0) return "";

    String temp = formatter.format(value);
    return temp.replaceAll(',', '.');
  }
}
