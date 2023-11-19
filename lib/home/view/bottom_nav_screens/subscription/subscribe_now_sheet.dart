import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/checkout/controllers/checkout_controller.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/product/models/product.dart';
import 'package:palta/widgets/custom_text.dart';

class SubscriptionNowSheet extends StatefulWidget {
  const SubscriptionNowSheet({
    super.key,
    required this.program,
    required this.homeController,
    required this.checkoutController,
  });

  final Product program;
  final HomeController homeController;
  final CheckoutController checkoutController;

  @override
  State<SubscriptionNowSheet> createState() => _SubscriptionNowSheetState();
}

class _SubscriptionNowSheetState extends State<SubscriptionNowSheet> {
  /*int? selectedDayIndex;
  String? selectedPrice;
  String? selectedMainPrice;
  String? option1Id;
  String? option2Id;*/

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'subscriptionPeriodDays'.tr,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 44,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        widget.checkoutController.selectedDayIndex = index;
                        widget.checkoutController.selectedPrice =
                            widget.program.options!.first.option![index].price;
                        widget.checkoutController.selectedMainPrice = widget
                            .program.options!.first.option![index].mainPrice;
                        widget.checkoutController.option1Id = widget
                            .program.options!.first.productOptionId
                            .toString();
                        widget.checkoutController.option2Id = widget.program
                            .options!.first.option![index].productOptionValueId
                            .toString();
                        widget.checkoutController.isSelectedPrice.value =
                            ((widget.checkoutController.selectedPrice !=
                                    null) &&
                                (widget.checkoutController.selectedMainPrice !=
                                    null));
                        print(widget.checkoutController.option1Id);
                        print(widget.checkoutController.option2Id);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            widget.checkoutController.selectedDayIndex == index
                                ? pineGreen
                                : paleGrey,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                      ),
                      width: 82,
                      height: 44,
                      alignment: Alignment.center,
                      child: Center(
                        child: CustomText(
                          text:
                              widget.program.options!.first.option![index].name,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.center,
                          color: widget.checkoutController.selectedDayIndex ==
                                  index
                              ? Colors.white
                              : darkGrey,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 8,
                  );
                },
                itemCount: widget.program.options!.first.option!.length,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        if (widget.checkoutController.selectedPrice != null &&
            widget.checkoutController.selectedMainPrice != null)
          Column(
            children: [
              if (widget.checkoutController.selectedPrice !=
                  widget.checkoutController.selectedMainPrice)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'priceBeforeDiscount'.tr,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: widget.checkoutController.selectedMainPrice!,
                          fontSize: 20,
                          color: vermillion,
                          fontWeight: FontWeight.w700,
                          textDecoration: TextDecoration.lineThrough,
                        ),
                        CustomText(
                          text: 'riyal'.tr,
                          fontSize: 14,
                          color: vermillion,
                          fontWeight: FontWeight.w400,
                          textDecoration: TextDecoration.lineThrough,
                        ),
                      ],
                    ),
                  ],
                ),
              if (widget.checkoutController.selectedPrice !=
                  widget.checkoutController.selectedMainPrice)
                const Divider(
                  height: 24,
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: widget.checkoutController.selectedPrice !=
                            widget.checkoutController.selectedMainPrice
                        ? 'priceAfterDiscount'.tr
                        : 'total'.tr,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: widget.checkoutController.selectedPrice!,
                        fontSize: 20,
                        color: avocado,
                        fontWeight: FontWeight.w700,
                      ),
                      CustomText(
                        text: 'riyal'.tr,
                        fontSize: 14,
                        color: avocado,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(
                height: 20,
              ),
            ],
          ),
        /*if ( widget.checkoutController.selectedPrice != null &&  widget.checkoutController.selectedMainPrice != null)
          CustomButton(
            onPressed: () async {
              Get.back();
              final isSuccess = await widget.checkoutController.addToCart(
                productId: widget.program.id.toString(),
                quantity: '1',
                hasCombination: true,
                option1Id:  widget.checkoutController.option1Id,
                option2Id: widget.checkoutController. option2Id,
              );
              if (isSuccess) {
                Get.to(
                  () => const CheckoutScreen(),
                );

                FirebaseAnalytics.instance.logAddToCart(
                  items: [
                    AnalyticsEventItem(
                      itemId: widget.program.id.toString(),
                      itemName: widget.program.name,
                      price: double.parse(
                          selectedPrice.toString().split(',').join()),
                      currency: 'SAR',
                      quantity: 1,
                    ),
                  ],
                  value: double.parse(
                      selectedPrice.toString().split(',').join()),
                  currency: 'SAR',
                );
                AppsFlyerService.logAddToCart(
                  id: widget.program.id.toString(),
                  name: widget.program.name!,
                  price: double.parse(
                      selectedPrice.toString().split(',').join()),
                  currency: 'SAR',
                  quantity: 1,
                );
              }
            },
            title: 'continueSubscribing'.tr,
          ),*/
      ],
    );
  }
}
