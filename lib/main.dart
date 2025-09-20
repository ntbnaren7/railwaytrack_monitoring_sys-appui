import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:drone_monitoring_system/providers/auth_provider.dart';
import 'package:drone_monitoring_system/providers/drone_provider.dart';
import 'package:drone_monitoring_system/providers/notification_provider.dart';
import 'package:drone_monitoring_system/screens/splash_screen.dart';
import 'package:drone_monitoring_system/screens/login_page.dart';
import 'package:drone_monitoring_system/screens/dashboard_page.dart';
import 'package:drone_monitoring_system/screens/drone_discovery_page.dart';
import 'package:drone_monitoring_system/screens/monitoring_page.dart';
import 'package:drone_monitoring_system/screens/results_page.dart';
import 'package:drone_monitoring_system/screens/admin_panel_page.dart';
import 'package:drone_monitoring_system/screens/settings_page.dart';
import 'package:drone_monitoring_system/screens/analytics_page.dart';

void main() {
  runApp(const DroneMonitoringApp());
}

class DroneMonitoringApp extends StatelessWidget {
  const DroneMonitoringApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => DroneProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
      ],
      child: MaterialApp.router(
        title: 'Drone Monitoring System',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF0F172A), // Professional Dark Blue
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF0F172A),
            brightness: Brightness.light,
            primary: const Color(0xFF0F172A),
            secondary: const Color(0xFF3B82F6),
            surface: const Color(0xFFF8FAFC),
            background: const Color(0xFFF1F5F9),
            error: const Color(0xFFEF4444),
            onPrimary: Colors.white,
            onSecondary: Colors.white,
            onSurface: const Color(0xFF1E293B),
            onBackground: const Color(0xFF1E293B),
          ),
          textTheme: const TextTheme(
            headlineLarge: TextStyle(fontFamily: 'Roboto'),
            headlineMedium: TextStyle(fontFamily: 'Roboto'),
            headlineSmall: TextStyle(fontFamily: 'Roboto'),
            titleLarge: TextStyle(fontFamily: 'Roboto'),
            titleMedium: TextStyle(fontFamily: 'Roboto'),
            titleSmall: TextStyle(fontFamily: 'Roboto'),
            bodyLarge: TextStyle(fontFamily: 'Roboto'),
            bodyMedium: TextStyle(fontFamily: 'Roboto'),
            bodySmall: TextStyle(fontFamily: 'Roboto'),
            labelLarge: TextStyle(fontFamily: 'Roboto'),
            labelMedium: TextStyle(fontFamily: 'Roboto'),
            labelSmall: TextStyle(fontFamily: 'Roboto'),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: const Color(0xFF0F172A),
            foregroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            surfaceTintColor: Colors.transparent,
            titleTextStyle: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F172A),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              elevation: 2,
              shadowColor: const Color(0xFF0F172A).withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF0F172A),
              side: const BorderSide(color: Color(0xFF0F172A), width: 1.5),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        routerConfig: _router,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardPage(),
    ),
    GoRoute(
      path: '/discovery',
      builder: (context, state) => const DroneDiscoveryPage(),
    ),
    GoRoute(
      path: '/monitoring',
      builder: (context, state) => const MonitoringPage(),
    ),
    GoRoute(
      path: '/results',
      builder: (context, state) => const ResultsPage(),
    ),
    GoRoute(
      path: '/admin',
      builder: (context, state) => const AdminPanelPage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: '/analytics',
      builder: (context, state) => const AnalyticsPage(),
    ),
  ],
);
