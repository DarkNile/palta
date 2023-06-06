import 'package:flutter/material.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/widgets/custom_text.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        fixedSize: MaterialStateProperty.all(
          Size(
            MediaQuery.of(context).size.width,
            48,
          ),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
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
