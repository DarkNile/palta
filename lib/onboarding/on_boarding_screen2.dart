import 'package:flutter/material.dart';
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
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        isFromOnboarding: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: height * 0.18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Image.asset('assets/images/banner_2.png'),
          const SizedBox(
            height: 35,
          ),
          const CustomText(
            text: 'بالتا تقدم ،',
            fontSize: 18,
            color: pineGreen,
          ),
          const SizedBox(
            height: 25,
          ),
          const CustomText(
            text: 'توصيل الوجبات للمنزل',
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 35,
          ),
          const CustomText(
            textAlign: TextAlign.center,
            text:
                'نوفر لك خدمة توصيل الوجبات الصحية الى المنزل\n طبقا لمواعيد محددة',
            fontSize: 14,
            color: pineGreen,
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: 40,
            height: 10,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ClipOval(
                  child: Container(
                    color: _currentIndex == index
                        ? pineGreen.withOpacity(0.4)
                        : warmGrey.withOpacity(0.2),
                    height: 10,
                    width: 10,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 5,
                );
              },
              itemCount: 3,
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CustomOutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    duration: const Duration(milliseconds: 500),
                    type: PageTransitionType.fade,
                    child: const OnBoardingScreen3(),
                  ),
                );
              },
              title: "التالي",
            ),
          )
        ]),
      ),
    );
  }
}
