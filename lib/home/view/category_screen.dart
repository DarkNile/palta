import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/product/view/products_screen.dart';
import 'package:palta/widgets/custom_loading_widget.dart';
import 'package:palta/widgets/custom_outlined_button.dart';
import 'package:palta/widgets/custom_text.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.homeController});

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/icons/logo_icon.svg'),
                SvgPicture.asset(
                  'assets/icons/background.svg',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
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
                            categoryName: homeController.categories
                                .where((element) => element.id == 64)
                                .first
                                .name,
                          ),
                        );
                      },
                      child: CachedNetworkImage(
                        imageUrl: homeController.categories
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
                            categoryName: homeController.categories
                                .where((element) => element.id == 83)
                                .first
                                .name,
                          ),
                        );
                      },
                      child: CachedNetworkImage(
                        imageUrl: homeController.categories
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
                    const SizedBox(
                      height: 4,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => ProductsScreen(
                            categoryId: '82',
                            categoryName: homeController.categories
                                .where((element) => element.id == 82)
                                .first
                                .name,
                          ),
                        );
                      },
                      child: CachedNetworkImage(
                        imageUrl: homeController.categories
                            .where((element) => element.id == 82)
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
                            categoryId: '61',
                            categoryName: homeController.categories
                                .where((element) => element.id == 61)
                                .first
                                .name,
                          ),
                        );
                      },
                      child: CachedNetworkImage(
                        imageUrl: homeController.categories
                            .where((element) => element.id == 61)
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
                            categoryId: '77',
                            categoryName: homeController.categories
                                .where((element) => element.id == 77)
                                .first
                                .name,
                          ),
                        );
                      },
                      child: CachedNetworkImage(
                        imageUrl: homeController.categories
                            .where((element) => element.id == 77)
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
                            categoryName: homeController.categories
                                .where((element) => element.id == 69)
                                .first
                                .name,
                          ),
                        );
                      },
                      child: CachedNetworkImage(
                        imageUrl: homeController.categories
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
                            categoryName: homeController.categories
                                .where((element) => element.id == 62)
                                .first
                                .name,
                          ),
                        );
                      },
                      child: CachedNetworkImage(
                        imageUrl: homeController.categories
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
                    const SizedBox(
                      height: 4,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => ProductsScreen(
                            categoryId: '59',
                            categoryName: homeController.categories
                                .where((element) => element.id == 59)
                                .first
                                .name,
                          ),
                        );
                      },
                      child: CachedNetworkImage(
                        imageUrl: homeController.categories
                            .where((element) => element.id == 59)
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
                            categoryId: '79',
                            categoryName: homeController.categories
                                .where((element) => element.id == 79)
                                .first
                                .name,
                          ),
                        );
                      },
                      child: CachedNetworkImage(
                        imageUrl: homeController.categories
                            .where((element) => element.id == 79)
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
                            categoryId: '84',
                            categoryName: homeController.categories
                                .where((element) => element.id == 84)
                                .first
                                .name,
                          ),
                        );
                      },
                      child: CachedNetworkImage(
                        imageUrl: homeController.categories
                            .where((element) => element.id == 84)
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
          ),
          const SizedBox(
            height: 24,
          ),
          CustomOutlinedButton(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              onPressed: () {
                Get.to(
                  () => ProductsScreen(
                    categoryId: '',
                    categoryName: 'allProducts'.tr,
                    isCategoryPage: false,
                  ),
                );
              },
              child: CustomText(
                text: 'viewAllProducts'.tr,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              )),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
