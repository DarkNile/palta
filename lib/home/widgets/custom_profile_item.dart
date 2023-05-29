import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/widgets/custom_text.dart';

class CustomProfileItem extends StatelessWidget {
  const CustomProfileItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    this.leading,
  });

  final String title;
  final String subtitle;
  final String icon;
  final VoidCallback onTap;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: CustomText(
        text: title.tr,
        fontWeight: FontWeight.w500,
      ),
      subtitle: CustomText(
        text: subtitle.tr,
        fontSize: 10,
      ),
      leading: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: darkGrey,
        ),
        child: leading ??
            SvgPicture.asset(
              'assets/icons/$icon.svg',
            ),
      ),
      // trailing: const Icon(
      //   Icons.arrow_forward_ios_outlined,
      //   size: 16,
      //   color: Colors.black,
      // ),
    );
  }
}
