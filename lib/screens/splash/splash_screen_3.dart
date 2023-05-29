import 'package:flutter/material.dart';
import 'package:palta/screens/splash/splash_screen_4.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen3 extends StatefulWidget {
  const SplashScreen3({super.key});

  @override
  State<SplashScreen3> createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3> {
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
          child: const SplashScreen4(),
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
        'assets/images/splash_3.png',
        width: width,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
