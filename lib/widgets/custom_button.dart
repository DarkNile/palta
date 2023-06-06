import 'package:flutter/material.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)))),
        elevation: MaterialStateProperty.all(0),
        fixedSize: MaterialStateProperty.all(
          Size(
            MediaQuery.of(context).size.width,
            48,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(pineGreen),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
      child: CustomText(
        text: title,
        textAlign: TextAlign.center,
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
