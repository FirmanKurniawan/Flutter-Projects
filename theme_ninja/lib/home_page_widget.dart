import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_ninja/app_theme_provider.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _appThemeStateProvider =
        ref.watch<AppThemeNotifier>(appThemeStateProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Theme Ninja',
        ),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text('Toggle App Themme'),
            onPressed: () =>
                _appThemeStateProvider.toggleAppTheme(context, ref),
          ),
        ),
      ),
    );
  }
}
