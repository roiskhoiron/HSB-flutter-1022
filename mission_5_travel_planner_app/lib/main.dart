import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'routes/app_routes.dart';

// Entry point aplikasi
void main() {
  runApp(const WanderlyApp());
}

// Root widget aplikasi
class WanderlyApp extends StatefulWidget {
  const WanderlyApp({super.key});

  @override
  State<WanderlyApp> createState() => _WanderlyAppState();
}

class _WanderlyAppState extends State<WanderlyApp> {
  // Mengatur mode tema (default Light Mode)
  // Ubah nilai awal ini jika ingin langsung Dark Mode
  ThemeMode _themeMode = ThemeMode.light;

  // Method untuk toggle Light / Dark Mode
  void toggleTheme(bool isDark) {
    setState(() {
      // Mengubah mode tema aplikasi
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Sizer WAJIB membungkus MaterialApp
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Wanderly',
          debugShowCheckedModeBanner: false,

          // Theme Light
          theme: ThemeData(
            brightness: Brightness.light,
          ),

          // Theme Dark
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),

          // Mode tema aktif
          themeMode: _themeMode,

          // Named Routes
          initialRoute: AppRoutes.splash,
          routes: AppRoutes.routes,

          // Inject toggle theme ke seluruh screen
          builder: (context, child) {
            return ThemeController(
              isDark: _themeMode == ThemeMode.dark,
              toggleTheme: toggleTheme,
              child: child!,
            );
          },
        );
      },
    );
  }
}

// InheritedWidget untuk mengatur theme dari screen manapun
class ThemeController extends InheritedWidget {
  final bool isDark;
  final Function(bool) toggleTheme;

  const ThemeController({
    super.key,
    required this.isDark,
    required this.toggleTheme,
    required super.child,
  });

  // Akses controller dari context
  static ThemeController of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeController>()!;
  }

  @override
  bool updateShouldNotify(covariant ThemeController oldWidget) {
    return isDark != oldWidget.isDark;
  }
}
