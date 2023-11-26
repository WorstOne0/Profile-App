// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
// Pages
import '/pages/splash_screen.dart';
// Services
import 'package:profile/services/navigator_provider.dart';
import '/services/secure_storage.dart';
// Widgets
import '/widgets/reponsive_widget.dart';
// Styles
import '/styles/style_config.dart';

void main() async {
  // Flutter initialization
  WidgetsFlutterBinding.ensureInitialized();

  // Enviroment Variables - https://pub.dev/packages/flutter_config - https://www.youtube.com/watch?v=l_nLqPK7K6Q
  await FlutterConfig.loadEnvVariables();

  // *** RIVERPOD ***
  // State management with Riverpod (https://codewithandrea.com/articles/flutter-state-management-riverpod/)

  // With Riverpod, providers are the core of everything:
  // They completely replace design patterns such as singletons, service locators,
  // dependency injection, and InheritedWidgets.
  // They allow you to store some state and easily access it in multiple locations.
  // They allow you to optimize performance by filtering widget rebuilds or caching expensive
  // state computations.
  // They make your code more testable, since each provider can be overridden to behave
  // differently during a test.

  // Startup (https://codewithandrea.com/articles/riverpod-initialize-listener-app-startup/)
  // 1. Create a ProviderContainer
  final container = ProviderContainer(observers: [/*Logger()*/]);
  // 2. Use it to read the provider

  // Dark Mode
  bool isDark =
      (await container.read(secureStorageProvider).readString("dark_mode") ?? "true") == "true";

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: MyApp(isDark: isDark),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({required this.isDark, super.key});

  final bool isDark;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Theme Provider - Package for the animate the switching between themes
    // Used at lib -> widgets -> full_drawer.dart (https://pub.dev/packages/animated_theme_switcher)
    return ThemeProvider(
      initTheme: isDark ? dark() : light(),
      duration: const Duration(milliseconds: 500),
      // GetX package - adds useful funcionalities
      builder: (_, theme) => MaterialApp(
        title: 'Portifolio',
        debugShowCheckedModeBanner: false,
        theme: theme,
        builder: (context, child) => ResponsiveBreakpoints.builder(
          breakpoints: [
            const Breakpoint(start: 0, end: 500, name: MOBILE),
            const Breakpoint(start: 501, end: 1024, name: TABLET),
            const Breakpoint(start: 1025, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
          child: child!,
        ),
        // Always start at Splash Screen
        home: const ResponsiveWidget(child: SplashScreen()),
        // Support PT-BR in dates
        localizationsDelegates: const [
          ...GlobalMaterialLocalizations.delegates,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: const [Locale('pt', 'BR')],
        // (https://github.com/rrousselGit/riverpod/issues/268)
        navigatorKey: ref.watch(navigatorKeyProvider),
      ),
    );
  }
}
