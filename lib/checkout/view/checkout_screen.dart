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
import 'package:palta/checkout/view/thank_you_screen.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/profile/controllers/profile_controller.dart';
import 'package:palta/profile/models/city.dart';
import 'package:palta/profile/models/district.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_drop_down.dart';
import 'package:palta/widgets/custom_text.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({
    super.key,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen>
    with TickerProviderStateMixin {
  final _checkoutController = Get.put(CheckoutController());
  final _profileController = Get.put(ProfileController());
  final _homeController = Get.put(HomeController());
  late TabController _tabController;
  int _tabIndex = 0;
  final _formKey = GlobalKey<FormState>();
  City? city;
  District? district;

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
                      onPreviousTap: () {
                        Get.back();
                      },
                      onNextTap:
                          (String date, String fridayOn, String satOn) async {
                        final isSuccess =
                            await _checkoutController.saveCalendar(
                                date: date, fridayOn: fridayOn, satOn: satOn);
                        if (isSuccess) {
                          if (context.mounted) {
                            _profileController.getAddress(context: context);
                            _profileController.getCountries();
                            _profileController.getZones();
                            _profileController.getCitiesByZoneId(
                                zoneId: '2884');
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
                        await showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                          builder: (context) {
                            return Container(
                              padding: const EdgeInsets.all(24),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: CustomText(
                                        text: 'shippingAddress'.tr,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    CustomText(
                                      text: 'city'.tr,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Obx(() {
                                      if (_profileController
                                          .isCitiesLoading.value) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      return CustomDropDown(
                                        value: city,
                                        hintText: 'city'.tr,
                                        items: _profileController.cities,
                                        onChanged: (value) {
                                          city = value;
                                          district = null;
                                          _profileController.getDistricts(
                                              city: city!.name);
                                        },
                                      );
                                    }),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    CustomText(
                                      text: 'district'.tr,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Obx(() {
                                      if (_profileController
                                          .isDistrictsLoading.value) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      return CustomDropDown(
                                        isDistrict: true,
                                        value: district,
                                        hintText: 'district'.tr,
                                        items: _profileController.districts,
                                        onChanged: (value) {
                                          district = value;
                                        },
                                      );
                                    }),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Obx(() {
                                      if (_profileController
                                          .isSavingDistrict.value) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      return CustomButton(
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            final isSuccess =
                                                await _profileController
                                                    .saveDistrict(
                                              context: context,
                                              cityId: city!.name,
                                              districtId: district!.districtId,
                                            );
                                            print(city!.name);
                                            print(district!.districtId);
                                            _checkoutController
                                                .district(district!.districtAr);
                                            if (isSuccess && context.mounted) {
                                              final isShippingSuccess =
                                                  await _checkoutController
                                                      .addShippingAddress(
                                                context: context,
                                                addressId: int.parse(
                                                  _profileController
                                                      .addresses[checkedIndex]
                                                      .id,
                                                ),
                                              );
                                              if (isShippingSuccess &&
                                                  context.mounted) {
                                                await _checkoutController
                                                    .getShippingMethods(
                                                        context: context);
                                                Get.back();
                                                setState(() {
                                                  _tabIndex = 2;
                                                });
                                                _tabController.animateTo(2);
                                              }
                                            }
                                          }
                                        },
                                        title: 'save'.tr,
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                        // final isSuccess =
                        //     await _checkoutController.addShippingAddress(
                        //   context: context,
                        //   addressId: int.parse(
                        //     _profileController.addresses[checkedIndex].id,
                        //   ),
                        // );
                        // if (isSuccess) {
                        //   if (context.mounted) {
                        //     _checkoutController.getShippingMethods(
                        //         context: context);
                        //   }
                        //   setState(() {
                        //     _tabIndex = 2;
                        //   });
                        //   _tabController.animateTo(2);
                        // }
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
                        print(_checkoutController
                            .shippingMethods[checkedIndex].quote.first.code);
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
                              // _homeController.getCoupon();
                              await _checkoutController.confirmOrder(
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
                    if (
                        // _homeController.isCouponLoading.value ||
                        _checkoutController.isConfirmOrderLoading.value) {
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
                      homeController: _homeController,
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
                        print(
                            'comment from controller: ${_checkoutController.notesController.value.text}');
                        print(
                            'order number: ${_checkoutController.order!.orderId}');
                        if (_checkoutController.order!.paymentCode! ==
                            'paytabs_creditcard') {
                          payWithVisa(
                            double.parse(_checkoutController.order!.total
                                .toStringAsFixed(2)),
                            _checkoutController.order!.orderId!.toString(),
                          );
                        } else if (_checkoutController.order!.paymentCode! ==
                            'paytabs_applepay') {
                          applePay(
                            double.parse(_checkoutController.order!.total
                                .toStringAsFixed(2)),
                            _checkoutController.order!.orderId!.toString(),
                          );
                        } else {
                          final isSuccess = await _checkoutController.addNote(
                            order: _checkoutController.order!,
                          );
                          if (isSuccess) {
                            Get.offAll(
                              () => ThankYouScreen(
                                order: _checkoutController.order!,
                              ),
                            );
                          }
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

  void payWithVisa(double amount, String orderId) {
    print('amount $amount');
    print('orderId $orderId');
    var configuration = PaymentSdkConfigurationDetails(
      profileId: "97390",
      serverKey: "SWJNDJZLNB-JGZRMMMTZD-HD6ZJJ666N",
      clientKey: "CPKMB9-GQPV6T-9RNNN7-D2P9MQ",
      cartId: orderId,
      cartDescription: "Pay with Card",
      merchantName: "Palta",
      screentTitle: "Pay with Card",
      locale: PaymentSdkLocale.AR,
      amount: amount,
      currencyCode: "SAR",
      merchantCountryCode: "SA",
      billingDetails: BillingDetails(
        '${_checkoutController.order!.shippingFirstName!} ${_checkoutController.order!.shippingLastName!}',
        _checkoutController.order!.email!,
        _checkoutController.order!.phone!,
        _checkoutController.order!.shippingAddress!,
        'SA',
        _checkoutController.order!.shippingCity!,
        _checkoutController.order!.shippingZone!,
        '',
      ),
      shippingDetails: ShippingDetails(
        '${_checkoutController.order!.shippingFirstName!} ${_checkoutController.order!.shippingLastName!}',
        _checkoutController.order!.email!,
        _checkoutController.order!.phone!,
        _checkoutController.order!.shippingAddress!,
        'SA',
        _checkoutController.order!.shippingCity!,
        _checkoutController.order!.shippingZone!,
        '',
      ),
    );
    FlutterPaytabsBridge.startCardPayment(configuration, (event) {
      print(event);
      setState(() {
        setState(() {
          if (event["status"] == "success") {
            var transactionDetails = event["data"];
            print(transactionDetails);
            print('${transactionDetails["isSuccess"]}');
            if (transactionDetails["isSuccess"]) {
              print("successful transaction");
              _checkoutController.addNote(
                order: _checkoutController.order!,
              );
              Get.offAll(() => ThankYouScreen(
                    order: _checkoutController.order!,
                  ));
            } else {
              print("failed transaction");
              AppUtil.errorToast(context, 'paymentFailed'.tr);
            }
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
            print('${transactionDetails["isSuccess"]}');
            if (transactionDetails["isSuccess"]) {
              print("successful transaction");
              _checkoutController.addNote(
                order: _checkoutController.order!,
              );
              Get.offAll(() => ThankYouScreen(
                    order: _checkoutController.order!,
                  ));
            } else {
              print("failed transaction");
              AppUtil.errorToast(context, 'paymentFailed'.tr);
            }
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
