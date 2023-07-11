import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/home/view/static_pages/general_articles_details_screen.dart';
import 'package:palta/home/widgets/custom_guide_item.dart';
import 'package:palta/widgets/custom_app_bar.dart';
import 'package:palta/widgets/custom_body_title.dart';

class GeneralArticlesScreen extends StatefulWidget {
  const GeneralArticlesScreen({super.key, required this.homeController});

  final HomeController homeController;

  @override
  State<GeneralArticlesScreen> createState() => _GeneralArticlesScreenState();
}

class _GeneralArticlesScreenState extends State<GeneralArticlesScreen> {
  @override
  void initState() {
    widget.homeController.getArticles(userId: 'all');
    super.initState();
  }

  String formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    String formattedDate = formatter.format(dateTime);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
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
                  title: 'articles'.tr,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Obx(() {
            if (widget.homeController.isArticlesLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  String dateFormat = formatDateTime(
                    widget.homeController.articles[index].dateCreated,
                  );
                  return CustomGuideItem(
                    title: widget.homeController.articles[index].name,
                    date: dateFormat,
                    image: widget.homeController.articles[index].image,
                    onTap: () {
                      Get.to(() => GeneralArticlesDetailsScreen(
                            dateCreated: dateFormat,
                            description: widget
                                .homeController.articles[index].description,
                            name: widget.homeController.articles[index].name,
                            imageUrl:
                                widget.homeController.articles[index].image,
                          ));
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 16)
                        .copyWith(right: width * 0.33),
                    width: width,
                    height: 1,
                    color: veryLightPink,
                  );
                },
                itemCount: widget.homeController.articles.length,
              ),
            );
          }),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
