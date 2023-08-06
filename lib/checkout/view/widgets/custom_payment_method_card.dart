import 'package:flutter/material.dart';
import 'package:palta/checkout/models/payment_method.dart';
import 'package:palta/constants/colors.dart';

class CustomPaymentMethodCard extends StatelessWidget {
  const CustomPaymentMethodCard({
    super.key,
    required this.paymentMethod,
    required this.onTap,
    required this.onChanged,
    required this.isChecked,
  });

  final VoidCallback onTap;
  final PaymentMethod paymentMethod;
  final ValueChanged onChanged;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isChecked ? selectedColor.withOpacity(0.5) : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(
            color: isChecked ? avocado : veryLightPink,
            width: isChecked ? 2 : 1,
          ),
        ),
        padding: const EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                fillColor: MaterialStateProperty.all(pineGreen),
                checkColor: Colors.white,
                value: isChecked,
                shape: const CircleBorder(),
                onChanged: onChanged,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            if (paymentMethod.code == 'cod')
              Image.asset(
                'assets/images/cod.png',
                height: 36,
              )
            else if (paymentMethod.code == 'paytabs_creditcard')
              Image.asset(
                'assets/images/cards.png',
                height: 36,
              )
            else
              Image.asset(
                'assets/images/apple_pay_btn.png',
                height: 36,
              ),
          ],
        ),
      ),
    );
  }
}
