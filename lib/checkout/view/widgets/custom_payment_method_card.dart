import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/checkout/models/payment_method.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/widgets/custom_text.dart';

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
          color: isChecked ? jadeGreen.withOpacity(0.06) : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: isChecked ? jadeGreen : darkGrey),
        ),
        padding: const EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                fillColor: MaterialStateProperty.all(jadeGreen),
                checkColor: Colors.white,
                value: isChecked,
                shape: const CircleBorder(),
                onChanged: onChanged,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            if (paymentMethod.code == 'payfort_fort')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'creditCards'.tr,
                    color: almostBlack,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Image.asset(
                    'assets/images/cards.png',
                    width: 120,
                    height: 30,
                  ),
                ],
              )
            else
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'cashOnDelivery'.tr,
                          color: almostBlack,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CustomText(
                          text: 'taxAdded'.tr,
                          color: brownishGrey,
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/cod.png',
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
