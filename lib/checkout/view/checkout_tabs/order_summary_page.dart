import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:palta/checkout/controllers/checkout_controller.dart';
import 'package:palta/checkout/view/widgets/custom_checkout_item.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_text.dart';
import 'package:palta/widgets/custom_text_field.dart';
import 'package:dotted_line/dotted_line.dart';

class OrderSummaryPage extends StatefulWidget {
  const OrderSummaryPage({
    super.key,
    required this.checkoutController,
    required this.onEditInfoTap,
    required this.onEditAddressTap,
    required this.onEditShippingTap,
    required this.onEditPaymentTap,
    required this.onConfirmOrderTap,
    required this.onPreviousTap,
  });

  final CheckoutController checkoutController;
  final VoidCallback onEditInfoTap;
  final VoidCallback onEditAddressTap;
  final VoidCallback onEditShippingTap;
  final VoidCallback onEditPaymentTap;
  final VoidCallback onConfirmOrderTap;
  final VoidCallback onPreviousTap;

  @override
  State<OrderSummaryPage> createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  final _couponController = TextEditingController();
  bool isCouponAdded = false;

  @override
  void dispose() {
    super.dispose();
    _couponController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'subscriptionInfo'.tr,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: pineGreen,
                          ),
                          InkWell(
                            onTap: widget.onEditInfoTap,
                            child: CustomText(
                              text: 'edit'.tr,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: pineGreen,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Divider(
                        thickness: 1,
                        color: lighGrey,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        shrinkWrap: true,
                        itemCount:
                            widget.checkoutController.order!.products!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 28,
                          );
                        },
                        itemBuilder: (context, index) {
                          return CustomCheckoutItem(
                            product: widget
                                .checkoutController.order!.products![index],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 16,
                    bottom: 16,
                  ),
                  color: veryLightPink,
                  width: width,
                  height: 6,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'shippingAddress'.tr,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: pineGreen,
                          ),
                          InkWell(
                            onTap: widget.onEditAddressTap,
                            child: CustomText(
                              text: 'edit'.tr,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: pineGreen,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Divider(
                        thickness: 1,
                        color: lighGrey,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: iceBlue,
                              ),
                              child:
                                  SvgPicture.asset('assets/icons/location.svg'),
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: widget.checkoutController.order!
                                        .shippingAddress!,
                                    fontSize: 14,
                                  ),
                                  CustomText(
                                    text:
                                        '${widget.checkoutController.order!.shippingCity!} - ${widget.checkoutController.order!.shippingZone!} - ${widget.checkoutController.order!.shippingCountry!.tr}',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  CustomText(
                                    text:
                                        '${widget.checkoutController.order!.shippingFirstName!} ${widget.checkoutController.order!.shippingLastName!}',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                  CustomText(
                                    text: widget.checkoutController.order!.phone!,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 16,
                    bottom: 16,
                  ),
                  color: veryLightPink,
                  width: width,
                  height: 6,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'shippingInfo'.tr,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: pineGreen,
                          ),
                          InkWell(
                            onTap: widget.onEditShippingTap,
                            child: CustomText(
                              text: 'edit'.tr,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: pineGreen,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Divider(
                        thickness: 1,
                        color: lighGrey,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomText(
                        text: (GetStorage().read('lang') == 'ar')
                            ? 'شحن مجاني'
                            : widget.checkoutController.order!.shippingCode!,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 16,
                    bottom: 16,
                  ),
                  color: veryLightPink,
                  width: width,
                  height: 6,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'paymentInfo'.tr,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: pineGreen,
                          ),
                          InkWell(
                            onTap: widget.onEditPaymentTap,
                            child: CustomText(
                              text: 'edit'.tr,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: pineGreen,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Divider(
                        thickness: 1,
                        color: lighGrey,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      if (widget.checkoutController.order!.paymentCode == 'cod')
                        Image.asset(
                          'assets/images/cod.png',
                          height: 36,
                        )
                      else if (widget.checkoutController.order!.paymentCode ==
                          'paytabs_creditcard')
                        Image.asset(
                          'assets/images/cards.png',
                          height: 36,
                        )
                      else
                        Image.asset(
                          'assets/images/apple_pay.png',
                          height: 20,
                        ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 16,
                    bottom: 16,
                  ),
                  color: veryLightPink,
                  width: width,
                  height: 6,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'totalInvoice'.tr,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: pineGreen,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Divider(
                        thickness: 1,
                        color: lighGrey,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              height: 43,
                              child: CustomTextField(
                                controller: _couponController,
                                validator: false,
                                hintText: 'couponCode'.tr,
                                textInputType: TextInputType.text,
                                readOnly: isCouponAdded ? true : false,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            flex: 1,
                            child: Obx(() {
                              if (widget
                                  .checkoutController.isCouponLoading.value) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return ElevatedButton(
                                onPressed: () async {
                                  if (isCouponAdded) {
                                    final isSuccess = await widget
                                        .checkoutController
                                        .deleteCoupon(
                                      context: context,
                                    );
                                    if (isSuccess) {
                                      setState(() {
                                        isCouponAdded = false;
                                      });
                                    }
                                  } else {
                                    final isSuccess = await widget
                                        .checkoutController
                                        .addCoupon(
                                            context: context,
                                            coupon: _couponController.text);
                                    if (isSuccess) {
                                      setState(() {
                                        isCouponAdded = true;
                                      });
                                    }
                                  }
                                },
                                style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(0),
                                    backgroundColor: MaterialStateProperty.all(
                                      isCouponAdded ? pineGreen : paleGrey,
                                    ),
                                    foregroundColor: MaterialStateProperty.all(
                                      isCouponAdded ? Colors.white : darkGrey,
                                    ),
                                    fixedSize: MaterialStateProperty.all(
                                        const Size.fromHeight(43)),
                                    shape: MaterialStateProperty.all(
                                        const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6))))),
                                child: CustomText(
                                  text:
                                      isCouponAdded ? 'remove'.tr : 'apply'.tr,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color:
                                      isCouponAdded ? Colors.white : darkGrey,
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              widget.checkoutController.order!.totals!.length,
                          separatorBuilder: (context, index) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: DottedLine(
                                dashColor: veryLightPink,
                              ),
                            );
                          },
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: widget.checkoutController.order!
                                      .totals![index].title!,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                CustomText(
                                  text: widget.checkoutController.order!
                                      .totals![index].text!,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            );
                          }),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'total'.tr,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          '${widget.checkoutController.order!.total.toStringAsFixed(2)} ',
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: avocado,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'riyal'.tr,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: avocado,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            textDirection: TextDirection.ltr,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/barcode_1.svg',
                                colorFilter: const ColorFilter.mode(
                                  veryLightPink,
                                  BlendMode.srcIn,
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/icons/barcode_2.svg',
                                colorFilter: const ColorFilter.mode(
                                  veryLightPink,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
                  child: CustomButton(
                    onPressed: widget.onConfirmOrderTap,
                    title: 'confirmOrder'.tr,
                    backgroundColor: avocado,
                  ),
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
