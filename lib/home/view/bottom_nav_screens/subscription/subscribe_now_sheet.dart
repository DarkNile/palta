import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/checkout/controllers/checkout_controller.dart';
import 'package:palta/checkout/view/checkout_screen.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
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
  int? selectedNumberIndex;
  String? selectedPrice;
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
              Obx(() {
                if (widget.homeController.isCombinationsLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                widget.homeController.combinations.sort(
                    (a, b) => int.parse(a.days).compareTo(int.parse(b.days)));
                return SizedBox(
                  height: 48,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedDayIndex = index;
                            selectedNumberIndex = null;
                            selectedPrice = null;
                          });
                          widget.homeController.getSubCombination(
                            productId: widget.program.id.toString(),
                            optionId: widget
                                .homeController.combinations[index].optionId,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedDayIndex == index
                                ? pineGreen
                                : paleGrey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                          ),
                          width: 82,
                          height: 48,
                          alignment: Alignment.center,
                          child: Center(
                            child: CustomText(
                              text: widget
                                  .homeController.combinations[index].days,
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
                    itemCount: widget.homeController.combinations.length,
                  ),
                );
              }),
              const SizedBox(
                height: 32,
              ),
              CustomText(
                text: 'numberOfPerson'.tr,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 19,
              ),
              Obx(() {
                if (widget.homeController.isSubCombinationsLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                widget.homeController.subCombinations.sort((a, b) =>
                    int.parse(a.numberOfIndividuals)
                        .compareTo(int.parse(b.numberOfIndividuals)));
                return SizedBox(
                  height: 48,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedNumberIndex = index;
                            selectedPrice = widget
                                .homeController.subCombinations[index].price;
                            option1Id = widget.homeController
                                .subCombinations[index].option1Id;
                            option2Id = widget.homeController
                                .subCombinations[index].option2Id;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedNumberIndex == index
                                ? pineGreen
                                : paleGrey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                          ),
                          width: 64,
                          height: 48,
                          alignment: Alignment.center,
                          child: Center(
                            child: CustomText(
                              text: widget.homeController.subCombinations[index]
                                  .numberOfIndividuals,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.center,
                              color: selectedNumberIndex == index
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
                    itemCount: widget.homeController.subCombinations.length,
                  ),
                );
              }),
            ],
          ),
          if (selectedPrice != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'total'.tr,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                Row(
                  children: [
                    CustomText(
                      text:
                          '${double.parse(selectedPrice.toString()).toStringAsFixed(2)} ',
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
          if (selectedPrice != null)
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
                    () => const CheckoutScreen(
                      hasCombination: true,
                    ),
                  );

                  FirebaseAnalytics.instance.logAddToCart(
                    items: [
                      AnalyticsEventItem(
                        itemId: widget.program.id.toString(),
                        itemName: widget.program.name,
                        price: double.parse(selectedPrice.toString()),
                        currency: 'SAR',
                        quantity: int.parse(widget.program.quantity.toString()),
                      ),
                    ],
                    value: double.parse(selectedPrice.toString()),
                    currency: 'SAR',
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
