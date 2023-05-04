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
          primary: Color(0xFF8EA4D2), // appbar and down bar
          secondary: Color(0xFF8EA4D2), // timer card
          onPrimary: Colors.black,
          surface: Color(0xFF6279b8), // scaffld
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF323031), // appbar and down bar
          secondary: Color(0xff3d3b3c), // timer card
          onPrimary: Colors.white,
          surface: Color(0xff121212), // scaffld
        ),
      ),
      themeMode: ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}
