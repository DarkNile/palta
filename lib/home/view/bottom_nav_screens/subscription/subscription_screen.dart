import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
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
          if (profileController.isUserOrdersLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (profileController.userOrders.isEmpty) {
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
                    status: profileController.userOrders[index].status!,
                    title: profileController.userOrders[index].name!,
                    date: profileController.userOrders[index].dateAdded!,
                    image: profileController
                        .userOrders[index].products!.first.originalImage!,
                    // onChangeMeals: () {},
                    onInfoTap: () {},
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: profileController.userOrders.length,
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
