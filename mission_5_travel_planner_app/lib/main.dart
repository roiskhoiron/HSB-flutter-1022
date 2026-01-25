import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const WanderlyApp());
}

class WanderlyApp extends StatelessWidget {
  const WanderlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Wanderly',
          // Navigasi antar halaman menggunakan Named Routes
          initialRoute: AppRoutes.splash,
          routes: AppRoutes.routes,
          themeMode: ThemeMode.system,
          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: const Color(0xFFDBF7FF),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: const Color(0xFF102A43),
          ),
        );
      },
    );
  }
}
