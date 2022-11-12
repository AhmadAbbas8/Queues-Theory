import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: AnimatedSplashScreen(
        backgroundColor: Colors.white,
        nextScreen: const HomeScreen(),
        splashIconSize: 300,
        duration: 2000,
        splashTransition: SplashTransition.fadeTransition,
        animationDuration: const Duration(seconds: 1),
        splash: Column(
          children: [
            Image.asset('assets/1.png' , scale: 2,),
           const  SizedBox(height: 25),
            const Text('Queue App',
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
