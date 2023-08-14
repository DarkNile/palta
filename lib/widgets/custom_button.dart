import 'package:flutter/material.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.backgroundColor,
    this.foregroundColor,
    this.radius,
  });

  final VoidCallback onPressed;
  final String title;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 6)))),
        elevation: MaterialStateProperty.all(0),
        fixedSize: MaterialStateProperty.all(
          Size(
            MediaQuery.of(context).size.width,
            48,
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all(backgroundColor ?? pineGreen),
        foregroundColor:
            MaterialStateProperty.all(foregroundColor ?? Colors.white),
      ),
      child: CustomText(
        text: title,
        textAlign: TextAlign.center,
        color: foregroundColor ?? Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
