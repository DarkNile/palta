import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/home/widgets/custom_subscription_card.dart';
import 'package:palta/widgets/custom_body_title.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

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
        const SizedBox(
          height: 34,
        ),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemBuilder: (context, index) {
              return CustomSubscriptionCard(
                status: index.isEven ? 'لديك 4 ايام' : 'انتهى',
                title: 'برنامج نحت وتنسيق الجسم',
                date: '10/12/2023',
                image: 'assets/images/body_program_3.png',
                onChangeMeals: () {},
                onInfoTap: () {},
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 20,
              );
            },
            itemCount: 10,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
