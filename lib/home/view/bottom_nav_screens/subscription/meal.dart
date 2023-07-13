import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/view/bottom_nav_screens/subscription/meal_info_popup.dart';
import 'package:palta/widgets/custom_loading_widget.dart';
import 'package:palta/widgets/custom_text.dart';

class Meal extends StatelessWidget {
  const Meal({
    super.key,
    required this.mealIndex,
    required this.programIndex,
    required this.title,
    required this.image,
    required this.description,
    required this.price,
    required this.mealData,
  });

  final int mealIndex;
  final int programIndex;
  final String title;
  final String image;
  final String description;
  final String price;
  final dynamic mealData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        return await showDialog(
            context: context,
            builder: (BuildContext context) {
              return MealInfoPopup(
                mealIndex: mealIndex,
                programIndex: programIndex,
                title: title,
                image: image,
                mealData: mealData,
              );
            });
      },
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: oliveGreen,
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: CustomText(
                    text: 'meal'.tr,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomText(
                  text: title,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                CustomText(
                  text: description.split('&nbsp;').join(),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: brownishGrey,
                ),
                const Spacer(),
                CustomText(
                  text: 'startsWith'.tr,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: brownishGrey,
                ),
                CustomText(
                  text: price,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: pineGreen,
                ),
              ],
            ),
          ),
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.cover,
                  // height: 178,
                  width: 267,
                  placeholder: (context, url) {
                    return const CustomLoadingWidget();
                  },
                ),
              ),
              Positioned(
                left: 12,
                bottom: 9,
                child: Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: SvgPicture.asset('assets/icons/overlay.svg')),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
