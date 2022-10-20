import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_ninja/shared_utility.dart';

/* AppTheme */

final appThemeProvider = Provider<AppTheme>((ref) {
  return AppTheme();
});

class AppTheme {
  //Modify to add more colors here
  static ThemeData _lightThemeData = ThemeData(
    primaryColor: Colors.blueGrey[600],
    accentColor: Colors.blueGrey[100],
    scaffoldBackgroundColor: Colors.blueGrey[100],
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(
          color: Colors.white,
        ),
        primary: Colors.red,
      ),
    ),
  );

  static ThemeData _darkThemeData = ThemeData(
    primaryColor: Colors.blue,
    accentColor: Colors.black12,
    scaffoldBackgroundColor: Colors.black12,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(
          color: Colors.white,
        ),
        primary: Colors.blue,
      ),
    ),
  );

  ThemeData getAppThemedata(BuildContext context, bool isDarkModeEnabled) {
    return isDarkModeEnabled ? _darkThemeData : _lightThemeData;
  }
}

/* AppTheme Notifier */

final appThemeStateProvider =
    StateNotifierProvider<AppThemeNotifier, bool>((ref) {
  final _isDarkModeEnabled =
      ref.read(sharedUtilityProvider).isDarkModeEnabled();
  return AppThemeNotifier(_isDarkModeEnabled);
});

class AppThemeNotifier extends StateNotifier<bool> {
  AppThemeNotifier(this.defaultDarkModeValue) : super(defaultDarkModeValue);

  final bool defaultDarkModeValue;

  toggleAppTheme(BuildContext context, WidgetRef ref) {
    final _isDarkModeEnabled =
        ref.watch(sharedUtilityProvider).isDarkModeEnabled();
    final _toggleValue = !_isDarkModeEnabled;

    ref
        .watch(
          sharedUtilityProvider,
        )
        .setDarkModeEnabled(_toggleValue)
        .whenComplete(
          () => {
            state = _toggleValue,
          },
        );
  }
}
