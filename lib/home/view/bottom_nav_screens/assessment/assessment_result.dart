import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/home/view/bottom_nav_screens/subscription/subscription_info.dart';
import 'package:palta/home/view/home_page.dart';
import 'package:palta/widgets/custom_loading_widget.dart';
import 'package:palta/widgets/custom_text.dart';
import 'package:hexcolor/hexcolor.dart';

class AssessmentResult extends StatefulWidget {
  const AssessmentResult({super.key});

  @override
  State<AssessmentResult> createState() => _AssessmentResultState();
}

class _AssessmentResultState extends State<AssessmentResult> {
  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Obx(() {
        if (_homeController.isAssessmentLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: SvgPicture.asset('assets/icons/close.svg'),
                  onPressed: () {
                    Get.offAll(const HomePage());
                  },
                ),
              ),
              CachedNetworkImage(
                imageUrl: _homeController.assessmentResult.value.mbiImage!,
                placeholder: (context, url) {
                  return const CustomLoadingWidget();
                },
              ),
              Center(
                  child: CustomText(
                text: 'assessmentResult'.tr,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: pineGreen,
              )),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                    text: 'bmi'.tr,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  CustomText(
                    text: _homeController.assessmentResult.value.mbi!,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                    text: 'result'.tr,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: HexColor(
                          '#${_homeController.assessmentResult.value.mbiColor!}'),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    alignment: Alignment.center,
                    child: CustomText(
                      text: _homeController.assessmentResult.value.mbiText!,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: CustomText(
                  text: 'followingProgramRecommended'.tr,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: pineGreen,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              InkWell(
                onTap: () {
                  Get.to(
                    () => SubscriptionInfo(
                      program: _homeController.programs.firstWhere((element) =>
                          element.productId.toString() ==
                          _homeController.assessmentResult.value.productId
                              .toString()),
                      icon: 'subscribe',
                      hasCombination: true,
                    ),
                  );
                },
                child: Card(
                    elevation: 4,
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: SizedBox(
                      width: width * 0.8,
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: _homeController
                                .assessmentResult.value.imageUrl!,
                            placeholder: (context, url) {
                              return const CustomLoadingWidget();
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomText(
                                  text: _homeController
                                      .assessmentResult.value.title!,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                CustomText(
                                  text: _homeController
                                      .assessmentResult.value.mealData!,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: brownishGrey,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                // CustomButton(
                                //     onPressed: () {

                                //       Get.to(()=> const SubscriptionInfo(fromAssessment: true,));

                                //     }, title: 'subscribeNow'.tr)
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        );
      }),
    );
  }
}
