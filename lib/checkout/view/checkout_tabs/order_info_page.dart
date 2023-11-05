import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:palta/checkout/controllers/checkout_controller.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_loading_widget.dart';
import 'package:palta/widgets/custom_text.dart';
import 'package:intl/intl.dart' hide TextDirection;

class OrderInfoPage extends StatefulWidget {
  const OrderInfoPage({
    super.key,
    required this.checkoutController,
    required this.onNextTap,
    required this.onPreviousTap,
  });

  final CheckoutController checkoutController;
  final Function(String, String) onNextTap;
  final VoidCallback onPreviousTap;

  @override
  State<OrderInfoPage> createState() => _OrderInfoPageState();
}

class _OrderInfoPageState extends State<OrderInfoPage> {
  // final _homeController = Get.put(HomeController());
  DateTime today = DateTime.now();
  // String? fridayValue;

  // @override
  // void initState() {
  //   super.initState();
  //   _homeController.getCoupon();
  // }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return widget.checkoutController.cart == null ||
            widget.checkoutController.cart!.products!.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Lottie.asset(
                'assets/lottie/no_orders.json',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24)
                    .copyWith(bottom: 40),
                child: CustomButton(
                  onPressed: () {
                    Get.back();
                  },
                  title: 'back'.tr,
                ),
              ),
            ],
          )
        : Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.checkoutController.cart!.isCombination! == 'true')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const SizedBox(
                      //   height: 36,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'subscriptionStartDate'.tr,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: 'total'.tr,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: almostBlack,
                              ),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text:
                                        ' ${widget.checkoutController.total.value.toStringAsFixed(2)} ',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: green,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'riyal'.tr,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: green,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: width,
                        height: 56,
                        decoration: BoxDecoration(
                          border: Border.all(color: veryLightPink),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: DateFormat('dd/MM/yyyy').format(today),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            InkWell(
                              onTap: () async {
                                DateTime? selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2030, 12, 31),
                                );

                                if (selectedDate != null) {
                                  setState(() {
                                    today = selectedDate;
                                  });
                                }
                              },
                              child:
                                  SvgPicture.asset('assets/icons/calendar.svg'),
                            ),
                          ],
                        ),
                      ),
                      // const SizedBox(
                      //   height: 36,
                      // ),
                      // CustomText(
                      //   text: 'fridayReceiving'.tr,
                      //   fontSize: 16,
                      //   fontWeight: FontWeight.w500,
                      // ),
                      // const SizedBox(
                      //   height: 21,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Expanded(
                      //       child: RadioListTile(
                      //         dense: true,
                      //         contentPadding: const EdgeInsets.all(0),
                      //         title: CustomText(
                      //           text: 'yes'.tr,
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.w400,
                      //         ),
                      //         value: 'yes',
                      //         groupValue: fridayValue,
                      //         onChanged: (value) {
                      //           setState(() {
                      //             fridayValue = value;
                      //           });
                      //         },
                      //       ),
                      //     ),
                      //     Expanded(
                      //       child: RadioListTile(
                      //         dense: true,
                      //         contentPadding: const EdgeInsets.all(0),
                      //         title: CustomText(
                      //           text: 'no'.tr,
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.w400,
                      //         ),
                      //         value: 'no',
                      //         groupValue: fridayValue,
                      //         onChanged: (value) {
                      //           setState(() {
                      //             fridayValue = value;
                      //           });
                      //         },
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                // const SizedBox(
                //   height: 16,
                // ),
                Expanded(
                  child: ListView.separated(
                    // physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.checkoutController.cart!.products!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        color: Colors.white,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  topRight: Radius.circular(6)),
                              child: Stack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: widget.checkoutController.cart!
                                        .products![index].originalImage!,
                                    height: 100, //96
                                    width: width,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) {
                                      return const CustomLoadingWidget();
                                    },
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //   child: CircleAvatar(
                                  //     radius: 20,
                                  //     backgroundColor: lightGrey2,
                                  //     child: IconButton(
                                  //       onPressed: () {
                                  //         widget.checkoutController
                                  //             .deleteCartItem(
                                  //                 productId: widget
                                  //                     .checkoutController
                                  //                     .cart!
                                  //                     .products![index]
                                  //                     .id
                                  //                     .toString());
                                  //         setState(() {
                                  //           widget.checkoutController.cart!
                                  //               .products!
                                  //               .remove(widget
                                  //                   .checkoutController
                                  //                   .cart!
                                  //                   .products![index]);
                                  //         });
                                  //       },
                                  //       icon: const Icon(
                                  //         Icons.delete,
                                  //         color: vermillion,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            CustomText(
                              text: widget.checkoutController.cart!
                                  .products![index].name!,
                              textAlign: TextAlign.center,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (widget.checkoutController.cart!
                                              .products![index].option !=
                                          null &&
                                      widget.checkoutController.cart!
                                          .products![index].option!.isNotEmpty)
                                    Row(
                                      children: [
                                        CustomText(
                                          text:
                                              '${'subscriptionPeriodDays'.tr}  ',
                                          textAlign: TextAlign.center,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        CustomText(
                                          text:
                                              '(${widget.checkoutController.cart!.products![index].option!.first.value.split('</br>:').join()})',
                                          textAlign: TextAlign.center,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    )
                                  else
                                    CustomText(
                                      text: 'packagePrice'.tr,
                                      textAlign: TextAlign.center,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  Row(
                                    children: [
                                      CustomText(
                                        text:
                                            '${(widget.checkoutController.cart!.products![index].priceRaw * int.parse(widget.checkoutController.cart!.products![index].quantity)).toStringAsFixed(2)} ',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: almostBlack,
                                      ),
                                      CustomText(
                                        text: 'riyal'.tr,
                                        fontSize: 12,
                                        color: black51,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Spacer(),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (widget.checkoutController.cart!
                                                  .products![index].qty !=
                                              widget.checkoutController.cart!
                                                  .products![index].quantity) {
                                            setState(() {
                                              widget
                                                  .checkoutController
                                                  .cart!
                                                  .products![index]
                                                  .quantity = (int.parse(widget
                                                          .checkoutController
                                                          .cart!
                                                          .products![index]
                                                          .quantity) +
                                                      1)
                                                  .toString();
                                            });
                                            widget.checkoutController
                                                .updateCartItemQuantity(
                                              productId: widget
                                                  .checkoutController
                                                  .cart!
                                                  .products![index]
                                                  .id
                                                  .toString(),
                                              quantity: widget
                                                  .checkoutController
                                                  .cart!
                                                  .products![index]
                                                  .quantity
                                                  .toString(),
                                            );
                                          }
                                        },
                                        child: Container(
                                          width: 32,
                                          height: 36,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: pinkishGrey,
                                            ),
                                          ),
                                          child: const CustomText(
                                            text: '+',
                                            color: black51,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 51,
                                        height: 36,
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          border: Border.symmetric(
                                            horizontal: BorderSide(
                                              color: pinkishGrey,
                                            ),
                                          ),
                                        ),
                                        child: CustomText(
                                          text: widget.checkoutController.cart!
                                              .products![index].quantity,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (widget.checkoutController.cart!
                                                  .products![index].quantity !=
                                              '1') {
                                            setState(() {
                                              widget
                                                  .checkoutController
                                                  .cart!
                                                  .products![index]
                                                  .quantity = (int.parse(widget
                                                          .checkoutController
                                                          .cart!
                                                          .products![index]
                                                          .quantity) -
                                                      1)
                                                  .toString();
                                            });
                                            widget.checkoutController
                                                .updateCartItemQuantity(
                                              productId: widget
                                                  .checkoutController
                                                  .cart!
                                                  .products![index]
                                                  .id
                                                  .toString(),
                                              quantity: widget
                                                  .checkoutController
                                                  .cart!
                                                  .products![index]
                                                  .quantity
                                                  .toString(),
                                            );
                                          }
                                        },
                                        child: Container(
                                          width: 32,
                                          height: 36,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: pinkishGrey,
                                            ),
                                          ),
                                          child: const CustomText(
                                            text: '-',
                                            color: black51,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      widget.checkoutController.deleteCartItem(
                                          productId: widget.checkoutController
                                              .cart!.products![index].id
                                              .toString());
                                      setState(() {
                                        widget
                                            .checkoutController.cart!.products!
                                            .remove(widget.checkoutController
                                                .cart!.products![index]);
                                      });
                                    },
                                    child: SvgPicture.asset(
                                      'assets/icons/delete.svg',
                                      colorFilter: const ColorFilter.mode(
                                        vermillion,
                                        BlendMode.srcIn,
                                      ),
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
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 16,
                      );
                    },
                  ),
                ),

                // const SizedBox(
                //   height: 120,
                // ),
                // const Spacer(),
                // const SizedBox(
                //   height: 16,
                // ),
                Container(
                  alignment: Alignment.bottomCenter,
                  color: Colors.white,
                  width: width,
                  height: 80,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CustomButton(
                          onPressed: widget.onPreviousTap,
                          title: 'cancel'.tr,
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
                          if (widget
                              .checkoutController.isSavingCalendar.value) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return CustomButton(
                            onPressed: () {
                              if (widget.checkoutController.cart!
                                      .isCombination! ==
                                  'true') {
                                print(DateFormat('dd/MM/yyyy').format(today));
                                // if (fridayValue != null) {
                                widget.onNextTap(
                                  DateFormat('dd/MM/yyyy').format(today),
                                  'no',
                                );
                                // } else {
                                //   AppUtil.errorToast(context, 'completeInfo'.tr);
                                // }
                              } else {
                                widget.onNextTap(
                                  '',
                                  '',
                                );
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
