import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/home/view/bottom_nav_screens/subscription/subscription_info.dart';
import 'package:palta/home/widgets/custom_guide_item.dart';
import 'package:palta/profile/controllers/profile_controller.dart';
import 'package:palta/widgets/custom_body_title.dart';
import 'package:palta/widgets/custom_text.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({
    super.key,
    required this.homeController,
    required this.profileController,
  });

  final HomeController homeController;
  final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        CustomBodyTitle(
          title: 'guides'.tr,
        ),
        const SizedBox(
          height: 40,
        ),
        Obx(() {
          if (profileController.isConactNadaLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return profileController.contact.value.showSubscription! == 'false'
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: CustomText(
                        text: 'understandYourBody'.tr,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: CustomText(
                        text: 'captainInstructions'.tr,
                      ),
                    ),
                  ],
                )
              : Obx(() {
                  if (homeController.isGuidancesLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) {
                        return CustomGuideItem(
                          title: homeController.guidances[index].name!,
                          date: homeController.guidances[index].dateAvailable!,
                          image: homeController.guidances[index].originalImage!,
                          onTap: () {
                            Get.to(
                              () => SubscriptionInfo(
                                // programIndex: index,
                                hasCombination: false,
                                program: homeController.guidances[index],
                              ),
                            );
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
                      itemCount: homeController.guidances.length,
                    ),
                  );
                });
        }),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
