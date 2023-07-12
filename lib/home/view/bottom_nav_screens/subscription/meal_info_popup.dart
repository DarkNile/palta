import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/widgets/custom_loading_widget.dart';
import 'package:palta/widgets/custom_text.dart';

class MealInfoPopup extends StatelessWidget {
  MealInfoPopup({
    super.key,
    required this.mealIndex,
    required this.programIndex,
    required this.title,
    required this.image,
  });

  final int mealIndex;
  final int programIndex;
  final String title;
  final String image;

  final HomeController homeController = Get.put(HomeController());

  // homeController.programs[programIndex].mealData![mealIndex].calories;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      contentPadding: const EdgeInsets.only(top: 10.0),
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: width * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset('assets/icons/close.svg')),
                const Spacer(),
                CustomText(
                  text: title,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 18.0,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              child: CachedNetworkImage(
                imageUrl: image,
                height: 169,
                width: width,
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return const CustomLoadingWidget();
                },
              ),
            ),
            const SizedBox(
              height: 18.0,
            ),
            CustomText(
              text: 'mealIngredients'.tr,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(
              height: 7.0,
            ),
            const CustomText(
              text:
                  "يتم عرض وصوف ومكونات الوجبة في هذه المنطقة يتم عرض وصوف ومكونات الوجبة في هذه المنطقة",
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: brownGrey,
            ),
            const SizedBox(
              height: 18.0,
            ),
            Row(
              children: [
                CustomText(
                  text: 'calories'.tr,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                const Spacer(),
                Container(
                  width: 90,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: iceBlue,
                  ),
                  child: Center(
                    child: CustomText(
                      text: homeController.programs[programIndex]
                              .mealData![mealIndex].calories.toString(),
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                CustomText(
                  text: 'carbohydrates'.tr,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                const Spacer(),
                Container(
                  width: 90,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: iceBlue,
                  ),
                  child: Center(
                    child: CustomText(
                      text: homeController.programs[programIndex]
                          .mealData![mealIndex].carbohydrates.toString(),
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                CustomText(
                  text: 'fat'.tr,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                const Spacer(),
                Container(
                  width: 90,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: iceBlue,
                  ),
                  child: Center(
                    child: CustomText(
                      text: homeController.programs[programIndex]
                          .mealData![mealIndex].fat.toString(),
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                CustomText(
                  text: 'protein'.tr,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                const Spacer(),
                Container(
                  width: 90,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: iceBlue,
                  ),
                  child: Center(
                    child: CustomText(
                      text: homeController.programs[programIndex]
                          .mealData![mealIndex].protein.toString(),
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
          ],
        ),
      ),
    );
  }
}
