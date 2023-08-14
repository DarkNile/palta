import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/widgets/custom_text.dart';

class CustomDrawerTile extends StatelessWidget {
  const CustomDrawerTile({
    super.key,
    required this.onTap,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.fontSize,
    this.fontWeight,
  });

  final VoidCallback onTap;
  final String title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: onTap,
      splashColor: lighGrey,
      title: CustomText(
        text: title.tr,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.all(0),
      minVerticalPadding: 0,
      minLeadingWidth: 0,
      subtitle: subtitle,
      leading: leading,
      trailing: trailing,
    );
  }
}
