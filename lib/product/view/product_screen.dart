import 'package:palta/product/widgets/nutrition_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/product/controllers/product_controller.dart';
import 'package:palta/product/models/option.dart';
import 'package:palta/product/models/product.dart';
import 'package:palta/product/view/products_screen.dart';
import 'package:palta/product/widgets/product_description_screen.dart';
import 'package:palta/product/widgets/rating_review_screen.dart';
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
        categoryId: widget.categoryId,
        homeController: _homeController,
      );
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
                  height: 512,
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
                        height: 512,
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
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      onFavoritePressed = !onFavoritePressed;
                                    });
                                    if (onFavoritePressed) {
                                      _homeController.addToWishlist(
                                        id: widget.product.id.toString(),
                                        productController: _productsController,
                                      );
                                    } else {
                                      _homeController.deleteFromWishlist(
                                        id: widget.product.id.toString(),
                                        productController: _productsController,
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
                    padding: const EdgeInsets.only(
                      top: 21,
                      left: 16,
                      right: 16,
                    ),
                    child: CustomText(
                      text: widget.product.name!,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
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
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 23),
                                child: Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text:
                                              '${double.parse(widget.product.price.toString()).toStringAsFixed(2)} ',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: widget.product.special != 0
                                                ? vermillion
                                                : Colors.black,
                                            decoration:
                                                widget.product.special != 0
                                                    ? TextDecoration.lineThrough
                                                    : TextDecoration.none,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'riyal'.tr,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: widget.product.special != 0
                                                ? vermillion
                                                : Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ]),
                                    ),
                                    if (widget.product.special != 0)
                                      const SizedBox(
                                        width: 8,
                                      ),
                                    if (widget.product.special != 0)
                                      RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                            text:
                                                '${double.parse(widget.product.special.toString()).toStringAsFixed(2)} ',
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
                                  ],
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
                                  height: 80,
                                  color: darkGrey,
                                ),
                                const SizedBox(
                                  width: 24,
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
                                    if (widget.product.customTabs != null)
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => NutritionScreen(
                                                customtabs:
                                                    widget.product.customTabs!,
                                              ));
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(top: 8),
                                          padding: const EdgeInsets.all(8),
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(
                                            color: yellow,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          child: CustomText(
                                            text: 'nutritionFacts'.tr,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
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
                      padding: const EdgeInsets.only(top: 24),
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
                    height: 250,
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
        height: 75,
        width: width,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: CustomButton(
            onPressed: () async {
              // final isSuccess = await _checkoutController.addToCart(
              //   productId: widget.product.id.toString(),
              //   quantity: '1',
              // );
              // if (isSuccess) {
              //   if (context.mounted) {
              //     AppUtil.successToast(
              //       context,
              //       'productAddedToCart'.tr,
              //     );
              //   }
              // }
            },
            title: 'addToCart'.tr,
          ),
        ),
      ),
    );
  }
}
