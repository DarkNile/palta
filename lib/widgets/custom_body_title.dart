import 'package:palta/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_body_clip_path.dart';
import 'package:palta/widgets/custom_text.dart';

class CustomBodyTitle extends StatelessWidget {
  const CustomBodyTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomBodyClipPath(),
      child: Container(
        padding: EdgeInsets.only(
          right: AppUtil.rtlDirection(context) ? 23 : 0,
          left: AppUtil.rtlDirection(context) ? 0 : 23,
          top: 18,
          bottom: 14,
        ),
        width: MediaQuery.of(context).size.width,
        height: 53,
        color: pineGreen,
        child: CustomText(
          text: title,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
