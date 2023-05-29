import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/widgets/custom_text.dart';

class CustomDrawerTile extends StatelessWidget {
  const CustomDrawerTile({
    super.key,
    required this.onTap,
    required this.title,
    required this.leadingIcon,
    this.trailing,
    this.subtitle,
    this.leading,
  });

  final VoidCallback onTap;
  final String title;
  final String leadingIcon;
  final Widget? trailing;
  final Widget? subtitle;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: onTap,
      splashColor: lighGrey,
      title: CustomText(
        text: title.tr,
        fontSize: 13,
        fontWeight: FontWeight.w400,
      ),
      leading: leading ??
          SizedBox(
            width: 24,
            // height: 20,
            child: SvgPicture.asset(
              'assets/icons/$leadingIcon.svg',
            ),
          ),
      contentPadding: const EdgeInsets.all(0),
      minVerticalPadding: 0,
      minLeadingWidth: 0,
      trailing: trailing,
      subtitle: subtitle,
    );
  }
}
