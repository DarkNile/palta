import 'package:flutter/material.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.width,
    this.height,
    this.radius,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textColor,
    this.borderColor,
  });

  final VoidCallback onPressed;
  final String title;
  final double? width;
  final double? height;
  final double? radius;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color, textColor, borderColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            side: BorderSide(color: borderColor ?? Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 6)))),
        elevation: MaterialStateProperty.all(0),
        fixedSize: MaterialStateProperty.all(
          Size(
            width ?? MediaQuery.of(context).size.width,
            height ?? 48,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(color ?? darkGreen),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
      child: CustomText(
        text: title,
        textAlign: TextAlign.center,
        color: textColor ?? Colors.white,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w400,
      ),
    );
  }
}
