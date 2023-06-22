import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/widgets/custom_outlined_button.dart';
import 'package:palta/widgets/custom_text.dart';

class CustomSubscriptionCard extends StatelessWidget {
  const CustomSubscriptionCard({
    super.key,
    required this.status,
    required this.title,
    required this.date,
    required this.image,
    // required this.onChangeMeals,
    required this.onInfoTap,
  });

  final String status;
  final String title;
  final String date;
  final String image;
  // final VoidCallback onChangeMeals;
  final VoidCallback onInfoTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 91,
                height: 29,
                alignment: Alignment.center,
                // color: status == 'لديك 4 ايام' ? reddish : brownGrey,
                color: reddish,
                child: CustomText(
                  text: status,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: title,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomText(
                          text: date,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: CachedNetworkImageProvider(image),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                // if (status == 'لديك 4 ايام')
                //   CustomOutlinedButton(
                //     onPressed: onChangeMeals,
                //     title: 'changeMeals'.tr,
                //   ),
                // if (status == 'لديك 4 ايام')
                //   const SizedBox(
                //     height: 11,
                //   ),
                CustomOutlinedButton(
                  onPressed: onInfoTap,
                  title: 'subscriptionInfo'.tr,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 26,
          ),
        ],
      ),
    );
  }
}
