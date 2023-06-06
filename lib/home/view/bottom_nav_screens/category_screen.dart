import 'package:palta/constants/colors.dart';
import 'package:palta/home/view/sub_category_screen.dart';
import 'package:palta/widgets/custom_body_title.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
    return Column(
      children: [
        CustomBodyTitle(title: 'categories'.tr),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: homeController.categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (homeController.categories[index].id.toString() ==
                        '228') {
                      Get.to(
                        () => SubCategoryScreen(
                          homeController: homeController,
                          category: homeController.categories[index],
                        ),
                      );
                    } else {
                      Get.to(
                        () => ProductsScreen(
                          categoryId:
                              homeController.categories[index].id.toString(),
                          categoryName: homeController.categories[index].name,
                        ),
                      );
                    }
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    child: CachedNetworkImage(
                      imageUrl: homeController.categories[index].imageUrl,
                      fit: BoxFit.fill,
                      placeholder: (context, url) {
                        return const CustomLoadingWidget();
                      },
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
