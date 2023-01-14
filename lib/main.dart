import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import './loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnimatedSplashScreen(
        splash: Column(
          children: [
            Container(
              child: Image.asset('assets/Logo.png'),
              margin: EdgeInsets.only(bottom: 15),
              height: 150,
              width: 150,
            ),
            Container(
                margin: EdgeInsets.all(15),
                child: const Text(
                  'iNavigate',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
          ],
        ),
        backgroundColor: Color(0xFF527091),
        nextScreen: const LoginScreen(),
        splashIconSize: 250,
        duration: 2000,
        splashTransition: SplashTransition.scaleTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
        animationDuration: const Duration(seconds: 2),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
    );
  }
}
