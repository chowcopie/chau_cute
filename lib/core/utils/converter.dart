import 'package:logger/logger.dart';

int cvToInt(dynamic value, [int defaultValue = 0]) {
  int res = defaultValue;
  try {
    if (value is int) {
      res = value;
    } else if (value is String) {
      res = int.tryParse(value) ?? 0;
    } else if (value is double) {
      res = value.toInt();
    } else if (value is bool) {
      res = value == true ? 1 : 0;
    }
  } catch (e) {
    Logger().e(e);
    res = defaultValue;
  }

  if (res.isNaN || res.isInfinite) {
    res = defaultValue;
  }

  return res;
}

double cvToDouble(dynamic value, [double defaultValue = 0.0]) {
  double res = defaultValue;
  try {
    if (value is int) {
      res = value.toDouble();
    } else if (value is String) {
      res = double.tryParse(value) ?? 0.0;
    } else if (value is double) {
      res = value;
    } else if (value is bool) {
      res = value == true ? 1.0 : 0.0;
    }
  } catch (e) {
    Logger().e(e);
    res = defaultValue;
  }

  if (res.isNaN || res.isInfinite) {
    res = defaultValue;
  }

  return res;
}

dynamic cvToNum(dynamic value) {
  var d = cvToDouble(value);
  var i = cvToInt(value);
  if (d == i) return i;
  return d;
}

bool cvToBool(dynamic value, [bool defaultValue = false]) {
  try {
    if (value is bool) {
      return value;
    } else if (value is int || value is double) {
      return value == 1 ? true : false;
    } else if (value is String) {
      return (value == "1" || value.toLowerCase() == "true") ? true : false;
    }
  } catch (e) {
    Logger().e(e);
  }
  return defaultValue;
}

String cvToString(dynamic value, [String defaultValue = ""]) {
  try {
    if (value is String) {
      return value;
    } else if (value != null) {
      return "$value";
    }
  } catch (e) {
    Logger().e(e);
  }
  return defaultValue;
}

DateTime? cvToDateOptional(dynamic value, [DateTime? defaultValue]) {
  try {
    if (value is DateTime) {
      return value;
    } else if (value is String) {
      return DateTime.tryParse(value)?.toLocal();
    }
  } catch (e) {
    Logger().e(e);
  }
  return defaultValue;
}

DateTime cvToDate(dynamic value, [DateTime? defaultValue]) {
  try {
    if (value is DateTime) {
      return value;
    } else if (value is String) {
      return (DateTime.tryParse(value) ?? DateTime.now()).toLocal();
    }
    if (defaultValue != null) {
      return defaultValue;
    }
  } catch (e) {
    Logger().e(e);
  }
  return DateTime.now();
}
