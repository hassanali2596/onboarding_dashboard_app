import 'package:flutter/material.dart';


import 'core/theme/app_theme.dart';
import 'features/dashboard/ui/dashboard.dart';
import 'features/login/ui/login.dart';
import 'features/splash/ui/splash.dart';

void main() {
  runApp(const MyApp());
}
 GlobalKey<NavigatorState> navigatorKey=GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey:  navigatorKey,
      title: 'Animated Dashboard',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
      routes: {
        '/login': (_) => const LoginScreen(),
        '/dashboard': (_) => const DashboardScreen(),
      },
    );
  }
}
