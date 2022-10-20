import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_ninja/app_theme_provider.dart';
import 'package:theme_ninja/home_page_widget.dart';
import 'package:theme_ninja/shared_utility.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(ProviderScope(
    overrides: [
      // override the previous value with the new object
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
    ],
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _appThemeState = ref.watch(appThemeStateProvider);
    return MaterialApp(
      theme:
          ref.watch(appThemeProvider).getAppThemedata(context, _appThemeState),
      home: HomePage(),
    );
  }
}
