import 'package:palta/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomAnimatedSmoothIndicator extends StatelessWidget {
  const CustomAnimatedSmoothIndicator({
    super.key,
    required this.activeIndex,
    required this.count,
  });

  final int activeIndex;
  final int count;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: count,
      effect: const CustomizableEffect(
          spacing: 8,
          dotDecoration: DotDecoration(
            color: Colors.white,
            width: 8,
            height: 8,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          activeDotDecoration: DotDecoration(
            color: oliveGreen,
            width: 8,
            height: 8,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          )),
    );
  }
}
