extension IterableExt<T> on List<T> {
  T? find(bool Function(T e) compare) {
    for (var item in this) {
      if (compare(item)) return item;
    }
    return null;
  }

  bool isContains(bool Function(T e) compare) {
    for (var item in this) {
      if (compare(item)) return true;
    }
    return false;
  }

  T? findOrFirst(bool Function(T e) compare) {
    for (var item in this) {
      if (compare(item)) return item;
    }
    return firstOrNull;
  }

  bool addIfNotExists(T value, bool Function(T e) compare) {
    for (var item in this) {
      if (compare(item)) return false;
    }
    add(value);
    return true;
  }

  void addIfNotNull(T? value) {
    if (value != null) add(value);
  }

  T? getOrNull(int index) {
    if (index >= 0 && index < length) {
      return this[index];
    }
    return null;
  }
}
