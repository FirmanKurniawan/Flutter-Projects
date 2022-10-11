import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quotes_app/Screens/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 10),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/logo.json"),
            AnimatedTextKit(animatedTexts: [
              TyperAnimatedText(
                'Quotes App',
                speed: const Duration(milliseconds: 200),
                textStyle: TextStyle(
                    fontSize: 45.0,
                    color: Colors.purple[900],
                    fontFamily: 'Dancing Script',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0),
              )
            ]),
            const SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}
