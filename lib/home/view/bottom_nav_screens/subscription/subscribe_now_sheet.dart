import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/checkout/controllers/checkout_controller.dart';
import 'package:palta/checkout/view/checkout_screen.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/home/services/apps_flyer_service.dart';
import 'package:palta/product/models/product.dart';
import 'package:palta/widgets/custom_button.dart';
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
  int? selectedDayIndex;
  String? selectedPrice;
  String? selectedMainPrice;
  String? option1Id;
  String? option2Id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: Column(
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
                height: 19,
              ),
              SizedBox(
                height: 48,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedDayIndex = index;
                          selectedPrice = widget
                              .program.options!.first.option![index].price;
                          selectedMainPrice = widget
                              .program.options!.first.option![index].mainPrice;
                          option1Id = widget
                              .program.options!.first.productOptionId
                              .toString();
                          option2Id = widget.program.options!.first
                              .option![index].productOptionValueId
                              .toString();
                          print(option1Id);
                          print(option2Id);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              selectedDayIndex == index ? pineGreen : paleGrey,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                        ),
                        width: 82,
                        height: 48,
                        alignment: Alignment.center,
                        child: Center(
                          child: CustomText(
                            text: widget
                                .program.options!.first.option![index].name,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.center,
                            color: selectedDayIndex == index
                                ? Colors.white
                                : darkGrey,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 9,
                    );
                  },
                  itemCount: widget.program.options!.first.option!.length,
                ),
              ),
            ],
          ),
          if (selectedPrice != null && selectedMainPrice != null)
            Column(
              children: [
                if (selectedPrice != selectedMainPrice)
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
                            text: selectedMainPrice!,
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
                if (selectedPrice != selectedMainPrice)
                  const Divider(
                    height: 32,
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: selectedPrice != selectedMainPrice
                          ? 'priceAfterDiscount'.tr
                          : 'total'.tr,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: selectedPrice!,
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
              ],
            ),
          if (selectedPrice != null && selectedMainPrice != null)
            CustomButton(
              onPressed: () async {
                Get.back();
                final isSuccess = await widget.checkoutController.addToCart(
                  productId: widget.program.id.toString(),
                  quantity: '1',
                  hasCombination: true,
                  option1Id: option1Id,
                  option2Id: option2Id,
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
            ),
        ],
      ),
    );
  }
}
