import 'package:palta/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_body_clip_path.dart';
import 'package:palta/widgets/custom_text.dart';

class CustomBodyTitle extends StatelessWidget {
  const CustomBodyTitle({
    super.key,
    required this.title,
    this.height = 60,
  });

  final String title;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomBodyClipPath(),
      child: Container(
        padding: EdgeInsets.only(
          right: AppUtil.rtlDirection(context) ? 23 : 0,
          left: AppUtil.rtlDirection(context) ? 0 : 23,
          top: 24,
        ),
        width: MediaQuery.of(context).size.width,
        height: height,
        color: pineGreen,
        child: CustomText(
          text: title,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
