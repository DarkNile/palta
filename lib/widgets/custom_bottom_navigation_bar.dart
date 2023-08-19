import 'package:palta/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: darkGrey,
      selectedItemColor: avocado,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/my_home.png',
            color: currentIndex == 0 ? avocado : darkGrey,
            width: 24,
            height: 24,
          ),
          label: 'home'.tr,
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/programs.png',
            color: currentIndex == 1 ? avocado : darkGrey,
            width: 24,
            height: 24,
          ),
          label: 'programs2'.tr,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            currentIndex == 2
                ? 'assets/icons/subscription_green.svg'
                : 'assets/icons/subscription.svg',
          ),
          label: 'subscriptions'.tr,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            currentIndex == 3
                ? 'assets/icons/guide_green.svg'
                : 'assets/icons/guide.svg',
          ),
          label: 'guides'.tr,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            currentIndex == 4
                ? 'assets/icons/profile_green.svg'
                : 'assets/icons/profile.svg',
          ),
          label: 'profile'.tr,
        ),
      ],
      onTap: onTap,
    );
  }
}
