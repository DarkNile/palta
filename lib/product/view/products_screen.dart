import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/home/models/category.dart';
import 'package:palta/home/view/bottom_nav_screens/assessment/assessment_questions1.dart';

import 'package:palta/home/view/home_page.dart';

import 'package:palta/product/controllers/product_controller.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_app_bar.dart';
import 'package:palta/widgets/custom_drawer.dart';
import 'package:palta/widgets/custom_body_title.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_input.dart';
import 'package:palta/widgets/custom_product_card.dart';
import 'package:palta/widgets/custom_text.dart';
import 'package:lottie/lottie.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({
    super.key,
    required this.categoryId,
    required this.categoryName,
    this.isCategoryPage = true,
  });

  final String categoryId;
  final String categoryName;
  final bool isCategoryPage;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final _scrollController = ScrollController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _productsController = Get.put(ProductController());
  final _homeController = Get.put(HomeController());
  String? groupValue;
  double minPrice = 0.0;
  double maxPrice = 1000.0;
  var currentRangeValues = const RangeValues(0.0, 1000.0);
  final categoryController = TextEditingController();
  final sizeController = TextEditingController();
  List<String> sizes = [];
  String? sizeGroupValue;
  Category? categoryGroupValue;
  Category? category;
  String? size;
  String? categoryName;
  bool isListViewLayout = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _productsController.page(1);
      _productsController.filteredProducts.clear();
      _productsController.getFilteredProducts(
        categoryId: widget.categoryId,
        homeController: _homeController,
      );
      _scrollController.addListener(() {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.offset) {
          _productsController.page.value++;
          _productsController.getFilteredProducts(
            categoryId: widget.categoryId,
            homeController: _homeController,
          );
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    categoryController.dispose();
    sizeController.dispose();
  }

  final List<String> _programIcons = ['muscle', 'fitness', 'weight'];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKey,
      ),
      drawer: CustomDrawer(
        programIcons: _programIcons,
        onGuideTileTap: () {
          Get.offAll(() => const HomePage(
                pageIndex: 3,
              ));
        },
        onAssessmentTap: () {
          Get.to(
            () => const AssessmentQuestion1(),
          );
        },
        onProfileTileTap: () {
          Get.offAll(() => const HomePage(
                pageIndex: 4,
              ));
        },
        onHomeTileTap: () {
          Get.offAll(() => const HomePage());
        },
        onCategoryTileTap: (id, name) {
          setState(() {
            categoryName = name;
          });
          Get.back();
          _productsController.page(1);
          _productsController.filteredProducts.clear();
          _productsController.getFilteredProducts(
            categoryId: id,
            homeController: _homeController,
          );
        },
      ),
      body: Obx(() {
        if (_productsController.isFilteredProductsLoading.value &&
            _productsController.page.value == 1) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isListViewLayout = !isListViewLayout;
                      });
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/layout.svg'),
                        const SizedBox(
                          width: 9,
                        ),
                        CustomText(
                          text: 'layout'.tr,
                          color: brownishGrey,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 15,
                    color: lighGrey,
                  ),
                  InkWell(
                    onTap: () {
                      // sizes.clear();
                      // for (int i = 0;
                      //     i < _productsController.filteredProducts.length;
                      //     i++) {
                      //   if (_productsController.filteredProducts[i].options !=
                      //           null &&
                      //       _productsController
                      //           .filteredProducts[i].options!.isNotEmpty) {
                      //     for (int j = 0;
                      //         j <
                      //             _productsController.filteredProducts[i]
                      //                 .options!.first.option!.length;
                      //         j++) {
                      //       sizes.add(_productsController.filteredProducts[i]
                      //           .options!.first.option![j].name);
                      //     }
                      //   }
                      // }
                      AppUtil.dialog(
                        context,
                        "filterBy".tr,
                        [
                          StatefulBuilder(builder: (context, setState) {
                            return Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  text: "price".tr,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  alignment: Alignment.center,
                                  child: RangeSlider(
                                    inactiveColor: lighGrey,
                                    activeColor: vermillion,
                                    values: currentRangeValues,
                                    max: maxPrice,
                                    min: minPrice,
                                    divisions: 10,
                                    labels: RangeLabels(
                                      currentRangeValues.start
                                          .toStringAsFixed(2),
                                      currentRangeValues.end.toStringAsFixed(2),
                                    ),
                                    onChanged: (RangeValues values) {
                                      setState(() {
                                        currentRangeValues = values;
                                      });
                                    },
                                  ),
                                ),
                                Row(
                                  textDirection: AppUtil.rtlDirection(context)
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                  children: [
                                    CustomText(
                                      text:
                                          '${currentRangeValues.start.toStringAsFixed(2)} ${'riyal'.tr}',
                                      color: warmGrey,
                                    ),
                                    const Spacer(),
                                    CustomText(
                                      text:
                                          '${currentRangeValues.end.toStringAsFixed(2)} ${'riyal'.tr}',
                                      color: warmGrey,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                if (!widget.isCategoryPage)
                                  CustomInput(
                                    controller: categoryController,
                                    lable: 'category'.tr,
                                    suffixIcon:
                                        const Icon(Icons.keyboard_arrow_down),
                                    textInputType: TextInputType.name,
                                    readOnly: true,
                                    onTap: () => showOptions(
                                        _homeController.categories, true),
                                  ),
                                // if (!widget.isCategoryPage)
                                //   const SizedBox(
                                //     height: 20,
                                //   ),
                                // if (sizes.isNotEmpty)
                                //   CustomInput(
                                //     controller: sizeController,
                                //     lable: 'size'.tr,
                                //     suffixIcon:
                                //         const Icon(Icons.keyboard_arrow_down),
                                //     textInputType: TextInputType.name,
                                //     readOnly: true,
                                //     onTap: () => showOptions(
                                //         sizes.toSet().toList(), false),
                                //   ),
                                if (!widget.isCategoryPage)
                                  const SizedBox(
                                    height: 40,
                                  ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomButton(
                                      title: 'submit'.tr,
                                      onPressed: () {
                                        _productsController.page(1);
                                        _productsController.filteredProducts
                                            .clear();
                                        if (widget.isCategoryPage) {
                                          _productsController.filterByPrice(
                                            homeController: _homeController,
                                            categoryId: widget.categoryId,
                                            minPrice: currentRangeValues.start
                                                .toString(),
                                            maxPrice: currentRangeValues.end
                                                .toString(),
                                          );
                                        } else {
                                          _productsController.filterByPrice(
                                            homeController: _homeController,
                                            categoryId:
                                                categoryController.text.isEmpty
                                                    ? ''
                                                    : category!.id.toString(),
                                            minPrice: currentRangeValues.start
                                                .toString(),
                                            maxPrice: currentRangeValues.end
                                                .toString(),
                                          );
                                        }
                                        Get.back();
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    CustomButton(
                                      title: 'reset'.tr,
                                      onPressed: () {
                                        setState(() {
                                          currentRangeValues =
                                              const RangeValues(0.0, 1000.0);
                                          size = null;
                                          category = null;
                                          categoryController.clear();
                                          sizeController.clear();
                                          categoryGroupValue = null;
                                          sizeGroupValue = null;
                                        });
                                        _productsController.page(1);
                                        _productsController.filteredProducts
                                            .clear();
                                        _productsController.getFilteredProducts(
                                          categoryId: widget.categoryId,
                                          homeController: _homeController,
                                        );
                                        Get.back();
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                              ],
                            );
                          }),
                        ],
                        alignment: Alignment.bottomCenter,
                      );
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/filter.svg'),
                        const SizedBox(
                          width: 9,
                        ),
                        CustomText(
                          text: 'filter'.tr,
                          color: brownishGrey,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 15,
                    color: lighGrey,
                  ),
                  InkWell(
                    onTap: () {
                      AppUtil.dialog(
                        context,
                        'sortBy'.tr,
                        [
                          StatefulBuilder(builder: (context, setState) {
                            return SizedBox(
                              width: width,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        groupValue = 'priceH';
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        CustomText(text: 'priceHighToLow'.tr),
                                        const Spacer(),
                                        SizedBox(
                                          height: 50,
                                          child: Radio(
                                              value: 'priceH',
                                              groupValue: groupValue,
                                              activeColor: vermillion,
                                              onChanged: (String? v) {
                                                setState(() {
                                                  groupValue = v!;
                                                });
                                              }),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Divider(),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        groupValue = 'priceL';
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        CustomText(text: 'priceLowToHigh'.tr),
                                        const Spacer(),
                                        SizedBox(
                                          height: 50,
                                          child: Radio(
                                              value: 'priceL',
                                              groupValue: groupValue,
                                              activeColor: vermillion,
                                              onChanged: (String? v) {
                                                setState(() {
                                                  groupValue = v!;
                                                });
                                              }),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Divider(),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        groupValue = 'date';
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        CustomText(text: 'recentlyArrived'.tr),
                                        const Spacer(),
                                        SizedBox(
                                          height: 50,
                                          child: Radio<String>(
                                              value: 'date',
                                              groupValue: groupValue,
                                              activeColor: vermillion,
                                              onChanged: (String? v) {
                                                setState(() {
                                                  groupValue = v!;
                                                });
                                              }),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomButton(
                                        title: 'submit'.tr,
                                        onPressed: () {
                                          _productsController.page(1);
                                          _productsController.filteredProducts
                                              .clear();
                                          if (groupValue == 'date') {
                                            _productsController
                                                .getFilteredProducts(
                                              categoryId: widget.categoryId,
                                              order: 'desc',
                                              sort: 'date_added',
                                              homeController: _homeController,
                                            );
                                          } else if (groupValue == 'priceL') {
                                            _productsController
                                                .getFilteredProducts(
                                              categoryId: widget.categoryId,
                                              order: 'asc',
                                              sort: 'price',
                                              homeController: _homeController,
                                            );
                                          } else if (groupValue == 'priceH') {
                                            _productsController
                                                .getFilteredProducts(
                                              categoryId: widget.categoryId,
                                              order: 'desc',
                                              sort: 'price',
                                              homeController: _homeController,
                                            );
                                          }
                                          Get.back();
                                        },
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      CustomButton(
                                        title: 'reset'.tr,
                                        onPressed: () {
                                          setState(() {
                                            groupValue = '';
                                          });
                                          _productsController.page(1);
                                          _productsController.filteredProducts
                                              .clear();
                                          _productsController
                                              .getFilteredProducts(
                                            categoryId: widget.categoryId,
                                            homeController: _homeController,
                                          );
                                          Get.back();
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],
                        alignment: Alignment.bottomCenter,
                      );
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/sort.svg'),
                        const SizedBox(
                          width: 9,
                        ),
                        CustomText(
                          text: 'sort'.tr,
                          color: brownishGrey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            CustomBodyTitle(
                title:
                    '${categoryName ?? (category != null ? category!.name : widget.categoryName)} ( ${_productsController.filteredProducts.length} )'),
            const SizedBox(
              height: 20,
            ),
            if (_productsController.filteredProducts.isEmpty)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/lottie/no_orders.json',
                    ),
                    CustomText(
                      text: 'noAvailableProducts'.tr,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            else
              Expanded(
                child: Stack(
                  children: [
                    GridView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isListViewLayout ? 1 : 2,
                          childAspectRatio: isListViewLayout ? 2.4 : 0.8,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: _productsController.filteredProducts.length,
                        itemBuilder: (context, index) {
                          return CustomProductCard(
                            product:
                                _productsController.filteredProducts[index],
                            categoryId: widget.categoryId,
                            isFromProducts: true,
                            isListViewLayout: isListViewLayout,
                          );
                        }),
                    if (_productsController.isFilteredProductsLoading.value &&
                        _productsController.page.value > 1)
                      const Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 16),
                            child: CircularProgressIndicator(),
                          )),
                  ],
                ),
              ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      }),
    );
  }

  Future<void> showOptions(List options, bool isCategory) async {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    await showDialog(
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) => Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.transparent,
            child: Container(
              height: MediaQuery.of(context).size.height * .52,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .35),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(45),
                      topLeft: Radius.circular(45))),
              child: Column(
                children: [
                  SizedBox(
                    height: h * .025,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: isCategory ? 'category'.tr : 'size'.tr,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        InkWell(
                          onTap: () => Get.back(),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * .01,
                  ),
                  Container(
                    width: w,
                    height: 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2222222),
                      color: Colors.black12.withOpacity(.07),
                    ),
                  ),
                  SizedBox(
                    height: h * .02,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: options.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              if (isCategory) {
                                setState(() {
                                  category = options[index];
                                  categoryGroupValue = options[index];
                                });
                              } else {
                                setState(() {
                                  size = options[index];
                                  sizeGroupValue = options[index];
                                });
                              }
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: isCategory
                                        ? options[index].name
                                        : options[index],
                                    fontSize: 13,
                                  ),
                                  Radio(
                                      value: options[index],
                                      activeColor: vermillion,
                                      groupValue: isCategory
                                          ? categoryGroupValue
                                          : sizeGroupValue,
                                      onChanged: (v) {
                                        if (isCategory) {
                                          setState(() {
                                            category = options[index];
                                            categoryGroupValue = v!;
                                          });
                                        } else {
                                          setState(() {
                                            size = options[index];
                                            sizeGroupValue = v!;
                                          });
                                        }
                                      }),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      if (isCategory) {
                        setState(() {
                          categoryController.text = category!.name;
                        });
                      } else {
                        setState(() {
                          sizeController.text = size!;
                        });
                      }
                      Get.back();
                    },
                    child: Container(
                      height: h * .07,
                      width: w * .9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).primaryColor),
                      alignment: Alignment.center,
                      child: CustomText(
                        text: 'apply'.tr,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * .02,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
