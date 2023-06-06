import 'package:palta/constants/colors.dart';
import 'package:palta/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int) onTap;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final getStorage = GetStorage();
  final _profileController = Get.put(ProfileController());
  late String? customerId;

  @override
  void initState() {
    super.initState();
    customerId = getStorage.read('customerId');
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: widget.currentIndex,
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
            icon: SvgPicture.asset(
              widget.currentIndex == 0
                  ? 'assets/icons/home_green.svg'
                  : 'assets/icons/home.svg',
            ),
            label: 'home'.tr),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              widget.currentIndex == 1
                  ? 'assets/icons/assessment_green.svg'
                  : 'assets/icons/assessment.svg',
            ),
            label: 'assessment'.tr),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              widget.currentIndex == 2
                  ? 'assets/icons/subscription_green.svg'
                  : 'assets/icons/subscription.svg',
            ),
            label: 'subscriptions'.tr),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              widget.currentIndex == 3
                  ? 'assets/icons/guide_green.svg'
                  : 'assets/icons/guide.svg',
            ),
            label: 'guides'.tr),
        if (customerId != null &&
            customerId!.isNotEmpty &&
            customerId == _profileController.user.value.id.toString())
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                widget.currentIndex == 4
                    ? 'assets/icons/profile_green.svg'
                    : 'assets/icons/profile.svg',
              ),
              label: 'profile'.tr),
      ],
      onTap: widget.onTap,
    );
  }
}
