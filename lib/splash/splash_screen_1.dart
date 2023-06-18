import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:palta/constants/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:palta/splash/splash_screen_2.dart';
import 'package:palta/widgets/custom_outlined_button.dart';
import 'package:palta/widgets/custom_text.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  double turns = -1 / 14;
  bool dishAnimation = false;
  bool logoApear = false;
  bool logoAnimation = false;

  bool mottoApear = false;
  bool mottoAnimation = false;

  bool arabicApear = false;
  bool arabicAnimation = false;

  bool englishApear = false;
  bool englishAnimation = false;

  bool isClicked = false;

  @override
  void initState() {
    super.initState();
    animateSplash();
  }

  Future<void> animateSplash() async {
    Future.delayed(
        const Duration(
          milliseconds: 50,
        ), () {
      setState(() {
        turns = 1 / 14;
        dishAnimation = true;
      });
    });
    Future.delayed(
        const Duration(
          milliseconds: 700,
        ), () {
      setState(() {
        logoApear = true;
      });
    });
    Future.delayed(
        const Duration(
          milliseconds: 1000,
        ), () {
      setState(() {
        logoAnimation = true;
      });
    });

    Future.delayed(
        const Duration(
          milliseconds: 1700,
        ), () {
      setState(() {
        mottoApear = true;
      });
    });

    Future.delayed(
        const Duration(
          milliseconds: 2000,
        ), () {
      setState(() {
        mottoAnimation = true;
      });
    });

    Future.delayed(
        const Duration(
          milliseconds: 2300,
        ), () {
      setState(() {
        arabicApear = true;
      });
    });

    Future.delayed(
        const Duration(
          milliseconds: 2600,
        ), () {
      setState(() {
        arabicAnimation = true;
      });
    });

    Future.delayed(
        const Duration(
          milliseconds: 2900,
        ), () {
      setState(() {
        englishApear = true;
      });
    });

    Future.delayed(
        const Duration(
          milliseconds: 3200,
        ), () {
      setState(() {
        englishAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            top: height * 0.03,
            left: isClicked
                ? -width * 0.99
                : dishAnimation
                    ? -width * 0.4
                    : -width * 0.8,
            child: AnimatedRotation(
              turns: turns,
              duration: const Duration(milliseconds: 500),
              child: Image.asset(
                'assets/images/dish_image.png',
                height: 434,
              ),
            )),
        Positioned(
          top: height * 0.06,
          right: width * 0.04,
          child: AnimatedOpacity(
            opacity: isClicked
                ? 0
                : dishAnimation
                    ? 1
                    : 0,
            duration: const Duration(milliseconds: 500),
            child: Image.asset('assets/images/ksa.png'),
          ),
        ),
        logoApear
            ? AnimatedPositioned(
                top: logoAnimation ? height * 0.51 : height * 0.54,
                curve: Curves.fastOutSlowIn,
                left: width * 0.3,
                duration: const Duration(milliseconds: 1000),
                child: AnimatedOpacity(
                  opacity: logoAnimation ? 1 : 0,
                  duration: const Duration(milliseconds: 1000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
              )
            : Container(),
        mottoApear
            ? AnimatedPositioned(
                top: isClicked
                    ? height * 0.69
                    : mottoAnimation
                        ? height * 0.69
                        : height * 0.74,
                curve: Curves.fastOutSlowIn,
                left: width * 0.22,
                right: width * 0.22,
                duration: const Duration(milliseconds: 500),
                child: AnimatedOpacity(
                  opacity: isClicked
                      ? 0
                      : mottoAnimation
                          ? 1
                          : 0,
                  duration: const Duration(milliseconds: 200),
                  child: CustomText(
                    text: 'enjoyBeingHealthy'.tr,
                    fontSize: 24,
                    color: pineGreen,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : Container(),
        arabicApear
            ? AnimatedPositioned(
                top: arabicAnimation ? height * 0.75 : height * 0.8,
                curve: Curves.fastOutSlowIn,
                left: width * 0.1,
                right: width * 0.1,
                duration: const Duration(milliseconds: 500),
                child: AnimatedOpacity(
                  opacity: isClicked
                      ? 0
                      : arabicAnimation
                          ? 1
                          : 0,
                  duration: const Duration(milliseconds: 500),
                  child: CustomOutlinedButton(
                    onPressed: () {
                      setState(() {
                        isClicked = true;
                      });
                      Get.updateLocale(const Locale('ar'));
                      final getStorage = GetStorage();
                      getStorage.write('lang', 'ar');
                      Future.delayed(const Duration(milliseconds: 600), () {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: const SplashScreen2(),
                          ),
                        );
                      });
                    },
                    title: 'arabicLanguage'.tr,
                  ),
                ),
              )
            : Container(),
        englishApear
            ? AnimatedPositioned(
                top: englishAnimation ? height * 0.82 : height * 0.88,
                curve: Curves.fastOutSlowIn,
                left: width * 0.1,
                right: width * 0.1,
                duration: const Duration(milliseconds: 500),
                child: AnimatedOpacity(
                  opacity: isClicked
                      ? 0
                      : englishAnimation
                          ? 1
                          : 0,
                  duration: const Duration(milliseconds: 500),
                  child: CustomOutlinedButton(
                    onPressed: () {
                      setState(() {
                        isClicked = true;
                      });
                      Get.updateLocale(const Locale('en-gb'));
                      final getStorage = GetStorage();
                      getStorage.write('lang', 'en-gb');
                      Future.delayed(const Duration(milliseconds: 600), () {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: const SplashScreen2(),
                          ),
                        );
                      });
                    },
                    title: 'englishLanguage'.tr,
                  ),
                ),
              )
            : Container(),
      ]),
    );
  }
}
