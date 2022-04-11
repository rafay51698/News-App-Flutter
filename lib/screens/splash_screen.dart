import 'package:flutter/material.dart';
import 'package:news_app/screens/home.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
          splash: "assets/splash.png",
          splashIconSize: 200,
          nextScreen: const HomePage(),
          duration: 1000),
    );
  }
}
