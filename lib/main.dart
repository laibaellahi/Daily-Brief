import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/router.dart';
import 'app/theme.dart';
import 'providers/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Load the saved theme BEFORE the first frame so there is no light/dark flash.
  final themeProvider = ThemeProvider();
  await themeProvider.load();
  runApp(
    ChangeNotifierProvider.value(value: themeProvider, child: const NewsApp()),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeProvider>().mode;
    return MaterialApp.router(
      title: 'Daily Brief',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: buildTheme(Brightness.light),
      darkTheme: buildTheme(Brightness.dark),
      themeMode: themeMode,
    );
  }
}
