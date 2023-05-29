import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/checkout/controllers/checkout_controller.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/product/models/option.dart';
import 'package:palta/product/models/product.dart';
import 'package:palta/product/view/product_screen.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_loading_widget.dart';
import 'package:palta/widgets/custom_text.dart';

class CustomProductCard extends StatefulWidget {
  const CustomProductCard({
    super.key,
    required this.product,
    required this.categoryId,
    this.showName = false,
    this.isRelated = false,
    this.isFromProducts = false,
    this.isListViewLayout = false,
  });

  final Product product;
  final String categoryId;
  final bool showName;
  final bool isRelated;
  final bool isFromProducts;
  final bool isListViewLayout;

  @override
  State<CustomProductCard> createState() => _CustomProductCardState();
}

class _CustomProductCardState extends State<CustomProductCard> {
  final _homeController = Get.put(HomeController());
  final _checkoutController = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.isRelated) {
          Get.back();
          Get.to(
            () => ProductScreen(
              product: widget.product,
              categoryId: widget.categoryId,
            ),
          );
        } else {
          Get.to(
            () => ProductScreen(
              product: widget.product,
              categoryId: widget.categoryId,
            ),
          );
        }
      },
      child: widget.isListViewLayout
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: widget.product.originalImage!,
                        width: 170,
                        height: 337,
                        placeholder: (context, url) {
                          return const CustomLoadingWidget();
                        },
                      ),
                      Positioned(
                        top: 8,
                        bottom: 8,
                        left: 48,
                        right: 24,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              textDirection: TextDirection.ltr,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      widget.product.fav = !widget.product.fav!;
                                    });
                                    if (widget.product.fav!) {
                                      _homeController.addToWishlist(
                                        id: widget.product.id.toString(),
                                      );
                                    } else {
                                      _homeController.deleteFromWishlist(
                                        id: widget.product.id.toString(),
                                      );
                                    }
                                  },
                                  child: Icon(
                                    widget.product.fav!
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: widget.product.fav!
                                        ? vermillion
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () async {
                                Option? option;
                                bool noSizeSelected = false;
                                int? productOptionId;
                                await showDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (context) {
                                      return StatefulBuilder(
                                          builder: (context, setState) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              title: CustomText(
                                                text: 'chooseYourSize'.tr,
                                                textAlign: TextAlign.center,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: [
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: ListView.separated(
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount: widget
                                                            .product
                                                            .options!
                                                            .first
                                                            .option!
                                                            .length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                option = widget
                                                                        .product
                                                                        .options!
                                                                        .first
                                                                        .option![
                                                                    index];
                                                              });
                                                              print(
                                                                  option!.name);
                                                            },
                                                            child: Container(
                                                              width: 60,
                                                              height: 30,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            8)),
                                                                color: option !=
                                                                            null &&
                                                                        option ==
                                                                            widget.product.options!.first.option![
                                                                                index]
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .grey,
                                                              ),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: CustomText(
                                                                text: widget
                                                                    .product
                                                                    .options!
                                                                    .first
                                                                    .option![
                                                                        index]
                                                                    .name,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        separatorBuilder:
                                                            (context, index) {
                                                          return const SizedBox(
                                                            width: 8,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    if (noSizeSelected == true)
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                    if (noSizeSelected == true)
                                                      CustomText(
                                                        text: 'chooseSize'.tr,
                                                        color: vermillion,
                                                      ),
                                                    const SizedBox(
                                                      height: 40,
                                                    ),
                                                    ElevatedButton.icon(
                                                      style: ButtonStyle(
                                                        fixedSize:
                                                            MaterialStateProperty
                                                                .all(const Size
                                                                        .fromHeight(
                                                                    40)),
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(
                                                                    vermillion),
                                                        foregroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .white),
                                                        shape: MaterialStateProperty.all(
                                                            const RoundedRectangleBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            8)))),
                                                      ),
                                                      onPressed: () async {
                                                        if (option == null) {
                                                          setState(() {
                                                            noSizeSelected =
                                                                true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            noSizeSelected =
                                                                false;
                                                          });
                                                          productOptionId = widget
                                                              .product
                                                              .options!
                                                              .first
                                                              .productOptionId;
                                                          print(
                                                              productOptionId);
                                                          print(option!
                                                              .productOptionValueId);
                                                          final isSuccess =
                                                              await _checkoutController
                                                                  .addToCart(
                                                            productId: widget
                                                                .product.id
                                                                .toString(),
                                                            quantity: '1',
                                                            productOptionId:
                                                                productOptionId
                                                                    .toString(),
                                                            productOptionValueId:
                                                                option!
                                                                    .productOptionValueId
                                                                    .toString(),
                                                          );
                                                          if (isSuccess) {
                                                            if (context
                                                                .mounted) {
                                                              Get.back();
                                                              AppUtil
                                                                  .successToast(
                                                                context,
                                                                'productAddedToCart'
                                                                    .tr,
                                                              );
                                                            }
                                                          }
                                                        }
                                                      },
                                                      label: CustomText(
                                                        text: 'addToCart'.tr,
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      icon: const Icon(
                                                        Icons
                                                            .add_shopping_cart_outlined,
                                                        color: Colors.white,
                                                        size: 18,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                onTap: () {
                                                  Get.back();
                                                },
                                                child: Container(
                                                  height: 35,
                                                  width: 35,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Colors.transparent,
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  child: const Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      });
                                    });
                              },
                              child: Container(
                                width: 28,
                                height: 28,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.add_shopping_cart,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 170,
                        child: CustomText(
                          text: widget.product.name!,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text:
                                '${double.parse(widget.product.price.toString()).toStringAsFixed(2)} ',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: 'riyal'.tr,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: widget.product.originalImage!,
                        width: 170,
                        height: 337,
                        placeholder: (context, url) {
                          return const CustomLoadingWidget();
                        },
                      ),
                      Positioned(
                        top: widget.isFromProducts ? 8 : 16,
                        bottom: widget.isFromProducts ? 8 : 16,
                        left: 8,
                        right: 8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              textDirection: TextDirection.ltr,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      widget.product.fav = !widget.product.fav!;
                                    });
                                    if (widget.product.fav!) {
                                      _homeController.addToWishlist(
                                        id: widget.product.id.toString(),
                                      );
                                    } else {
                                      _homeController.deleteFromWishlist(
                                        id: widget.product.id.toString(),
                                      );
                                    }
                                  },
                                  child: Icon(
                                    widget.product.fav!
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: widget.product.fav!
                                        ? vermillion
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () async {
                                Option? option;
                                bool noSizeSelected = false;
                                int? productOptionId;
                                await showDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (context) {
                                      return StatefulBuilder(
                                          builder: (context, setState) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              title: CustomText(
                                                text: 'chooseYourSize'.tr,
                                                textAlign: TextAlign.center,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: [
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: ListView.separated(
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount: widget
                                                            .product
                                                            .options!
                                                            .first
                                                            .option!
                                                            .length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                option = widget
                                                                        .product
                                                                        .options!
                                                                        .first
                                                                        .option![
                                                                    index];
                                                              });
                                                              print(
                                                                  option!.name);
                                                            },
                                                            child: Container(
                                                              width: 60,
                                                              height: 30,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            8)),
                                                                color: option !=
                                                                            null &&
                                                                        option ==
                                                                            widget.product.options!.first.option![
                                                                                index]
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .grey,
                                                              ),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: CustomText(
                                                                text: widget
                                                                    .product
                                                                    .options!
                                                                    .first
                                                                    .option![
                                                                        index]
                                                                    .name,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        separatorBuilder:
                                                            (context, index) {
                                                          return const SizedBox(
                                                            width: 8,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    if (noSizeSelected == true)
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                    if (noSizeSelected == true)
                                                      CustomText(
                                                        text: 'chooseSize'.tr,
                                                        color: vermillion,
                                                      ),
                                                    const SizedBox(
                                                      height: 40,
                                                    ),
                                                    ElevatedButton.icon(
                                                      style: ButtonStyle(
                                                        fixedSize:
                                                            MaterialStateProperty
                                                                .all(const Size
                                                                        .fromHeight(
                                                                    40)),
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(
                                                                    vermillion),
                                                        foregroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .white),
                                                        shape: MaterialStateProperty.all(
                                                            const RoundedRectangleBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            8)))),
                                                      ),
                                                      onPressed: () async {
                                                        if (option == null) {
                                                          setState(() {
                                                            noSizeSelected =
                                                                true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            noSizeSelected =
                                                                false;
                                                          });
                                                          productOptionId = widget
                                                              .product
                                                              .options!
                                                              .first
                                                              .productOptionId;
                                                          print(
                                                              productOptionId);
                                                          print(option!
                                                              .productOptionValueId);
                                                          final isSuccess =
                                                              await _checkoutController
                                                                  .addToCart(
                                                            productId: widget
                                                                .product.id
                                                                .toString(),
                                                            quantity: '1',
                                                            productOptionId:
                                                                productOptionId
                                                                    .toString(),
                                                            productOptionValueId:
                                                                option!
                                                                    .productOptionValueId
                                                                    .toString(),
                                                          );
                                                          if (isSuccess) {
                                                            if (context
                                                                .mounted) {
                                                              Get.back();
                                                              AppUtil
                                                                  .successToast(
                                                                context,
                                                                'productAddedToCart'
                                                                    .tr,
                                                              );
                                                            }
                                                          }
                                                        }
                                                      },
                                                      label: CustomText(
                                                        text: 'addToCart'.tr,
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      icon: const Icon(
                                                        Icons
                                                            .add_shopping_cart_outlined,
                                                        color: Colors.white,
                                                        size: 18,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                onTap: () {
                                                  Get.back();
                                                },
                                                child: Container(
                                                  height: 35,
                                                  width: 35,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Colors.transparent,
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  child: const Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      });
                                    });
                              },
                              child: Container(
                                width: 28,
                                height: 28,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.add_shopping_cart,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // if (widget.showName)
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                    right: AppUtil.rtlDirection(context) ? 8 : 0,
                    left: AppUtil.rtlDirection(context) ? 0 : 8,
                  ),
                  child: SizedBox(
                    width: 170,
                    child: CustomText(
                      text: widget.product.name!,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                    right: AppUtil.rtlDirection(context) ? 8 : 0,
                    left: AppUtil.rtlDirection(context) ? 0 : 8,
                  ),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text:
                            '${double.parse(widget.product.price.toString()).toStringAsFixed(2)} ',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'riyal'.tr,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
    );
  }
}
