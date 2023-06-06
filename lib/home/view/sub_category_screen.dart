import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/home/models/category.dart';
import 'package:palta/product/view/products_screen.dart';
import 'package:palta/widgets/custom_body_title.dart';
import 'package:palta/widgets/custom_header.dart';
import 'package:palta/widgets/custom_loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({
    super.key,
    required this.category,
    required this.homeController,
  });

  final Category category;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(title: category.name),
      body: Column(
        children: [
          CustomBodyTitle(title: category.name),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: homeController.subCategories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(
                        () => ProductsScreen(
                          categoryId:
                              homeController.subCategories[index].id.toString(),
                          categoryName:
                              homeController.subCategories[index].name,
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: CachedNetworkImage(
                        imageUrl: homeController.subCategories[index].imageUrl,
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
      ),
    );
  }
}
