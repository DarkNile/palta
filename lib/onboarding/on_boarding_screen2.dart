import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:palta/widgets/custom_app_bar.dart';
import 'package:palta/widgets/custom_outlined_button.dart';
import 'package:palta/widgets/custom_text.dart';

import '../../constants/colors.dart';
import 'on_boarding_screen3.dart';

class OnBoardingScreen2 extends StatefulWidget {
  const OnBoardingScreen2({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen2> createState() => _OnBoardingScreen2State();
}

class _OnBoardingScreen2State extends State<OnBoardingScreen2> {
  final int _currentIndex = 1;

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
                Image.asset('assets/images/banner_2.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 58),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'paltaPresents'.tr,
                        fontSize: 18,
                        color: pineGreen,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      CustomText(
                        text: 'homeDelivery'.tr,
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: darkGrey,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        textAlign: TextAlign.center,
                        text: 'homeDeliveryDescription'.tr,
                        fontSize: 16,
                        color: darkGrey,
                        fontWeight: FontWeight.w300,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        height: 8,
                        child: Localizations.override(
                          context: context,
                          locale: Locale('en'),
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
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36)
                      .copyWith(bottom: 40),
                  child: CustomOutlinedButton(
                    onPressed: () {
                      print(_currentIndex);
                      Navigator.push(
                        context,
                        PageTransition(
                          duration: const Duration(milliseconds: 500),
                          type: PageTransitionType.fade,
                          child: const OnBoardingScreen3(),
                        ),
                      );
                    },
                    title: 'next'.tr,
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
