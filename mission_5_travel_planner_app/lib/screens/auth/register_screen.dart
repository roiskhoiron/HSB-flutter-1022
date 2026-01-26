import 'package:flutter/material.dart';
import '../../styles/app_color.dart';
import '../../widgets/wanderly_logo.dart';

// Halaman Register (Placeholder)
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    return Scaffold(
      backgroundColor: colors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          WanderlyLogo(),
          SizedBox(height: 16),
          Text('Register Screen'),
        ],
      ),
    );
  }
}
