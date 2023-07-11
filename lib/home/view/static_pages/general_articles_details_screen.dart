import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/constants/extensions.dart';
import 'package:palta/widgets/custom_app_bar_clip_path.dart';
import 'package:palta/widgets/custom_loading_widget.dart';
import 'package:palta/widgets/custom_text.dart';

class GeneralArticlesDetailsScreen extends StatelessWidget {
  const GeneralArticlesDetailsScreen(
      {Key? key,
      required this.imageUrl,
      required this.dateCreated,
      required this.description,
      required this.name})
      : super(key: key);

  final String imageUrl;
  final String name;
  final String description;
  final String dateCreated;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: CustomAppBarClipPath(),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                    placeholder: (context, url) {
                      return const CustomLoadingWidget();
                    },
                  ),
                ),
                Positioned(
                  right: Directionality.of(context) == TextDirection.ltr ? null : 20,
                  left: Directionality.of(context) == TextDirection.ltr ? 20 : null,
                  top: 40,
                  child: customBackButton(),
                ),
              ],
            ),
            40.ph,
            CustomText(
              text: name.tr,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            5.ph,
            CustomText(
              text: dateCreated,
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
                text: description.tr.split('<br>').join().trim(),
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
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
