import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;

  @override
  void initState() {
    super.initState;
    startAnimation();
  }

  Future startAnimation() async {}

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
