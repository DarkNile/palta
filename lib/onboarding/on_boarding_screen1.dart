import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:palta/widgets/custom_app_bar.dart';
import 'package:palta/widgets/custom_outlined_button.dart';
import 'package:palta/widgets/custom_text.dart';

import '../../constants/colors.dart';
import 'on_boarding_screen2.dart';

class OnBoardingScreen1 extends StatefulWidget {
  const OnBoardingScreen1({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen1> createState() => _OnBoardingScreen1State();
}

class _OnBoardingScreen1State extends State<OnBoardingScreen1> {
  final int _currentIndex = 0;

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
                Image.asset('assets/images/cover_1.png'),
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
                        text: 'وجبات غذائية صحية',
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
                            'إختـر اشتـراك وجباتك بناءً على أهدافك الصحية و تفضيلاتك الشخصية',
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
                  child: CustomOutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          duration: const Duration(milliseconds: 500),
                          type: PageTransitionType.fade,
                          child: const OnBoardingScreen2(),
                        ),
                      );
                    },
                    title: "التالي",
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
