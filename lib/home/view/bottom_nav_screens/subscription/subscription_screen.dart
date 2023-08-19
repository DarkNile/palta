import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:palta/home/view/bottom_nav_screens/subscription/subscription_details.dart';
import 'package:palta/home/widgets/custom_subscription_card.dart';
import 'package:palta/profile/controllers/profile_controller.dart';
import 'package:palta/widgets/custom_body_title.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({
    super.key,
    required this.profileController,
  });

  final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        CustomBodyTitle(
          title: 'subscriptions'.tr,
        ),
        Obx(() {
          if (profileController.isUserOrdersByStatusLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (profileController.userOrdersByStatus.isEmpty) {
            return Center(
              child: Lottie.asset(
                'assets/lottie/no_orders.json',
              ),
            );
          }
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 34),
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemBuilder: (context, index) {
                  return CustomSubscriptionCard(
                    status: profileController.userOrdersByStatus[index].status!,
                    title: profileController.userOrdersByStatus[index].name!,
                    date:
                        profileController.userOrdersByStatus[index].dateAdded!,
                    image: profileController.userOrdersByStatus[index].products!
                        .first.originalImage!,
                    onInfoTap: () {
                      Get.to(() => SubscriptionDetails(
                          order: profileController.userOrdersByStatus[index]));
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: profileController.userOrdersByStatus.length,
              ),
            ),
          );
        }),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
