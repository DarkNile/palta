import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomAnimatedSmoothIndicator extends StatelessWidget {
  const CustomAnimatedSmoothIndicator({
    super.key,
    required this.activeIndex,
    required this.count,
    this.isTabBar = false,
    this.isBlack = false,
  });

  final int activeIndex;
  final int count;
  final bool isTabBar;
  final bool isBlack;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: count,
      effect: isTabBar
          ? CustomizableEffect(
              spacing: 8,
              dotDecoration: DotDecoration(
                color: Colors.black.withOpacity(0.5),
                width: 21,
                height: 3,
              ),
              activeDotDecoration: const DotDecoration(
                color: Colors.black,
                width: 21,
                height: 3,
              ))
          : CustomizableEffect(
              spacing: 8,
              dotDecoration: DotDecoration(
                color: isBlack
                    ? Colors.black.withOpacity(0.1)
                    : Colors.white.withOpacity(0.5),
                width: 8,
                height: 8,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
              activeDotDecoration: DotDecoration(
                color: isBlack ? Colors.black : Colors.white,
                width: 8,
                height: 8,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              )),
    );
  }
}
