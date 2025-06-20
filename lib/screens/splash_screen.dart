import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nika_ai/screens/home.dart';
import 'package:nika_ai/screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 1.0;
  double _scale = 1.0;

  @override
  void initState() {
    super.initState();
    _startSplashLogic();
  }

  Future<void> _startSplashLogic() async {
    final minSplashTime = Future.delayed(const Duration(seconds: 1));
    final prefsFuture = _fetchLocalData();

    await Future.wait([minSplashTime, prefsFuture]);
    final isFirstTime = await prefsFuture;

    setState(() {
      _opacity = 0.0;
      _scale = 1.5;
    });

    await Future.delayed(const Duration(milliseconds: 500));

    if (!mounted) {
      return;
    }

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 1000),
        pageBuilder: (context, animation, secondaryAnimation) =>
            isFirstTime ? OnboardingScreen() : HomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  Future<bool> _fetchLocalData() async {
    final storage = await SharedPreferences.getInstance();
    bool? isFirst;
    isFirst = (storage.get('isFirstTime') ?? true) as bool;
    return isFirst;
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      body: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(milliseconds: 500),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFFC107),
                Color(0xFFFF5722),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedScale(
                  scale: _scale,
                  duration: const Duration(milliseconds: 500),
                  child: Card(
                    elevation: 4,
                    color: Colors.transparent,
                    shadowColor: Colors.black38,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      'assets/images/luffy.png',
                      width: mq.width * .45,
                      height: mq.width * .45,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
