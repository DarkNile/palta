import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palta/checkout/controllers/checkout_controller.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/product/controllers/product_controller.dart';
import 'package:palta/product/models/option.dart';
import 'package:palta/product/models/product.dart';
import 'package:palta/product/view/products_screen.dart';
import 'package:palta/product/widgets/product_description_screen.dart';
import 'package:palta/product/widgets/rating_review_screen.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_animated_smooth_indicator.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_loading_widget.dart';
import 'package:palta/widgets/custom_product_card.dart';
import 'package:palta/widgets/custom_text.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    super.key,
    required this.product,
    required this.categoryId,
  });

  final Product product;
  final String categoryId;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with TickerProviderStateMixin {
  final _homeController = Get.put(HomeController());
  final _productsController = Get.put(ProductController());
  final _checkoutController = Get.put(CheckoutController());

  bool onFavoritePressed = false;
  int _activeIndex = 0;
  late TabController _tabController;
  int _tabIndex = 0;
  Option? option;
  int? productOptionId;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _productsController.getProductsByCategoryId(
          categoryId: widget.categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider.builder(
                itemCount: widget.product.originalImages!.length,
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: true,
                  height: 581,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _activeIndex = index;
                    });
                  },
                ),
                itemBuilder: (context, index, page) {
                  return Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: widget.product.originalImages![index],
                        width: width,
                        height: 581,
                        fit: BoxFit.cover,
                        placeholder: (context, url) {
                          return const CustomLoadingWidget();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 32,
                          bottom: 16,
                          right: 16,
                          left: 16,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(Icons.arrow_back),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    'assets/icons/order.svg',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomAnimatedSmoothIndicator(
                                  count: widget.product.originalImages!.length,
                                  activeIndex: _activeIndex,
                                  isBlack: true,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      onFavoritePressed = !onFavoritePressed;
                                    });
                                    if (onFavoritePressed) {
                                      _homeController.addToWishlist(
                                        id: widget.product.id.toString(),
                                      );
                                    } else {
                                      _homeController.deleteFromWishlist(
                                        id: widget.product.id.toString(),
                                      );
                                    }
                                  },
                                  child: Container(
                                      width: 32,
                                      height: 32,
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        onFavoritePressed
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: onFavoritePressed
                                            ? vermillion
                                            : Colors.black,
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
            Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 21,
                      left: AppUtil.rtlDirection(context) ? 0 : 15,
                      right: AppUtil.rtlDirection(context) ? 15 : 0,
                    ),
                    child: CustomText(
                      text: widget.product.name!,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24, left: 15, right: 15),
                    color: warmGrey.withOpacity(0.2),
                    height: 1,
                    width: width,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 23),
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text:
                                          '${double.parse(widget.product.price.toString()).toStringAsFixed(2)} ',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'riyal'.tr,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                              if (widget.product.priceExcludingTax != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: 'priceWithoutTax'.tr,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: black51,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            ' ${double.parse(widget.product.priceExcludingTax.toString()).toStringAsFixed(2)} ',
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: black51,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'riyal'.tr,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: black51,
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 23),
                            child: Row(
                              children: [
                                Container(
                                  width: 1,
                                  height: 38,
                                  color: darkGrey,
                                ),
                                const SizedBox(
                                  width: 19,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        widget.product.quantity == '0'
                                            ? const Icon(
                                                Icons.close,
                                                color: vermillion,
                                                size: 18,
                                              )
                                            : const Icon(
                                                Icons.check,
                                                color: jadeGreen,
                                                size: 18,
                                              ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        CustomText(
                                          text: widget.product.quantity == '0'
                                              ? 'productNotAvailable'.tr
                                              : 'productAvailable'.tr,
                                          color: widget.product.quantity == 0
                                              ? vermillion
                                              : jadeGreen,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                            text: '${'weight'.tr}: ',
                                            style: const TextStyle(
                                              fontSize: 10,
                                              color: brownishGrey,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                '${double.parse(widget.product.weight.toString()).toStringAsFixed(2)} ',
                                            style: const TextStyle(
                                              fontSize: 10,
                                              color: brownishGrey,
                                            ),
                                          ),
                                          TextSpan(
                                            text: widget.product.weightClass,
                                            style: const TextStyle(
                                              fontSize: 10,
                                              color: brownishGrey,
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
            ),
            if (widget.product.options != null &&
                widget.product.options!.isNotEmpty)
              const SizedBox(
                height: 10,
              ),
            if (widget.product.options != null &&
                widget.product.options!.isNotEmpty)
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'chooseYourSize'.tr,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: vermillion,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 30,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.product.options!.first.option!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                option = widget
                                    .product.options!.first.option![index];
                              });
                            },
                            child: Container(
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                color: option != null &&
                                        option ==
                                            widget.product.options!.first
                                                .option![index]
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                              alignment: Alignment.center,
                              child: CustomText(
                                text: widget
                                    .product.options!.first.option![index].name,
                                textAlign: TextAlign.center,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 8,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            // const SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   color: Colors.white,
            //   alignment: Alignment.center,
            //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       RichText(
            //         text: TextSpan(children: [
            //           TextSpan(
            //             text: '${'modelNumber'.tr} ',
            //             style: const TextStyle(
            //               fontSize: 10,
            //               color: brownishGrey,
            //             ),
            //           ),
            //           TextSpan(
            //             text: widget.product.model,
            //             style: const TextStyle(
            //               fontSize: 12,
            //               color: Colors.black,
            //               fontWeight: FontWeight.w500,
            //             ),
            //           ),
            //         ]),
            //       ),
            //       CustomButton(
            //         onPressed: () {},
            //         title: 'sizeGuide'.tr,
            //         width: 110,
            //         height: 40,
            //         fontSize: 12,
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Colors.white,
              child: Column(
                children: [
                  TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 2,
                    labelPadding: const EdgeInsets.only(bottom: 18),
                    indicatorPadding:
                        const EdgeInsets.symmetric(horizontal: 16),
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    onTap: (index) {
                      setState(() {
                        _tabIndex = index;
                      });
                    },
                    tabs: [
                      CustomText(
                        text: 'productDescription'.tr,
                        fontSize: 12,
                        fontWeight:
                            _tabIndex == 0 ? FontWeight.w500 : FontWeight.w400,
                        color: _tabIndex == 0 ? Colors.black : brownishGrey,
                      ),
                      CustomText(
                        text: 'reviewsAndRatings'.tr,
                        fontSize: 12,
                        fontWeight:
                            _tabIndex == 1 ? FontWeight.w500 : FontWeight.w400,
                        color: _tabIndex == 1 ? Colors.black : brownishGrey,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 250,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 36),
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _tabController,
                        children: [
                          ProductDescriptionScreen(product: widget.product),
                          RatingReviewScreen(product: widget.product),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => ProductsScreen(
                          categoryId: widget.categoryId,
                          categoryName: _homeController.categories
                              .where((element) =>
                                  element.id.toString() == widget.categoryId)
                              .first
                              .name,
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'related'.tr,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomText(
                            text: 'viewAll'.tr,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: 337,
                    child: Obx(() {
                      if (_productsController.isProductsLoading.value ||
                          _homeController.isWishListProductsLoading.value) {
                        return Container();
                      }
                      return ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: _productsController.products.length > 8
                              ? 8
                              : _productsController.products.length,
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 8,
                            );
                          },
                          itemBuilder: (context, index) {
                            return CustomProductCard(
                              product: _productsController.products[index],
                              categoryId: widget.categoryId,
                              isRelated: true,
                            );
                          });
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 75.8,
        width: width,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: CustomButton(
            onPressed: () async {
              if (option == null) {
                AppUtil.errorToast(
                  context,
                  'chooseSize'.tr,
                );
              } else {
                productOptionId = widget.product.options!.first.productOptionId;
                final isSuccess = await _checkoutController.addToCart(
                  productId: widget.product.id.toString(),
                  quantity: '1',
                  productOptionId: productOptionId.toString(),
                  productOptionValueId: option!.productOptionValueId.toString(),
                );
                if (isSuccess) {
                  if (context.mounted) {
                    Get.back();
                    AppUtil.successToast(
                      context,
                      'productAddedToCart'.tr,
                    );
                  }
                }
              }
            },
            title: 'addToCart'.tr,
            radius: 4,
          ),
        ),
      ),
    );
  }
}
