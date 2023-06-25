import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/checkout/controllers/checkout_controller.dart';
import 'package:palta/checkout/view/widgets/custom_payment_method_card.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_text.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({
    super.key,
    required this.onNextTap,
    required this.checkoutController,
    required this.onPreviousTap,
  });

  final Function(int) onNextTap;
  final CheckoutController checkoutController;
  final VoidCallback onPreviousTap;

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  late bool isChecked;
  late int? checkedIndex;

  @override
  void initState() {
    super.initState();
    if (widget.checkoutController.paymentMethods.length == 1) {
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'choosePaymentMethod'.tr,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                // itemCount: Platform.isIOS
                //     ? widget.checkoutController.paymentMethods.length
                //     : widget.checkoutController.paymentMethods.length - 1,
                itemCount: widget.checkoutController.paymentMethods.length - 1,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 16,
                  );
                },
                itemBuilder: (context, index) {
                  return CustomPaymentMethodCard(
                    onTap: () {
                      setState(() {
                        checkedIndex = index;
                        isChecked = true;
                      });
                    },
                    paymentMethod:
                        widget.checkoutController.paymentMethods[index],
                    isChecked:
                        widget.checkoutController.paymentMethods.length == 1
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
          Container(
            alignment: Alignment.bottomCenter,
            color: Colors.white,
            width: width,
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomButton(
                    onPressed: widget.onPreviousTap,
                    title: 'previous'.tr,
                    backgroundColor: paleGrey,
                    foregroundColor: darkGrey,
                  ),
                ),
                const SizedBox(
                  width: 9,
                ),
                Expanded(
                  flex: 2,
                  child: Obx(() {
                    if (widget.checkoutController.isAddingPaymentMethodLoading
                        .value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return CustomButton(
                      onPressed: () {
                        if (checkedIndex != null && isChecked) {
                          widget.onNextTap(checkedIndex!);
                        } else {
                          AppUtil.errorToast(context, 'noPaymentMethod'.tr);
                        }
                      },
                      title: 'next'.tr,
                    );
                  }),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
