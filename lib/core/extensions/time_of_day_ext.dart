import 'package:flutter/material.dart';

extension TimeOfDayExt on TimeOfDay {
  bool isAfter(TimeOfDay other) => compareTo(other) > 0;

  bool isBefore(TimeOfDay other) => compareTo(other) < 0;

  bool isBetween(TimeOfDay start, TimeOfDay end) {
    return compareTo(start) >= 0 && compareTo(end) <= 0;
  }
}
