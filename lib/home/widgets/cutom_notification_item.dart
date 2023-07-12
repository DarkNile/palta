import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/widgets/custom_text.dart';

class CustomNotificationItem extends StatelessWidget {
  const CustomNotificationItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.seen,
  });
  final String title;
  final String subtitle;
  final String seen;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 44,
        height: 44,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: iceBlue,
        ),
        child: SvgPicture.asset(
        (seen == '0')?'assets/icons/notification_off.svg':'assets/icons/notification.svg',
        ),
      ),
      title: CustomText(
        text: title,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: brownishGrey,
      ),
      subtitle: CustomText(
        text: subtitle,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    );
  }
}
