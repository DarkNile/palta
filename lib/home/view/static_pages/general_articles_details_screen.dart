import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/constants/extensions.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/home/view/static_pages/reviews_screen.dart';
import 'package:palta/widgets/custom_app_bar_clip_path.dart';
import 'package:palta/widgets/custom_loading_widget.dart';
import 'package:palta/widgets/custom_outlined_button.dart';
import 'package:palta/widgets/custom_text.dart';

class GeneralArticlesDetailsScreen extends StatefulWidget {
  const GeneralArticlesDetailsScreen({
    Key? key,
    required this.imageUrl,
    required this.dateCreated,
    required this.description,
    required this.blogId,
    required this.homeController,
    required this.name,
  }) : super(key: key);

  final String imageUrl;
  final String name;
  final String description;
  final String dateCreated;
  final HomeController homeController;
  final String blogId;

  @override
  State<GeneralArticlesDetailsScreen> createState() =>
      _GeneralArticlesDetailsScreenState();
}

class _GeneralArticlesDetailsScreenState
    extends State<GeneralArticlesDetailsScreen> {
  @override
  void initState() {
    widget.homeController.getArticlesDetails(blogId: widget.blogId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: CustomAppBarClipPath(),
                  child: CachedNetworkImage(
                    imageUrl: widget.imageUrl,
                    fit: BoxFit.cover,
                    height: 300,
                    placeholder: (context, url) {
                      return const CustomLoadingWidget();
                    },
                  ),
                ),
                Positioned(
                  right: Directionality.of(context) == TextDirection.ltr
                      ? null
                      : 20,
                  left: Directionality.of(context) == TextDirection.ltr
                      ? 20
                      : null,
                  top: 40,
                  child: customBackButton(),
                ),
              ],
            ),
            40.ph,
            CustomText(
              text: widget.name.tr,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            5.ph,
            CustomText(
              text: widget.dateCreated,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            15.ph,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: CustomText(
                text: widget.description.tr.split('<br>').join().trim(),
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            20.ph,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomOutlinedButton(
                title: 'reviews'.tr,
                onPressed: () {
                  Get.to(() => ReviewsScreen(
                        blogId: widget.blogId,
                      ));
                },
              ),
            ),
            20.ph,
          ],
        ),
      ),
    );
  }

  Widget customBackButton() => CircleAvatar(
        backgroundColor: Colors.white,
        radius: 20,
        child: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
      );
}
