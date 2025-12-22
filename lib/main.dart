import 'package:flutter/material.dart';
import 'package:habit_tracker/register.dart';
import 'profile.dart';

void main() => runApp(const HabitualApp());

class HabitualApp extends StatelessWidget {
  const HabitualApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habitual',
      theme: ThemeData(
        fontFamily: 'SF Pro Display', // or any similar clean font
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 193, 193, 219),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE5E5EA)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF007AFF)),
          ),
          hintStyle: const TextStyle(color: Color(0xFF8E8E93), fontSize: 15),
        ),
      ),
      home: const RegisterScreen(),
    );
  }
}
