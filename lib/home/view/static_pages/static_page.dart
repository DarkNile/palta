import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/widgets/custom_app_bar.dart';
import 'package:palta/widgets/custom_body_title.dart';
import 'package:palta/widgets/custom_text.dart';

class StaticPage extends StatelessWidget {
  const StaticPage({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (homeController.isStaticPageLoading.value) {
        return const Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                const CustomAppBar(
                  isFromOnboarding: true,
                  isFromStaticPage: true,
                ),
                Positioned(
                  top: 100,
                  child: CustomBodyTitle(
                    title: homeController.staticPageData['title']!,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: CustomText(
                    text: homeController.staticPageData['description']!
                        .split('&nbsp;')
                        .join(),
                    textAlign: TextAlign.justify,
                    height: 1.875,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
