import 'package:flutter/material.dart';

/// Single brand color. Material 3 derives the full light/dark palette from it.
const Color brandColor = Color(0xFFC62828);

ThemeData buildTheme(Brightness brightness) {
  final scheme = ColorScheme.fromSeed(
    seedColor: brandColor,
    brightness: brightness,
  );
  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    appBarTheme: AppBarTheme(
      backgroundColor: scheme.surface,
      foregroundColor: scheme.onSurface,
      scrolledUnderElevation: 1,
    ),
    chipTheme: ChipThemeData(
      selectedColor: scheme.primaryContainer,
      labelStyle: TextStyle(color: scheme.onSurface),
    ),
  );
}
