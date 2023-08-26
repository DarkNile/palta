import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/home/view/bottom_nav_screens/subscription/subscription_info.dart';
import 'package:palta/home/widgets/custom_program_card.dart';
import 'package:palta/widgets/custom_body_title.dart';

class ProgramsScreen extends StatelessWidget {
  const ProgramsScreen({
    super.key,
    required this.homeController,
    required this.programIcons,
  });

  final HomeController homeController;
  final List<String> programIcons;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        CustomBodyTitle(
          title: 'programs'.tr,
        ),
        const SizedBox(
          height: 40,
        ),
        Obx(() {
          if (homeController.isProgramsLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Expanded(
            child: ListView.separated(
              itemCount: homeController.programs.length,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 28,
                );
              },
              itemBuilder: (context, index) {
                return CustomProgramCard(
                  title: homeController.programs[index].name!,
                  // subtitle: homeController.programs[index].description!,
                  subtitle: homeController.programs[index].mealData.toString(),
                  image: homeController.programs[index].originalImage!,
                  // icon: homeController.programs.length > 3
                  //     ? 'muscle'
                  //     : programIcons[index],
                  icon: 'subscribe',
                  onTap: () {
                    Get.to(
                      () => SubscriptionInfo(
                        programIndex: index,
                        program: homeController.programs[index],
                        // icon: homeController.programs.length > 3
                        //     ? 'muscle'
                        //     : programIcons[index],
                        icon: 'subscribe',
                        hasCombination: true,
                      ),
                    );
                  },
                );
              },
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
