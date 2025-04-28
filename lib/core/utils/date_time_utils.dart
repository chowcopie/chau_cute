class DateTimeUtils {
  DateTimeUtils._();

  static DateTime min(DateTime a, DateTime b) {
    if (a.compareTo(b) < 0) return a;
    return b;
  }

  static DateTime max(DateTime a, DateTime b) {
    if (a.compareTo(b) > 0) return a;
    return b;
  }
}
