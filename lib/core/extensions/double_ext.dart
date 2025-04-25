import 'dart:math';

extension DoubleExt on double {
  double roundDoubleCrazy() {
    try {
      int round = this.round();

      /// 1e-6 = 0.000001
      if ((round - this).abs() < 1e-6) {
        return round.toDouble();
      }
      return this;
    } catch (e) {
      return 0;
    }
  }

  double roundToDecimalPlaces(int places) {
    double mod = pow(10.0, places).toDouble();
    return ((this * mod).round().toDouble() / mod);
  }

  String toText({int digits = 2}) {
    if (this == toInt()) return "${toInt()}";
    return toStringAsFixed(digits);
  }
}
