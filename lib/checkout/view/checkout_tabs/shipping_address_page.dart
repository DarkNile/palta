import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/checkout/controllers/checkout_controller.dart';
import 'package:palta/checkout/view/widgets/custom_shipping_address_card.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/profile/controllers/profile_controller.dart';
import 'package:palta/profile/view/add_address_screen.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_text.dart';

class ShippingAddressPage extends StatefulWidget {
  const ShippingAddressPage({
    super.key,
    required this.onNextTap,
    required this.profileController,
    required this.checkoutController,
  });

  final ProfileController profileController;
  final Function(int) onNextTap;
  final CheckoutController checkoutController;

  @override
  State<ShippingAddressPage> createState() => _ShippingAddressPageState();
}

class _ShippingAddressPageState extends State<ShippingAddressPage> {
  late bool isChecked;
  late int? checkedIndex;

  @override
  void initState() {
    super.initState();
    if (widget.profileController.addresses.length == 1) {
      checkedIndex = 0;
      isChecked = true;
    } else {
      checkedIndex = null;
      isChecked = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    if (widget.profileController.addresses.isEmpty) {
      return Center(
        child: InkWell(
          onTap: () {
            Get.to(
              () => const AddAddressScreen(),
            );
          },
          child: Container(
            width: width * 0.4,
            height: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: lighGrey,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: almostBlack,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                CustomText(
                  text: 'addNewAddress'.tr,
                  color: almostBlack,
                  fontWeight: FontWeight.w400,
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'shippedTo'.tr),
                InkWell(
                  onTap: () {
                    Get.to(
                      () => const AddAddressScreen(),
                    );
                  },
                  child: Container(
                    width: width * 0.4,
                    height: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: lighGrey,
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: almostBlack,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        CustomText(
                          text: 'addNewAddress'.tr,
                          color: almostBlack,
                          fontWeight: FontWeight.w400,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: widget.profileController.addresses.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 16,
                    );
                  },
                  itemBuilder: (context, index) {
                    return CustomShippingAddressCard(
                      phoneNumber: widget.profileController.user.value.phone!,
                      onTap: () {
                        setState(() {
                          checkedIndex = index;
                          isChecked = !isChecked;
                        });
                      },
                      address: widget.profileController.addresses[index],
                      isChecked: widget.profileController.addresses.length == 1
                          ? true
                          : isChecked && checkedIndex == index,
                      onChanged: (value) {
                        setState(() {
                          checkedIndex = index;
                          isChecked = value;
                        });
                      },
                    );
                  }),
            ),
            const SizedBox(
              height: 16,
            ),
            Obx(() {
              if (widget.checkoutController.isAddingShippingAddress.value ||
                  widget.checkoutController.isAddingPaymentAddress.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return CustomButton(
                radius: 4,
                onPressed: () {
                  if (checkedIndex != null && isChecked) {
                    widget.onNextTap(checkedIndex!);
                  } else {
                    AppUtil.errorToast(context, 'noShippingAddress'.tr);
                  }
                },
                title: 'next'.tr,
              );
            }),
          ],
        ),
      );
    }
  }
}
