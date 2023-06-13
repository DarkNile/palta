import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:palta/splash/splash_screen_3.dart';
import 'package:palta/widgets/custom_app_bar.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_text.dart';

import '../../constants/colors.dart';

class OnBoardingScreen3 extends StatefulWidget {
  const OnBoardingScreen3({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen3> createState() => _OnBoardingScreen3State();
}

class _OnBoardingScreen3State extends State<OnBoardingScreen3> {
  final int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/banner_1.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 58),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CustomText(
                        text: 'بالتا تقدم ،',
                        fontSize: 18,
                        color: pineGreen,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      const CustomText(
                        text: 'استشارات غذائية',
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: darkGrey,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const CustomText(
                        textAlign: TextAlign.center,
                        text:
                            'للانتقال الى حياة صحية فقد تحتاج الى استشارات ودعم ونحن هنا لمساعدتك',
                        fontSize: 16,
                        color: darkGrey,
                        fontWeight: FontWeight.w300,
                      ),
                      const SizedBox(
                        height: 58,
                      ),
                      SizedBox(
                        height: 8,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                color: _currentIndex == index
                                    ? oliveGreen
                                    : lightGrey2,
                                shape: BoxShape.circle,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 8,
                            );
                          },
                          itemCount: 3,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36)
                      .copyWith(bottom: 40),
                  child: CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          duration: const Duration(milliseconds: 100),
                          type: PageTransitionType.fade,
                          child: const SplashScreen3(),
                        ),
                      );
                    },
                    title: "أبدأ الآن",
                  ),
                ),
              ]),
          const CustomAppBar(
            isFromOnboarding: true,
          ),
        ],
      ),
    );
  }
}
