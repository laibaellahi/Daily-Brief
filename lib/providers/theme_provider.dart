import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Holds the current ThemeMode and persists it with shared_preferences.
class ThemeProvider extends ChangeNotifier {
  static const _key = 'is_dark_mode';

  ThemeMode _mode = ThemeMode.light;
  ThemeMode get mode => _mode;
  bool get isDark => _mode == ThemeMode.dark;

  /// Read the saved value (called once in main() before runApp).
  Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _mode = (prefs.getBool(_key) ?? false) ? ThemeMode.dark : ThemeMode.light;
    } catch (_) {
      _mode = ThemeMode.light;
    }
    notifyListeners();
  }

  /// Update UI immediately, then save to disk.
  Future<void> setDark(bool value) async {
    _mode = value ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_key, value);
    } catch (_) {}
  }

  Future<void> toggle() => setDark(!isDark);
}
