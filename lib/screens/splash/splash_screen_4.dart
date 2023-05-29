import 'package:flutter/material.dart';
import 'package:palta/home/view/home_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen4 extends StatefulWidget {
  const SplashScreen4({super.key});

  @override
  State<SplashScreen4> createState() => _SplashScreen4State();
}

class _SplashScreen4State extends State<SplashScreen4> {
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
          child: const HomePage(),
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
        'assets/images/splash_4.png',
        width: width,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
