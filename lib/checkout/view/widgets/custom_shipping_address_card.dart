import 'package:flutter/material.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/constants/extensions.dart';
import 'package:palta/profile/models/address.dart';
import 'package:palta/widgets/custom_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomShippingAddressCard extends StatelessWidget {
  const CustomShippingAddressCard({
    super.key,
    required this.address,
    required this.onTap,
    required this.onChanged,
    required this.isChecked,
    required this.phoneNumber,
    required this.onEditTap,
    required this.onDeleteTap,
  });

  final VoidCallback onTap;
  final Address address;
  final ValueChanged onChanged;
  final bool isChecked;
  final String phoneNumber;
  final VoidCallback onEditTap;
  final VoidCallback onDeleteTap;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Transform.scale(
                      scale: 1.2,
                      child: Checkbox(
                        fillColor: MaterialStateProperty.all(pineGreen),
                        checkColor: Colors.white,
                        value: isChecked,
                        shape: const CircleBorder(),
                        onChanged: onChanged,
                      ),
                    ),
                  ),
                  15.pw,
                  Expanded(
                    flex: 8,
                    child: Column(
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
                            // text:
                            //     '${address.city} - ${address.zone} - ${address.country.tr}',
                            text: '${address.city} - ${address.country.tr}',
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
                  ),
                ],
              ),
            ),
            Container(
              height: 41,
              decoration: BoxDecoration(
                color: isChecked ? selectedColor.withOpacity(0.5) : lighGrey,
                border: Border(
                  top: BorderSide(
                    width: isChecked ? 2 : 1,
                    color: isChecked ? avocado : veryLightPink,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: onEditTap,
                      child: Row(
                        children: [
                          const Spacer(),
                          const Icon(
                            Icons.edit,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          CustomText(
                            text: 'edit'.tr,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 41,
                    width: isChecked ? 2 : 1,
                    color: isChecked ? avocado : veryLightPink,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: onDeleteTap,
                      child: Row(
                        children: [
                          const Spacer(),
                          SvgPicture.asset(
                            'assets/icons/delete.svg',
                            colorFilter: const ColorFilter.mode(
                              Colors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          CustomText(
                            text: 'delete'.tr,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
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
