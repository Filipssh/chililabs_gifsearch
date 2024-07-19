import 'package:flutter/material.dart';
class AppTheme {
  static final darkThemeMode = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.indigo,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
}