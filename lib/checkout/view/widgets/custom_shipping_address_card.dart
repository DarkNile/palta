import 'package:flutter/material.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/profile/models/address.dart';
import 'package:palta/widgets/custom_text.dart';

class CustomShippingAddressCard extends StatelessWidget {
  const CustomShippingAddressCard({
    super.key,
    required this.address,
    required this.onTap,
    required this.onChanged,
    required this.isChecked,
    required this.phoneNumber,
  });

  final VoidCallback onTap;
  final Address address;
  final ValueChanged onChanged;
  final bool isChecked;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomText(
                  text: address.address,
                  color: almostBlack,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: width * 0.7,
                  child: CustomText(
                    text:
                        '${address.city} - ${address.zone} - ${address.country}',
                    color: brownishGrey,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  width: width * 0.7,
                  height: 1,
                  color: lighGrey,
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomText(
                  text: '${address.firstName} ${address.lastName}',
                  color: brownishGrey,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomText(
                  text: phoneNumber,
                  color: almostBlack,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
