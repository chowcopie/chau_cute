import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  // -------------------------------
  // 📅 Date Formatting Extensions
  // -------------------------------

  /// ISO 8601 string format.
  /// Example: "2023-03-15T14:30:00Z"
  String toIsoString() => DateFormat('yyyy-MM-ddTHH:mm:ssZ').format(this);

  /// Format: "dd/MM/yyyy"
  /// Example: "15/03/2023"
  String toDMYFormat() => DateFormat("dd/MM/yyyy").format(this);

  /// Format: "yyyy-MM-dd"
  /// Example: "2023-03-15"
  String toYMDFormat() => DateFormat("yyyy-MM-dd").format(this);

  /// Format: "dd/MM"
  /// Example: "15/03"
  String toDMFormat() => DateFormat("dd/MM").format(this);

  /// Format: "MM/yyyy"
  /// Example: "03/2023"
  String toMYFormat() => DateFormat("MM/yyyy").format(this);

  /// Format: "dd"
  /// Example: "15"
  String toDFormat() => DateFormat("dd").format(this);

  /// Format: "MM"
  /// Example: "03"
  String toMFormat() => DateFormat("MM").format(this);

  /// Format: "yyyy"
  /// Example: "2023"
  String toYFormat() => DateFormat("yyyy").format(this);

  /// Format: "HH:mm - dd/MM/yyyy"
  /// Example: "14:30 - 01/03/2023"
  String toHmDMYFormat() => DateFormat("HH:mm - dd/MM/yyyy").format(this);

  /// Format: "dd/MM/yyyy - HH:mm"
  /// Example: "01/03/2023 - 14:30"
  String toDMYHmFormat() => DateFormat("dd/MM/yyyy - HH:mm").format(this);

  /// Format: "HH:mm:ss - dd/MM/yyyy"
  /// Example: "14:30:45 - 01/03/2023"
  String toHmsDMYFormat() => DateFormat("HH:mm:ss - dd/MM/yyyy").format(this);

  /// Format: "dd/MM/yyyy - HH:mm:ss"
  /// Example: "01/03/2023 - 14:30:45"
  String toDMYHMsFormat() => DateFormat("dd/MM/yyyy - HH:mm:ss").format(this);

  /// Format: "HH:mm"
  /// Example: "14:30"
  String toHmFormat() => DateFormat("HH:mm").format(this);

  /// Format: "HH:mm:ss"
  /// Example: "14:30:45"
  String toHmsFormat() => DateFormat("HH:mm:ss").format(this);

  // -------------------------------
  // 🔁 Date Manipulation
  // -------------------------------

  DateTime toPrevDay() => subtract(const Duration(days: 1));
  DateTime toNextDay() => add(const Duration(days: 1));

  DateTime toPrevMonth() => DateTime(year, month - 1, 1);
  DateTime toNextMonth() => DateTime(year, month + 1, 1);

  DateTime toStartOfDate() => DateTime(year, month, day);
  DateTime toEndOfDate() => DateTime(year, month, day, 23, 59, 59, 999);

  DateTime toStartOfMonth() => DateTime(year, month, 1);
  DateTime toEndOfMonth() => toNextMonth().toPrevDay().toEndOfDate();

  DateTime toStartOfYear() => DateTime(year, 1, 1);
  DateTime toEndOfYear() => DateTime(year, 12, 31).toEndOfDate();

  DateTime toStartOfWeek() =>
      toStartOfDate().subtract(Duration(days: weekday - 1));

  DateTime toEndOfWeek() =>
      toStartOfDate().add(Duration(days: DateTime.daysPerWeek - weekday));

  // -------------------------------
  // 🔍 Date Comparison
  // -------------------------------

  bool sameDay(DateTime date) => toStartOfDate() == date.toStartOfDate();
  bool sameMonth(DateTime date) => month == date.month && year == date.year;
  bool sameYear(DateTime date) => year == date.year;

  int compareDay(DateTime date) =>
      toStartOfDate().compareTo(date.toStartOfDate());

  bool isBetweenDay(DateTime d1, DateTime d2) =>
      compareDay(d1) >= 0 && compareDay(d2) <= 0;

  bool isBetween(DateTime d1, DateTime d2) => isAfter(d1) && isBefore(d2);

  bool isStartOfMonth() => sameDay(toStartOfMonth());
  bool isEndOfMonth() => sameDay(toEndOfMonth());

  bool isStartOfYear() => sameDay(toStartOfYear());
  bool isEndOfYear() => sameDay(toEndOfYear());
}
