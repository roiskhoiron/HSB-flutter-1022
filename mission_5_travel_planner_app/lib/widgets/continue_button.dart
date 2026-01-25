import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  final String text;

  const GoogleButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: Colors.red),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/image/auth/google_logo.png", width: 33, height: 33),
            Text(
              text,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(width: 33),
          ],
        ),
      ),
    );
  }
}
