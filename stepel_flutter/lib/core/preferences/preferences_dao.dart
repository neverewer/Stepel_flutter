import 'package:shared_preferences/shared_preferences.dart';

// abstract base class PreferencesDao {
//   final SharedPreferences _sharedPreferences;

//   PreferencesDao({required SharedPreferences sharedPreferences}) : _sharedPreferences = sharedPreferences;

//   T? read<T extends Object>(String key);

//   Future<void> set<T extends Object>(String key, T value);

//   Future<void> remove(String key);
// }


final class PreferencesDao  {
  final SharedPreferences _sharedPreferences;

  PreferencesDao({required SharedPreferences sharedPreferences}) : _sharedPreferences = sharedPreferences;
  
  T? read<T extends Object>(String key) {
    final type = T;
    Object? value;
    switch (type) {
      case int:
        value = _sharedPreferences.getInt(key);
      case String:
        value = _sharedPreferences.getString(key);
      case bool:
        value = _sharedPreferences.getBool(key);
      case const (Iterable<String>):
        value = _sharedPreferences.getStringList(key);
    }

    if (value == null) {
      return null;
    }

    if (value is T) {
      return value;
    }

    throw Exception('Unsupported type: $type');
  }

  Future<void> remove(String key) => _sharedPreferences.remove(key);

  Future<void> set<T extends Object>(String key, T value) => switch (value) {
        final int value => _sharedPreferences.setInt(key, value),
        final double value => _sharedPreferences.setDouble(key, value),
        final String value => _sharedPreferences.setString(key, value),
        final bool value => _sharedPreferences.setBool(key, value),
        final Iterable<String> value => _sharedPreferences.setStringList(
            key,
            value.toList(),
          ),
        _ => throw Exception('Unsupported type: $T')
      };
}


