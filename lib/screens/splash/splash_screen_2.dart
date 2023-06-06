import 'package:flutter/material.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/screens/on_boarding/on_boarding_screen1.dart';
import 'package:palta/screens/splash/splash_screen_3.dart';
import 'package:page_transition/page_transition.dart';
import 'package:palta/widgets/custom_text.dart';

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

  bool startAnimation = false;
  Future<void> animateSplash() async {
    Future.delayed(
        const Duration(
          milliseconds: 500,
        ), () {
      setState(() {
        startAnimation = true;
      });
      // Navigator.push(
      //   context,
      //   PageTransition(
      //     type: PageTransitionType.fade,
      //     child: const SplashScreen3(),
      //   ),
      // );
    });

    Future.delayed(
        const Duration(
          milliseconds: 2000,
        ), () {
      setState(() {
        startAnimation = true;
      });
      Navigator.pushReplacement(
        context,
        PageTransition(
          duration: const Duration(milliseconds: 200),
          type: PageTransitionType.fade,
          child: OnBoardingScreen1(),
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
            top: startAnimation ? height * 0.07 : height * 0.51,
            curve: Curves.fastOutSlowIn,
            left: width * 0.3,
            duration: const Duration(milliseconds: 1500),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/palta_logo.png',
                  width: width * 0.4,
                ),
                const SizedBox(
                  height: 5,
                ),
                const CustomText(
                  text: 'healthy food',
                  color: darkGreen,
                  fontSize: 17,
                  fontWeight: FontWeight.w100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
