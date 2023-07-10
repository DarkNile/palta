import 'package:flutter/material.dart';
import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkLocale.dart';
import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';
import 'package:get/get.dart';
import 'package:palta/checkout/controllers/checkout_controller.dart';
import 'package:palta/checkout/view/checkout_tabs/order_info_page.dart';
import 'package:palta/checkout/view/checkout_tabs/order_summary_page.dart';
import 'package:palta/checkout/view/checkout_tabs/payment_method_page.dart';
import 'package:palta/checkout/view/checkout_tabs/shipping_address_page.dart';
import 'package:palta/checkout/view/checkout_tabs/shipping_method_page.dart';
import 'package:palta/checkout/view/payment_webview_screen.dart';
import 'package:palta/checkout/view/thank_you_screen.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/profile/controllers/profile_controller.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_text.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({
    super.key,
    required this.hasCombination,
  });

  final bool hasCombination;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen>
    with TickerProviderStateMixin {
  final _checkoutController = Get.put(CheckoutController());
  final _profileController = Get.put(ProfileController());
  late TabController _tabController;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  width: width,
                  height: 1,
                  color: veryLightPink,
                ),
                IgnorePointer(
                  child: TabBar(
                    indicator: const BoxDecoration(),
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    tabs: [
                      Container(
                        width: 24,
                        height: 24,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _tabIndex > 0
                              ? avocado
                              : _tabIndex == 0
                                  ? pineGreen
                                  : Colors.white,
                          border: _tabIndex == 0 || _tabIndex > 0
                              ? null
                              : Border.all(color: veryLightPink),
                        ),
                        child: _tabIndex > 0
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              )
                            : CustomText(
                                text: '1',
                                textAlign: TextAlign.center,
                                color:
                                    _tabIndex == 0 ? Colors.white : brownGrey,
                              ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _tabIndex > 1
                              ? avocado
                              : _tabIndex == 1
                                  ? pineGreen
                                  : Colors.white,
                          border: _tabIndex == 1 || _tabIndex > 1
                              ? null
                              : Border.all(color: veryLightPink),
                        ),
                        child: _tabIndex > 1
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              )
                            : CustomText(
                                text: '2',
                                textAlign: TextAlign.center,
                                color:
                                    _tabIndex == 1 ? Colors.white : brownGrey,
                              ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _tabIndex > 2
                              ? avocado
                              : _tabIndex == 2
                                  ? pineGreen
                                  : Colors.white,
                          border: _tabIndex == 2 || _tabIndex > 2
                              ? null
                              : Border.all(color: veryLightPink),
                        ),
                        child: _tabIndex > 2
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              )
                            : CustomText(
                                text: '3',
                                textAlign: TextAlign.center,
                                color:
                                    _tabIndex == 2 ? Colors.white : brownGrey,
                              ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _tabIndex > 3
                              ? avocado
                              : _tabIndex == 3
                                  ? pineGreen
                                  : Colors.white,
                          border: _tabIndex == 3 || _tabIndex > 3
                              ? null
                              : Border.all(color: veryLightPink),
                        ),
                        child: _tabIndex > 3
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              )
                            : CustomText(
                                text: '4',
                                textAlign: TextAlign.center,
                                color:
                                    _tabIndex == 3 ? Colors.white : brownGrey,
                              ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _tabIndex > 4
                              ? avocado
                              : _tabIndex == 4
                                  ? pineGreen
                                  : Colors.white,
                          border: _tabIndex == 4 || _tabIndex > 4
                              ? null
                              : Border.all(color: veryLightPink),
                        ),
                        child: _tabIndex > 4
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              )
                            : CustomText(
                                text: '5',
                                textAlign: TextAlign.center,
                                color:
                                    _tabIndex == 4 ? Colors.white : brownGrey,
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 21,
            ),
            Container(
              width: width,
              height: 40,
              color: pineGreen,
              padding: EdgeInsets.only(
                right: AppUtil.rtlDirection(context) ? 23 : 0,
                left: AppUtil.rtlDirection(context) ? 0 : 23,
                top: 7,
              ),
              child: CustomText(
                text: _tabIndex == 0
                    ? 'subscriptionInfo'.tr
                    : _tabIndex == 1
                        ? 'shippingAddress'.tr
                        : _tabIndex == 2
                            ? 'shippingMethod'.tr
                            : _tabIndex == 3
                                ? 'paymentMethod'.tr
                                : 'orderSummary'.tr,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            if (_tabIndex != 4)
              const SizedBox(
                height: 16,
              ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  Obx(() {
                    if (_checkoutController.isCartLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return OrderInfoPage(
                      checkoutController: _checkoutController,
                      hasCombination: widget.hasCombination,
                      onPreviousTap: () {
                        Get.back();
                      },
                      onNextTap: (String date, String fridayOn) async {
                        final isSuccess =
                            await _checkoutController.saveCalendar(
                          date: date,
                          fridayOn: fridayOn,
                        );
                        if (isSuccess) {
                          if (context.mounted) {
                            _profileController.getAddress(context: context);
                            _profileController.getCountries();
                            _profileController.getZones();
                          }
                          setState(() {
                            _tabIndex = 1;
                          });
                          _tabController.animateTo(1);
                        }
                      },
                    );
                  }),
                  Obx(() {
                    if (_profileController.isAddressLoading.value ||
                        _profileController.isCountriesLoading.value ||
                        _profileController.isZonesLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ShippingAddressPage(
                      checkoutController: _checkoutController,
                      profileController: _profileController,
                      onPreviousTap: () {
                        setState(() {
                          _tabIndex = _tabIndex - 1;
                        });
                        _tabController.animateTo(_tabIndex);
                      },
                      onNextTap: (checkedIndex) async {
                        final isSuccess =
                            await _checkoutController.addShippingAddress(
                          context: context,
                          addressId: int.parse(
                            _profileController.addresses[checkedIndex].id,
                          ),
                        );
                        if (isSuccess) {
                          if (context.mounted) {
                            _checkoutController.getShippingMethods(
                                context: context);
                          }
                          setState(() {
                            _tabIndex = 2;
                          });
                          _tabController.animateTo(2);
                        }
                      },
                    );
                  }),
                  Obx(() {
                    if (_checkoutController.isShippingMethodsLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ShippingMethodPage(
                      checkoutController: _checkoutController,
                      onPreviousTap: () {
                        setState(() {
                          _tabIndex = _tabIndex - 1;
                        });
                        _tabController.animateTo(_tabIndex);
                      },
                      onNextTap: (checkedIndex) async {
                        final isSuccess =
                            await _checkoutController.addShippingMethod(
                          context: context,
                          shippingMethodCode: _checkoutController
                              .shippingMethods[checkedIndex].quote.first.code,
                        );
                        if (isSuccess) {
                          if (context.mounted) {
                            _checkoutController.getPaymentMethods(
                                context: context);
                          }
                          setState(() {
                            _tabIndex = 3;
                          });
                          _tabController.animateTo(3);
                        }
                      },
                    );
                  }),
                  Obx(() {
                    if (_checkoutController.isPaymentMethodsLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return PaymentMethodPage(
                        checkoutController: _checkoutController,
                        onPreviousTap: () {
                          setState(() {
                            _tabIndex = _tabIndex - 1;
                          });
                          _tabController.animateTo(_tabIndex);
                        },
                        onNextTap: (checkedIndex) async {
                          final isSuccess =
                              await _checkoutController.addPaymentMethod(
                            context: context,
                            paymentMethodCode: _checkoutController
                                .paymentMethods[checkedIndex].code,
                          );
                          if (isSuccess) {
                            if (context.mounted) {
                              _checkoutController.confirmOrder(
                                  context: context);
                            }
                            setState(() {
                              _tabIndex = 4;
                            });
                            _tabController.animateTo(4);
                          }
                        });
                  }),
                  Obx(() {
                    if (_checkoutController.isConfirmOrderLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return OrderSummaryPage(
                      onPreviousTap: () {
                        setState(() {
                          _tabIndex = _tabIndex - 1;
                        });
                        _tabController.animateTo(_tabIndex);
                      },
                      checkoutController: _checkoutController,
                      onEditInfoTap: () {
                        setState(() {
                          _tabIndex = 0;
                        });
                        _tabController.animateTo(0);
                      },
                      onEditAddressTap: () {
                        setState(() {
                          _tabIndex = 1;
                        });
                        _tabController.animateTo(1);
                      },
                      onEditShippingTap: () {
                        setState(() {
                          _tabIndex = 2;
                        });
                        _tabController.animateTo(2);
                      },
                      onEditPaymentTap: () {
                        setState(() {
                          _tabIndex = 3;
                        });
                        _tabController.animateTo(3);
                      },
                      onConfirmOrderTap: () async {
                        if (_checkoutController.order!.paymentCode! ==
                            'paytabs_creditcard') {
                          Get.to(() => PaymentWebviewScreen(
                                order: _checkoutController.order!,
                                checkoutController: _checkoutController,
                              ));
                        } else if (_checkoutController.order!.paymentCode! ==
                            'cod') {
                          final isSuccess =
                              await _checkoutController.saveOrderToDatabase();
                          if (isSuccess) {
                            Get.offAll(
                              () => ThankYouScreen(
                                order: _checkoutController.order!,
                              ),
                            );
                          }
                        } else {
                          applePay(
                            double.parse(_checkoutController.order!.total
                                .toStringAsFixed(2)),
                            _checkoutController.order!.orderId!.toString(),
                          );
                        }
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void applePay(double amount, String orderId) {
    print('amount $amount');
    print('orderId $orderId');
    var configuration = PaymentSdkConfigurationDetails(
      profileId: "97390",
      serverKey: "SWJNDJZLNB-JGZRMMMTZD-HD6ZJJ666N",
      clientKey: "CPKMB9-GQPV6T-9RNNN7-D2P9MQ",
      cartId: orderId,
      cartDescription: "Pay via Apple Pay",
      merchantName: "Palta",
      screentTitle: "Pay with Card",
      locale: PaymentSdkLocale.AR,
      amount: amount,
      currencyCode: "SAR",
      merchantCountryCode: "SA",
      merchantApplePayIndentifier: "merchant.com.DigitalPartner.palta",
      simplifyApplePayValidation: true,
      billingDetails: BillingDetails(
        '${_checkoutController.order!.shippingFirstName!} ${_checkoutController.order!.shippingLastName!}',
        _checkoutController.order!.email!,
        _checkoutController.order!.phone!,
        _checkoutController.order!.shippingAddress!,
        _checkoutController.order!.shippingCountry!,
        _checkoutController.order!.shippingCity!,
        _checkoutController.order!.shippingZone!,
        '',
      ),
      shippingDetails: ShippingDetails(
        '${_checkoutController.order!.shippingFirstName!} ${_checkoutController.order!.shippingLastName!}',
        _checkoutController.order!.email!,
        _checkoutController.order!.phone!,
        _checkoutController.order!.shippingAddress!,
        _checkoutController.order!.shippingCountry!,
        _checkoutController.order!.shippingCity!,
        _checkoutController.order!.shippingZone!,
        '',
      ),
    );
    FlutterPaytabsBridge.startApplePayPayment(configuration, (event) {
      setState(() {
        setState(() {
          if (event["status"] == "success") {
            var transactionDetails = event["data"];
            print(transactionDetails);
            _checkoutController.saveOrderToDatabase();
            Get.offAll(() => ThankYouScreen(
                  order: _checkoutController.order!,
                ));
          } else if (event["status"] == "error") {
            // Handle error here.
            print(event["status"]);
          } else if (event["status"] == "event") {
            // Handle cancel events here.
            print(event["status"]);
          }
        });
      });
    });
  }
}
