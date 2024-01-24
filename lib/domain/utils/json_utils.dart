T getSafeValue<T>(
    Map<String, dynamic> j,
    String key,
    T defaultValue, {
      T Function(dynamic v)? decoder,
    }) {
  if (j.containsKey(key)) {
    if (decoder != null) {
      return decoder(j[key]);
    }

    return (j[key] ?? defaultValue) as T;
  } else {
    return defaultValue;
  }
}

List<T> getSafeList<T>(Map<String, dynamic> j, String key, T Function(dynamic v) fromJsonModel) {
  if (!j.containsKey(key)) {
    return <T>[];
  }
  if (j[key] == null) {
    return <T>[];
  }
  return List<T>.from(j[key].map((itemsJson) => fromJsonModel(itemsJson)));
}
