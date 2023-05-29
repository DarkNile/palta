import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palta/checkout/controllers/checkout_controller.dart';
import 'package:palta/checkout/view/cart_screen.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/product/controllers/product_controller.dart';
import 'package:palta/product/view/products_screen.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_text.dart';
import 'package:palta/widgets/custom_text_field.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.scaffoldKey,
    this.showBackIcon = false,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool showBackIcon;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final _searchController = TextEditingController();
  final _productsController = Get.put(ProductController());
  final _checkoutController = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      toolbarHeight: 80,
      centerTitle: true,
      title: SvgPicture.asset(
        'assets/icons/appbar_logo.svg',
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.to(() => const CartScreen());
          },
          icon: Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
                size: 24,
              ),
              Positioned.directional(
                textDirection: Directionality.of(context),
                bottom: -15,
                end: 15,
                child: Container(
                  width: 18,
                  height: 18,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Obx(() {
                    return CustomText(
                      text: _checkoutController.cartItems.value.toString(),
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
        IconButton(
            onPressed: () {
              if (Get.currentRoute == '/ProductsScreen') {
                AppUtil.dialog(
                  context,
                  'searchNow'.tr,
                  [
                    StatefulBuilder(builder: (context, setState) {
                      return SizedBox(
                        width: width,
                        child: Column(children: [
                          CustomTextField(
                            controller: _searchController,
                            hintText: 'searchKeyword'.tr,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                radius: 8,
                                width: width * 0.67,
                                onPressed: () {
                                  _productsController.page(1);
                                  _productsController.filteredProducts.clear();
                                  _productsController.getFilteredProducts(
                                    search: _searchController.text,
                                    categoryId: '',
                                  );
                                  Get.back();
                                },
                                title: 'search'.tr,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomButton(
                                title: 'reset'.tr,
                                width: width * 0.2,
                                radius: 8,
                                onPressed: () {
                                  _searchController.clear();
                                  _productsController.page(1);
                                  _productsController.filteredProducts.clear();
                                  _productsController.getFilteredProducts(
                                    categoryId: '',
                                  );
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ]),
                      );
                    }),
                  ],
                  alignment: Alignment.bottomCenter,
                );
              } else {
                Get.to(
                  () => ProductsScreen(
                    categoryId: '',
                    categoryName: 'allProducts'.tr,
                    isCategoryPage: false,
                  ),
                );
              }
            },
            icon: const Icon(
              Icons.search_outlined,
              color: Colors.black,
              size: 24,
            )),
        if (widget.showBackIcon)
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_forward_outlined,
              color: Colors.black,
              size: 24,
            ),
          ),
      ],
      leading: IconButton(
        onPressed: () {
          widget.scaffoldKey.currentState!.openDrawer();
        },
        icon: const Icon(
          Icons.menu,
          color: Colors.black,
          size: 24,
        ),
      ),
    );
  }
}
