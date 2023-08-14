import 'package:palta/constants/colors.dart';
import 'package:palta/home/view/bottom_nav_screens/assessment/assessment_questions1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/profile/controllers/profile_controller.dart';
import 'package:palta/widgets/custom_text.dart';

import '../../../../widgets/custom_outlined_button.dart';

class AssessmentScreen extends StatelessWidget {
  const AssessmentScreen({
    super.key,
    required this.homeController,
    required this.profileController,
  });

  final HomeController homeController;
  final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: 290,
            width: width,
            color: pineGreen,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 150,
                ),
                CustomText(
                  text: 'assessment'.tr,
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 4,
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  child: Container(
                    width: width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Image.asset('assets/images/dish.png'),
                        const SizedBox(
                          height: 20,
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: '${'smartAssessment'.tr} ',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: darkGrey,
                              ),
                            ),
                            TextSpan(
                              text: 'smartAssessmentDescription'.tr,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: brownishGrey,
                              ),
                            ),
                          ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomOutlinedButton(
                          onPressed: () {
                            Get.to(() => const AssessmentQuestion1());
                          },
                          title: 'startAssessment'.tr,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
