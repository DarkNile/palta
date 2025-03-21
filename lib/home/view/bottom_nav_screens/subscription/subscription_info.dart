import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:palta/auth/view/login_screen.dart';
import 'package:palta/checkout/controllers/checkout_controller.dart';
import 'package:palta/checkout/view/checkout_screen.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/home/services/apps_flyer_service.dart';
import 'package:palta/home/view/bottom_nav_screens/subscription/meal.dart';
import 'package:palta/home/view/bottom_nav_screens/subscription/subscribe_now_sheet.dart';
import 'package:palta/product/models/product.dart';
import 'package:palta/profile/controllers/profile_controller.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_loading_widget.dart';
import 'package:palta/widgets/custom_text.dart';

import '../../../../widgets/custom_app_bar_clip_path.dart'; //

class SubscriptionInfo extends StatefulWidget {
  const SubscriptionInfo({
    super.key,
    this.fromAssessment = false,
    // required this.hasCombination,
    required this.program,
    // required this.programIndex,
    this.icon,
  });

  final bool fromAssessment;
  // final bool hasCombination;
  final Product program;
  final String? icon;
  // final int programIndex;

  @override
  State<SubscriptionInfo> createState() => _SubscriptionInfoState();
}

class _SubscriptionInfoState extends State<SubscriptionInfo> {
  final getStorage = GetStorage();
  final _homeController = Get.put(HomeController());
  final _checkoutController = Get.put(CheckoutController());
  final _profileController = Get.put(ProfileController());
  late String? customerId;

  final List<String> titles = [
    'possibilityToChange',
    'possibilityToStop',
    'possibilityToRequest'
  ];
  final List<String> icons = ['change', 'stop_subscription', 'explanation'];

  List<String>? mealShow;

  @override
  void initState() {
    super.initState();
    customerId = getStorage.read('customerId');
    mealShow = widget.program.mealShow?.split(',');
    _checkoutController.isSelectedPrice.value = false;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipPath(
                        clipper: CustomAppBarClipPath(),
                        child: CachedNetworkImage(
                          imageUrl: widget.program.originalImage!,
                          fit: BoxFit.cover,
                          width: width,
                          height: 300,
                          placeholder: (context, url) {
                            return const CustomLoadingWidget();
                          },
                        ),
                      ),
                      SizedBox(
                        height: height * 0.06,
                      ),
                      Center(
                        child: CustomText(
                          text: widget.program.name!,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 14.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Center(
                          child: CustomText(
                            text: widget.program.description!
                                .split('&nbsp;')
                                .join(),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: brownishGrey,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          width: 48,
                          height: 1,
                          color: brownishGrey,
                          alignment: Alignment.center,
                        ),
                      ),
                      widget.fromAssessment
                          ? Container(
                              margin: const EdgeInsets.only(top: 20),
                              color: offWhite,
                              height: 82,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 36),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        CustomText(
                                          text: 'calories'.tr,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          width: 63,
                                          height: 26,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: orange,
                                          ),
                                          child: const Center(
                                            child: CustomText(
                                              text: '220',
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        CustomText(
                                          text: 'carbohydrates'.tr,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          width: 63,
                                          height: 26,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: orange,
                                          ),
                                          child: const Center(
                                            child: CustomText(
                                              text: '220',
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        CustomText(
                                          text: 'fat'.tr,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          width: 63,
                                          height: 26,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: orange,
                                          ),
                                          child: const Center(
                                            child: CustomText(
                                              text: '220',
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        CustomText(
                                          text: 'protein'.tr,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          width: 63,
                                          height: 26,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: orange,
                                          ),
                                          child: const Center(
                                            child: CustomText(
                                              text: '220',
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ]),
                            )
                          : Container(),
                      // if (widget.hasCombination)
                      Column(
                        children: [
                          // Breakfast Dishes
                          if (mealShow == null || mealShow!.contains("1"))
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, right: 28, left: 28),
                                  child: CustomText(
                                    text: 'breakfastDishes'.tr,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 21,
                                ),
                                Obx(() {
                                  if (_homeController.isInfoLoading.value) {
                                    return const CustomLoadingWidget();
                                  }
                                  return SizedBox(
                                    height: 180,
                                    width: double.infinity,
                                    child: ListView.separated(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        itemCount: _homeController
                                            .breakfastMeals.length,
                                        scrollDirection: Axis.horizontal,
                                        separatorBuilder: (context, index) {
                                          return const SizedBox(
                                            width: 17,
                                          );
                                        },
                                        itemBuilder: (context, index) {
                                          return Meal(
                                            // programIndex: widget.programIndex,
                                            mealIndex: index,
                                            title: _homeController
                                                .breakfastMeals[index].name!,
                                            image: _homeController
                                                .breakfastMeals[index]
                                                .originalImage!,
                                            description: _homeController
                                                .breakfastMeals[index]
                                                .description!,
                                            price: _homeController
                                                .breakfastMeals[index]
                                                .priceFormated!,
                                            mealData: _homeController
                                                .breakfastMeals[index]
                                                .mealData!,
                                          );
                                        }),
                                  );
                                }),
                              ],
                            ),
                          // Breakfast Dishes
                          if (mealShow == null || mealShow!.contains("1"))
                            const Divider(
                              thickness: 6,
                              color: paleGrey,
                            ),
                          // Lunch Dishes
                          if (mealShow == null || mealShow!.contains("2"))
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, right: 28, left: 28),
                                  child: CustomText(
                                    text: 'lunchDishes'.tr,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 21,
                                ),
                                Obx(() {
                                  if (_homeController.isInfoLoading.value) {
                                    return const CustomLoadingWidget();
                                  }
                                  return SizedBox(
                                    height: 180,
                                    width: double.infinity,
                                    child: ListView.separated(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        itemCount:
                                            _homeController.lunchMeals.length,
                                        scrollDirection: Axis.horizontal,
                                        separatorBuilder: (context, index) {
                                          return const SizedBox(
                                            width: 17,
                                          );
                                        },
                                        itemBuilder: (context, index) {
                                          return Meal(
                                            // programIndex: widget.programIndex,
                                            mealIndex: index,
                                            title: _homeController
                                                .lunchMeals[index].name!,
                                            image: _homeController
                                                .lunchMeals[index]
                                                .originalImage!,
                                            description: _homeController
                                                .lunchMeals[index].description!,
                                            price: _homeController
                                                .lunchMeals[index]
                                                .priceFormated!,
                                            mealData: _homeController
                                                .lunchMeals[index].mealData!,
                                          );
                                        }),
                                  );
                                }),
                              ],
                            ),
                          // Lunch Dishes
                          if (mealShow == null || mealShow!.contains("2"))
                            const Divider(
                              thickness: 6,
                              color: paleGrey,
                            ),
                          // Dinner Dishes
                          if (mealShow == null || mealShow!.contains("3"))
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, right: 28, left: 28),
                                  child: CustomText(
                                    text: 'dinnerDishes'.tr,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 21,
                                ),
                                Obx(
                                  () {
                                    if (_homeController.isInfoLoading.value) {
                                      return const CustomLoadingWidget();
                                    }
                                    return SizedBox(
                                      height: 180,
                                      width: double.infinity,
                                      child: ListView.separated(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          itemCount: _homeController
                                              .dinnerMeals.length,
                                          scrollDirection: Axis.horizontal,
                                          separatorBuilder: (context, index) {
                                            return const SizedBox(
                                              width: 17,
                                            );
                                          },
                                          itemBuilder: (context, index) {
                                            return Meal(
                                              // programIndex: widget.programIndex,
                                              mealIndex: index,
                                              title: _homeController
                                                  .dinnerMeals[index].name!,
                                              image: _homeController
                                                  .dinnerMeals[index]
                                                  .originalImage!,
                                              description: _homeController
                                                  .dinnerMeals[index]
                                                  .description!,
                                              price: _homeController
                                                  .dinnerMeals[index]
                                                  .priceFormated!,
                                              mealData: _homeController
                                                  .dinnerMeals[index].mealData!,
                                            );
                                          }),
                                    );
                                  },
                                ),
                              ],
                            ),
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //       top: 31, right: 28, left: 28),
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [
                          //       Center(
                          //           child: CustomText(
                          //         text: 'throughAccountYouCanControl'.tr,
                          //         fontSize: 18,
                          //         fontWeight: FontWeight.w600,
                          //         textAlign: TextAlign.center,
                          //       )),
                          //       const SizedBox(
                          //         height: 21,
                          //       ),
                          //       SizedBox(
                          //         height: 140,
                          //         child: ListView.separated(
                          //           itemCount: 3,
                          //           shrinkWrap: true,
                          //           scrollDirection: Axis.horizontal,
                          //           separatorBuilder: (context, index) {
                          //             return const SizedBox(
                          //               width: 12,
                          //             );
                          //           },
                          //           itemBuilder: (context, index) {
                          //             return CustomHomeCard(
                          //               title: titles[index],
                          //               icon: icons[index],
                          //             );
                          //           },
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (widget.icon != null)
                    Positioned(
                      top: height * 0.27,
                      right: width * 0.38,
                      // child: Container(
                      //   width: 90.0,
                      //   height: 90.0,
                      //   padding: const EdgeInsets.all(10),
                      //   decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //         image:
                      //             AssetImage('assets/icons/${widget.icon}.png')),
                      //     // boxShadow: [
                      //     //   BoxShadow(
                      //     //       color: lightGrey2,
                      //     //       blurRadius: 4,
                      //     //       spreadRadius: 2,
                      //     //       offset: Offset(0, 3))
                      //     // ],
                      //     color: Colors.white,
                      //     borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      //   ),
                      //   // child:
                      //   // SvgPicture.asset('assets/icons/${widget.icon}.svg'),
                      //   // Image.asset('assets/icons/${widget.icon}.png'),
                      // ),
                      child: Card(
                        color: Colors.white,
                        elevation: 10,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(45)),
                        ),
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(45)),
                            image: DecorationImage(
                              image: AssetImage('assets/icons/subscribe.png'),
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  Positioned(
                    top: 200,
                    child: SizedBox(
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.arrow_back_ios_outlined,
                                  size: 20,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                await FlutterShare.share(
                                  title: widget.program.name!,
                                  linkUrl: widget.program.url,
                                  chooserTitle: 'Share ${widget.program.name}',
                                );
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child:
                                    SvgPicture.asset('assets/icons/share.svg'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(
              () => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                width: width,
                height: _checkoutController.isSelectedPrice.value ? 300 : 210,
                color: Colors.white,
                child: Column(
                  children: [
                    SubscriptionNowSheet(
                      program: widget.program,
                      homeController: _homeController,
                      checkoutController: _checkoutController,
                    ),
                    CustomButton(
                      onPressed: () async {
                        if (customerId != null &&
                            customerId!.isNotEmpty &&
                            customerId ==
                                _profileController.user.value.id.toString()) {
                          if (widget.program.options != null &&
                              widget.program.options!.isNotEmpty) {
                            if (_checkoutController.selectedPrice != null &&
                                _checkoutController.selectedMainPrice != null) {
                              final isSuccess =
                                  await _checkoutController.addToCart(
                                productId: widget.program.id.toString(),
                                quantity: '1',
                                hasCombination: true,
                                option1Id: _checkoutController.option1Id,
                                option2Id: _checkoutController.option2Id,
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
                                      price: double.parse(_checkoutController
                                          .selectedPrice
                                          .toString()
                                          .split(',')
                                          .join()),
                                      currency: 'SAR',
                                      quantity: 1,
                                    ),
                                  ],
                                  value: double.parse(_checkoutController
                                      .selectedPrice
                                      .toString()
                                      .split(',')
                                      .join()),
                                  currency: 'SAR',
                                );
                                AppsFlyerService.logAddToCart(
                                  id: widget.program.id.toString(),
                                  name: widget.program.name!,
                                  price: double.parse(_checkoutController
                                      .selectedPrice
                                      .toString()
                                      .split(',')
                                      .join()),
                                  currency: 'SAR',
                                  quantity: 1,
                                );
                              }
                            }
                          } else {
                            final isSuccess =
                                await _checkoutController.addToCart(
                              productId: widget.program.id.toString(),
                              quantity: '1',
                              hasCombination: false,
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
                                        widget.program.price.toString()),
                                    currency: 'SAR',
                                    quantity: int.parse(
                                        widget.program.quantity.toString()),
                                  ),
                                ],
                                value: double.parse(
                                    widget.program.price.toString()),
                                currency: 'SAR',
                              );
                              AppsFlyerService.logAddToCart(
                                id: widget.program.id.toString(),
                                name: widget.program.name!,
                                price: double.parse(
                                    widget.program.price.toString()),
                                currency: 'SAR',
                                quantity: 1,
                              );
                            }
                          }
                        } else {
                          Get.to(() => const LoginScreen());
                        }
                      },
                      title: 'subscribeNow'.tr,
                    ),
                    /* Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: 'startFrom'.tr,
                              ),
                              Row(
                                children: [
                                  CustomText(
                                    text:
                                        '${double.parse(widget.program.price.toString()).toStringAsFixed(2)} ',
                                    fontSize: 20,
                                    color: avocado,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  CustomText(
                                    text: 'riyal'.tr,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: _checkoutController.isAddToCart.value
                              ? const Center(child: CircularProgressIndicator())
                              : CustomButton(
                                  onPressed: () async {
                                    if (customerId != null &&
                                        customerId!.isNotEmpty &&
                                        customerId ==
                                            _profileController.user.value.id
                                                .toString()) {
                                      if (widget.program.options != null &&
                                          widget.program.options!.isNotEmpty) {
                                        if (_checkoutController.selectedPrice !=
                                                null &&
                                            _checkoutController
                                                    .selectedMainPrice !=
                                                null) {
                                          final isSuccess =
                                              await _checkoutController
                                                  .addToCart(
                                            productId:
                                                widget.program.id.toString(),
                                            quantity: '1',
                                            hasCombination: true,
                                            option1Id:
                                                _checkoutController.option1Id,
                                            option2Id:
                                                _checkoutController.option2Id,
                                          );
                                          if (isSuccess) {
                                            Get.to(
                                              () => const CheckoutScreen(),
                                            );
    
                                            FirebaseAnalytics.instance
                                                .logAddToCart(
                                              items: [
                                                AnalyticsEventItem(
                                                  itemId: widget.program.id
                                                      .toString(),
                                                  itemName: widget.program.name,
                                                  price: double.parse(
                                                      _checkoutController
                                                          .selectedPrice
                                                          .toString()
                                                          .split(',')
                                                          .join()),
                                                  currency: 'SAR',
                                                  quantity: 1,
                                                ),
                                              ],
                                              value: double.parse(
                                                  _checkoutController
                                                      .selectedPrice
                                                      .toString()
                                                      .split(',')
                                                      .join()),
                                              currency: 'SAR',
                                            );
                                            AppsFlyerService.logAddToCart(
                                              id: widget.program.id.toString(),
                                              name: widget.program.name!,
                                              price: double.parse(
                                                  _checkoutController
                                                      .selectedPrice
                                                      .toString()
                                                      .split(',')
                                                      .join()),
                                              currency: 'SAR',
                                              quantity: 1,
                                            );
                                          }
                                        }
                                      } else {
                                        final isSuccess =
                                            await _checkoutController.addToCart(
                                          productId:
                                              widget.program.id.toString(),
                                          quantity: '1',
                                          hasCombination: false,
                                        );
                                        if (isSuccess) {
                                          Get.to(
                                            () => const CheckoutScreen(),
                                          );
                                          FirebaseAnalytics.instance
                                              .logAddToCart(
                                            items: [
                                              AnalyticsEventItem(
                                                itemId: widget.program.id
                                                    .toString(),
                                                itemName: widget.program.name,
                                                price: double.parse(widget
                                                    .program.price
                                                    .toString()),
                                                currency: 'SAR',
                                                quantity: int.parse(widget
                                                    .program.quantity
                                                    .toString()),
                                              ),
                                            ],
                                            value: double.parse(widget
                                                .program.price
                                                .toString()),
                                            currency: 'SAR',
                                          );
                                          AppsFlyerService.logAddToCart(
                                            id: widget.program.id.toString(),
                                            name: widget.program.name!,
                                            price: double.parse(widget
                                                .program.price
                                                .toString()),
                                            currency: 'SAR',
                                            quantity: 1,
                                          );
                                        }
                                      }
                                    } else {
                                      Get.to(() => const LoginScreen());
                                    }
                                  },
                                  title: 'subscribeNow'.tr,
                                ),
                        ),
                      ],
                    ),*/
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
