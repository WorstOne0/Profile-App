//
int betterParseInt(dynamic value, {int defaultValue = 0}) {
  if (value is int) return value;

  if (value is String) return int.tryParse(value) ?? defaultValue;

  if (value is double) return value.toInt();

  return defaultValue;
}
