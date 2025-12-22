import 'package:flutter/material.dart';
import 'package:habit_tracker/mainapp/mainapp.dart';
import 'package:habit_tracker/register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 24),
                // Logo
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.filter_center_focus, // replace with your asset
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Welcome to back',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 9),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 2,
                  ),
                  child: const Text(
                    'login  in to continue tracking your habits and progrss.',
                    style: TextStyle(fontSize: 14, color: Color(0xFF8E8E93)),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 12),

                // Email
                const SizedBox(height: 6),
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter your email address',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                const SizedBox(height: 16),

                // Password
                const SizedBox(height: 6),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'password',
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                ),

                const SizedBox(height: 24),

                // Register button
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (builder) => MainApp()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2F80ED),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'login',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 226, 232, 236),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                // Bottom login text
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: '',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 98, 98, 224),
                      ),
                      children: [
                        TextSpan(
                          text: 'forgot password?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 63, 96, 139),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFE0E0E0)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Don't have an account? Register",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
