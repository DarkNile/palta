import 'package:flutter/material.dart';
import 'package:palta/screens/splash/splash_screen_3.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();
    animateSplash();
  }

  Future<void> animateSplash() async {
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: const SplashScreen3(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Image.asset(
        'assets/images/splash_2.png',
        width: width,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
