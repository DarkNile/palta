import 'package:flutter/material.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/utils/app_util.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.fontSize = 12,
    this.textAlign,
    this.fontWeight = FontWeight.w300,
    this.color = darkGrey,
    this.textDecoration,
    this.maxlines,
    this.textOverflow,
    this.textDirection,
    this.height,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final TextAlign? textAlign;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration? textDecoration;
  final int? maxlines;
  final TextOverflow? textOverflow;
  final TextDirection? textDirection;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ??
          (AppUtil.rtlDirection(context) ? TextAlign.right : TextAlign.left),
      maxLines: maxlines,
      overflow: textOverflow,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: textDecoration,
        height: height,
      ),
      textDirection: textDirection ??
          (AppUtil.rtlDirection(context)
              ? TextDirection.rtl
              : TextDirection.ltr),
    );
  }
}
