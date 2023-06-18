import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/view/home_page.dart';
import 'package:palta/widgets/custom_text.dart';

class SplashScreen3 extends StatefulWidget {
  const SplashScreen3({super.key});

  @override
  State<SplashScreen3> createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3> {
  bool startAnimation = false;

  @override
  void initState() {
    super.initState();
    animateSplash();
  }

  Future<void> animateSplash() async {
    Future.delayed(
        const Duration(
          milliseconds: 500,
        ), () {
      setState(() {
        startAnimation = true;
      });
      Navigator.pushReplacement(
        context,
        PageTransition(
          duration: const Duration(milliseconds: 200),
          type: PageTransitionType.fade,
          child: const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AnimatedPositioned(
            top: startAnimation ? height * 0.51 : height * 0.07,
            curve: Curves.fastOutSlowIn,
            left: width * 0.3,
            duration: const Duration(milliseconds: 1200),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1800),
              opacity: startAnimation ? 0 : 1,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 81.6,
                    width: width * 0.4,
                  ),
                  const CustomText(
                    text: 'Healthy Food',
                    color: pineGreen,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
