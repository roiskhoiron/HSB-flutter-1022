import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),

            // Logo Wanderly
            Image.asset(
              'assets/image/auth/wanderly_logo.png',
              width: 297,
              height: 198,
            ),

            const SizedBox(height: 24),

            // Text register link
            Text(
              "Didn’t have account ?",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigasi ke Register Screen
                Navigator.pushNamed(context, AppRoutes.register);
              },
              child: Text(
                "Create one here!",
                style: TextStyle(
                  fontSize: 14,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Input Email
            SizedBox(
              width: 327,
              height: 40,
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'username@gmail.com',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Continue Button
            SizedBox(
              width: 327,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  // Validasi untuk memastikan field tidak kosong
                  if (emailController.text.isNotEmpty) {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.home,
                    );
                  }
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Divider Or
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Or',
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark ? Colors.white : const Color(0xFF828282),
                    ),
                  ),
                ),
                const Expanded(child: Divider()),
              ],
            ),

            const SizedBox(height: 16),

            // Google Button
            _socialButton(
              context,
              'Continue with Google',
              'assets/image/auth/google_logo.png',
              isDark,
            ),

            const SizedBox(height: 8),

            // Apple Button
            _socialButton(
              context,
              'Continue with Apple',
              'assets/image/auth/apple_logo.png',
              isDark,
            ),

            const Spacer(),

            // Home Indicator
            Container(
              height: 34,
              width: double.infinity,
              color: const Color(0xFF2F4BB9),
              alignment: Alignment.center,
              child: Container(
                width: 134,
                height: 5,
                color: isDark ? Colors.black : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialButton(
    BuildContext context,
    String text,
    String iconPath,
    bool isDark,
  ) {
    return SizedBox(
      width: 327,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isDark ? Colors.black : Colors.grey.shade300,
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 20, height: 20),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
