import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:palta/checkout/controllers/checkout_controller.dart';
import 'package:palta/checkout/view/widgets/custom_checkout_item.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_text.dart';
import 'package:palta/widgets/custom_text_field.dart';
import 'package:dotted_line/dotted_line.dart';

class OrderSummaryPage extends StatelessWidget {
  const OrderSummaryPage({
    super.key,
    required this.checkoutController,
    required this.onEditInfoTap,
    required this.onEditAddressTap,
    required this.onEditShippingTap,
    required this.onEditPaymentTap,
    required this.onConfirmOrderTap,
    required this.onPreviousTap,
    required this.homeController,
  });

  final CheckoutController checkoutController;
  final VoidCallback onEditInfoTap;
  final VoidCallback onEditAddressTap;
  final VoidCallback onEditShippingTap;
  final VoidCallback onEditPaymentTap;
  final VoidCallback onConfirmOrderTap;
  final VoidCallback onPreviousTap;
  final HomeController homeController;

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
                            onTap: onEditInfoTap,
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
                        itemCount: checkoutController.order!.products!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 28,
                          );
                        },
                        itemBuilder: (context, index) {
                          return CustomCheckoutItem(
                            product: checkoutController.order!.products![index],
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
                            onTap: onEditAddressTap,
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
                                    text: checkoutController
                                        .order!.shippingAddress!,
                                    fontSize: 14,
                                  ),
                                  CustomText(
                                    text:
                                        '${checkoutController.order!.shippingCity!} - ${checkoutController.order!.shippingZone!} - ${checkoutController.order!.shippingCountry!.tr}',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  CustomText(
                                    text:
                                        '${checkoutController.order!.shippingFirstName!} ${checkoutController.order!.shippingLastName!}',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                  CustomText(
                                    text: checkoutController.order!.phone!,
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
                            onTap: onEditShippingTap,
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
                            : checkoutController.order!.shippingCode!,
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
                            onTap: onEditPaymentTap,
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
                      if (checkoutController.order!.paymentCode == 'cod')
                        Image.asset(
                          'assets/images/cod.png',
                          height: 36,
                        )
                      else if (checkoutController.order!.paymentCode ==
                          'paytabs_creditcard')
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
                      Obx(() {
                        if (homeController.coupon.value != 'null') {
                          return CustomTextField(
                            initialValue: homeController.coupon.value,
                            readOnly: true,
                          );
                        } else {
                          return Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: CustomTextField(
                                  controller:
                                      checkoutController.couponController.value,
                                  validator: false,
                                  hintText: 'couponCode'.tr,
                                  textInputType: TextInputType.text,
                                  readOnly:
                                      checkoutController.isCouponAdded.value
                                          ? true
                                          : false,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                flex: 1,
                                child: Obx(() {
                                  if (checkoutController
                                      .isCouponLoading.value) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  return ElevatedButton(
                                    onPressed: () {
                                      if (checkoutController
                                          .isCouponAdded.value) {
                                        checkoutController.deleteCoupon(
                                          context: context,
                                        );
                                      } else {
                                        checkoutController.addCoupon(
                                          context: context,
                                          coupon: checkoutController
                                              .couponController.value.text,
                                        );
                                      }
                                    },
                                    style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(0),
                                        backgroundColor: MaterialStateProperty.all(
                                            checkoutController.isCouponAdded.value
                                                ? vermillion
                                                : almostBlack),
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        fixedSize: MaterialStateProperty.all(
                                            const Size.fromHeight(54)),
                                        shape: MaterialStateProperty.all(
                                            const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4))))),
                                    child: CustomText(
                                      text:
                                          checkoutController.isCouponAdded.value
                                              ? 'remove'.tr
                                              : 'apply'.tr,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  );
                                }),
                              ),
                            ],
                          );
                        }
                      }),
                      const SizedBox(
                        height: 28,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: checkoutController.order!.totals!.length,
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
                                  text: checkoutController
                                      .order!.totals![index].title!,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                CustomText(
                                  text: checkoutController
                                      .order!.totals![index].text!,
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
                                          '${checkoutController.order!.total.toStringAsFixed(2)} ',
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
                    onPressed: onPreviousTap,
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
                    onPressed: onConfirmOrderTap,
                    title: 'confirmOrder'.tr,
                    backgroundColor: avocado,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
