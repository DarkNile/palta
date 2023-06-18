import 'package:flutter/material.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/widgets/custom_text.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.width,
    this.height,
    this.radius,
  });

  final VoidCallback onPressed;
  final String title;
  final double? width;
  final double? height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        fixedSize: MaterialStateProperty.all(
          Size(
            width ?? MediaQuery.of(context).size.width,
            height ?? 48,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 6)),
          ),
        ),
        side: MaterialStateProperty.all(
          const BorderSide(
            color: pineGreen,
          ),
        ),
      ),
      child: CustomText(
        text: title,
        color: pineGreen,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        textAlign: TextAlign.center,
      ),
    );
  }
}
