import 'package:flutter/material.dart';

// Splash & Auth
import '../screens/splash_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';

// Main Screens
import '../screens/main/home_screen.dart';
// import '../screens/main/search_screen.dart';
// import '../screens/main/trip_screen.dart';
import '../screens/main/profile_screen.dart';

// Kumpulan Named Routes aplikasi
class AppRoutes {
  // Route name constants
  static const splash   = '/splash';
  static const login    = '/login';
  static const register = '/register';
  static const home     = '/home';
  static const search   = '/search';
  static const trip     = '/trip';
  static const profile  = '/profile';

  // Mapping route ke halaman
  static Map<String, WidgetBuilder> routes = {
    // Splash Screen (muncul sekali di awal)
    splash: (context) => const SplashScreen(),

    // Auth Screens
    login: (context) => const LoginScreen(),
    register: (context) => const RegisterScreen(),

    // Main Screens
    home: (context) => const HomeScreen(),
    // search: (context) => const SearchScreen(),
    // trip: (context) => const TripScreen(),
    profile: (context) => const ProfileScreen(),
  };
}
