import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/product/view/products_screen.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_animated_smooth_indicator.dart';
import 'package:palta/widgets/custom_feature_card.dart';
import 'package:palta/widgets/custom_loading_widget.dart';
import 'package:palta/widgets/custom_text.dart';
import 'package:palta/widgets/custom_product_card.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.homeController});

  final HomeController homeController;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;
  int _activeIndex = 0;
  int _activeIndex2 = 0;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() {
            if (widget.homeController.isBannersLoading.value) {
              return Container();
            }
            return CarouselSlider.builder(
                itemCount: widget.homeController.banners.length,
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: true,
                  height: 396,
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
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      CachedNetworkImage(
                        imageUrl: widget.homeController.banners[index]['image'],
                        width: width,
                        fit: BoxFit.cover,
                        placeholder: (context, url) {
                          return const CustomLoadingWidget();
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 32,
                          right: AppUtil.rtlDirection(context) ? 29 : 0,
                          left: AppUtil.rtlDirection(context) ? 0 : 29,
                        ),
                        child: CustomAnimatedSmoothIndicator(
                          count: widget.homeController.banners.length,
                          activeIndex: _activeIndex,
                        ),
                      ),
                    ],
                  );
                });
          }),
          const SizedBox(
            height: 30,
          ),
          CustomText(
            text: 'fashion'.tr,
            fontSize: 22,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 11,
          ),
          CustomText(
            text: 'explore'.tr,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Obx(() {
              if (widget.homeController.isCategoriesLoading.value) {
                return Container();
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(
                              () => ProductsScreen(
                                categoryId: '64',
                                categoryName: widget.homeController.categories
                                    .where((element) => element.id == 64)
                                    .first
                                    .name,
                              ),
                            );
                          },
                          child: CachedNetworkImage(
                            imageUrl: widget.homeController.categories
                                .where((element) => element.id == 64)
                                .first
                                .imageUrl,
                            fit: BoxFit.cover,
                            width: width / 2,
                            placeholder: (context, url) {
                              return const CustomLoadingWidget();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(
                              () => ProductsScreen(
                                categoryId: '83',
                                categoryName: widget.homeController.categories
                                    .where((element) => element.id == 83)
                                    .first
                                    .name,
                              ),
                            );
                          },
                          child: CachedNetworkImage(
                            imageUrl: widget.homeController.categories
                                .where((element) => element.id == 83)
                                .first
                                .imageUrl,
                            fit: BoxFit.cover,
                            width: width / 2,
                            placeholder: (context, url) {
                              return const CustomLoadingWidget();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(
                              () => ProductsScreen(
                                categoryId: '69',
                                categoryName: widget.homeController.categories
                                    .where((element) => element.id == 69)
                                    .first
                                    .name,
                              ),
                            );
                          },
                          child: CachedNetworkImage(
                            imageUrl: widget.homeController.categories
                                .where((element) => element.id == 69)
                                .first
                                .imageUrl,
                            fit: BoxFit.cover,
                            width: width / 2,
                            placeholder: (context, url) {
                              return const CustomLoadingWidget();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(
                              () => ProductsScreen(
                                categoryId: '62',
                                categoryName: widget.homeController.categories
                                    .where((element) => element.id == 62)
                                    .first
                                    .name,
                              ),
                            );
                          },
                          child: CachedNetworkImage(
                            imageUrl: widget.homeController.categories
                                .where((element) => element.id == 62)
                                .first
                                .imageUrl,
                            fit: BoxFit.cover,
                            width: width / 2,
                            placeholder: (context, url) {
                              return const CustomLoadingWidget();
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }),
          ),
          const SizedBox(
            height: 26,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              textDirection: TextDirection.ltr,
              children: [
                SvgPicture.asset('assets/icons/small_logo.svg'),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Container(
                    width: width,
                    height: 1,
                    color: lighGrey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Obx(() {
                if (widget.homeController.isBannersLoading.value) {
                  return Container();
                }
                return CachedNetworkImage(
                  imageUrl: widget.homeController.winterBanner.first['image'],
                  width: width,
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return const CustomLoadingWidget();
                  },
                );
              }),
              Padding(
                padding: const EdgeInsets.only(top: 217),
                child: Builder(builder: (context) {
                  return Obx(() {
                    if (widget.homeController.isCategoryProductsLoading.value ||
                        widget.homeController.isWishListProductsLoading.value) {
                      return Container();
                    }
                    return CarouselSlider.builder(
                        itemCount: widget.homeController.winterlook.length,
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          height: 337,
                          viewportFraction: 0.5,
                        ),
                        itemBuilder: (context, index, page) {
                          return CustomProductCard(
                            product: widget.homeController.winterlook[index],
                            categoryId: '81',
                            showName: true,
                          );
                        });
                  });
                }),
              ),
            ],
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: SvgPicture.asset('assets/icons/small_logo.svg'),
              )),
          const SizedBox(
            height: 33,
          ),
          Obx(() {
            if (widget.homeController.isBannersLoading.value) {
              return Container();
            }
            return CachedNetworkImage(
              imageUrl: widget.homeController.freeShippingBanner.first['image'],
              width: width,
              fit: BoxFit.cover,
              placeholder: (context, url) {
                return const CustomLoadingWidget();
              },
            );
          }),
          const SizedBox(
            height: 33,
          ),
          Obx(() {
            if (widget.homeController.isCategoryProductsLoading.value ||
                widget.homeController.isWishListProductsLoading.value) {
              return Container();
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: widget.homeController.categories
                            .where((element) => element.id == 69)
                            .first
                            .name,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(
                            () => ProductsScreen(
                              categoryId: '69',
                              categoryName: widget.homeController.categories
                                  .where((element) => element.id == 69)
                                  .first
                                  .name,
                            ),
                          );
                        },
                        child: CustomText(
                          text: 'viewAll'.tr,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 337,
                  child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.homeController.dresses.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 8,
                        );
                      },
                      itemBuilder: (context, index) {
                        return CustomProductCard(
                          product: widget.homeController.dresses[index],
                          categoryId: '69',
                        );
                      }),
                ),
              ],
            );
          }),
          const SizedBox(
            height: 50,
          ),
          Obx(() {
            if (widget.homeController.isCategoryProductsLoading.value ||
                widget.homeController.isWishListProductsLoading.value) {
              return Container();
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: widget.homeController.categories
                            .where((element) => element.id == 83)
                            .first
                            .name,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(
                            () => ProductsScreen(
                              categoryId: '83',
                              categoryName: widget.homeController.categories
                                  .where((element) => element.id == 83)
                                  .first
                                  .name,
                            ),
                          );
                        },
                        child: CustomText(
                          text: 'viewAll'.tr,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 337,
                  child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.homeController.thobe.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 8,
                        );
                      },
                      itemBuilder: (context, index) {
                        return CustomProductCard(
                          product: widget.homeController.thobe[index],
                          categoryId: '83',
                        );
                      }),
                ),
              ],
            );
          }),
          const SizedBox(
            height: 50,
          ),
          Obx(() {
            if (widget.homeController.isBannersLoading.value) {
              return Container();
            }
            return CarouselSlider.builder(
                itemCount: widget.homeController.anyPartBanner.length,
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: true,
                  height: 181,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _activeIndex2 = index;
                    });
                  },
                ),
                itemBuilder: (context, index, page) {
                  return CachedNetworkImage(
                    imageUrl: widget.homeController.anyPartBanner[index]
                        ['image'],
                    width: width,
                    fit: BoxFit.cover,
                    placeholder: (context, url) {
                      return const CustomLoadingWidget();
                    },
                  );
                });
          }),
          const SizedBox(
            height: 13.5,
          ),
          Obx(() {
            if (widget.homeController.isBannersLoading.value) {
              return Container();
            }
            return CustomAnimatedSmoothIndicator(
              isTabBar: true,
              activeIndex: _activeIndex2,
              count: widget.homeController.anyPartBanner.length,
            );
          }),
          const SizedBox(
            height: 50,
          ),
          Obx(() {
            if (widget.homeController.isCategoryProductsLoading.value ||
                widget.homeController.isWishListProductsLoading.value) {
              return Container();
            }
            return Column(
              children: [
                TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 1,
                  labelPadding: const EdgeInsets.only(bottom: 8),
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  onTap: (index) {
                    setState(() {
                      _tabIndex = index;
                    });
                  },
                  tabs: [
                    CustomText(
                      text: widget.homeController.categories
                          .where((element) => element.id == 61)
                          .first
                          .name,
                      fontSize: 14,
                      fontWeight:
                          _tabIndex == 0 ? FontWeight.w500 : FontWeight.w400,
                    ),
                    CustomText(
                      text: widget.homeController.categories
                          .where((element) => element.id == 62)
                          .first
                          .name,
                      fontSize: 14,
                      fontWeight:
                          _tabIndex == 2 ? FontWeight.w500 : FontWeight.w400,
                    ),
                    CustomText(
                      text: widget.homeController.categories
                          .where((element) => element.id == 64)
                          .first
                          .name,
                      fontSize: 14,
                      fontWeight:
                          _tabIndex == 1 ? FontWeight.w500 : FontWeight.w400,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 337,
                  child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: [
                        ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.homeController.trousers.length,
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 8,
                              );
                            },
                            itemBuilder: (context, index) {
                              return CustomProductCard(
                                product: widget.homeController.trousers[index],
                                categoryId: '61',
                              );
                            }),
                        ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.homeController.tops.length,
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 8,
                              );
                            },
                            itemBuilder: (context, index) {
                              return CustomProductCard(
                                product: widget.homeController.tops[index],
                                categoryId: '62',
                              );
                            }),
                        ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.homeController.skirts.length,
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 8,
                              );
                            },
                            itemBuilder: (context, index) {
                              return CustomProductCard(
                                product: widget.homeController.skirts[index],
                                categoryId: '64',
                              );
                            }),
                      ]),
                ),
              ],
            );
          }),
          const SizedBox(
            height: 50,
          ),
          Obx(() {
            if (widget.homeController.isCategoryProductsLoading.value ||
                widget.homeController.isWishListProductsLoading.value) {
              return Container();
            } else if (widget.homeController.bestSelling.isEmpty) {
              return Container();
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: widget.homeController.categories
                            .where((element) => element.id == 85)
                            .first
                            .name,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(
                            () => ProductsScreen(
                              categoryId: '85',
                              categoryName: widget.homeController.categories
                                  .where((element) => element.id == 85)
                                  .first
                                  .name,
                            ),
                          );
                        },
                        child: CustomText(
                          text: 'viewAll'.tr,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 337,
                  child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.homeController.bestSelling.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 8,
                        );
                      },
                      itemBuilder: (context, index) {
                        return CustomProductCard(
                          product: widget.homeController.bestSelling[index],
                          categoryId: '85',
                        );
                      }),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            );
          }),
          Container(
            width: width,
            height: 300,
            color: lighGrey,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  child: CustomText(
                    text: 'shopAndEnjoy'.tr,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: CustomFeatureCard(
                            icon: 'delivery',
                            title: 'freeShipping'.tr,
                            subtitle: 'deliveryThreeDays'.tr),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomFeatureCard(
                            icon: 'cash',
                            title: 'cashOnArrival'.tr,
                            subtitle: 'payInCash'.tr),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomFeatureCard(
                            icon: 'reload',
                            title: 'return'.tr,
                            subtitle: 'freeReturn'.tr),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
