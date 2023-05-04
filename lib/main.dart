import 'package:flutter/material.dart';
import 'package:pomodoro_official/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF8EA4D2),
          secondary: Color(0xFF6279b8),
          onPrimary: Colors.black,
          primaryContainer: Colors.black,
          onPrimaryContainer: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF323031),
          secondary: Color(0xff3d3b3c),
          primaryContainer: Colors.white,
          onPrimary: Colors.white,
        ),
      ),
      themeMode: ThemeMode.dark,
      home: const HomeScreen(),
    );
  }
}
