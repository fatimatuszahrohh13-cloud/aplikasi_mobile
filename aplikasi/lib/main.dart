import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgriGrow',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32),
          surface: const Color(0xFFF4F7F4),
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F7F4),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1B3B1C)),
          titleMedium: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1B3B1C)),
          bodyLarge: TextStyle(color: Color(0xFF4A554A)),
          bodyMedium: TextStyle(color: Color(0xFF4A554A)),
        ),
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
