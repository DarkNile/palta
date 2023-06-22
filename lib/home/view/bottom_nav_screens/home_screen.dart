import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/home/view/bottom_nav_screens/assessment/assessment_questions1.dart';
import 'package:palta/home/widgets/custom_home_card.dart';
import 'package:palta/home/widgets/custom_program_card.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_animated_smooth_indicator.dart';
import 'package:palta/widgets/custom_loading_widget.dart';
import 'package:palta/widgets/custom_outlined_button.dart';
import 'package:palta/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.homeController});

  final HomeController homeController;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _activeIndex = 0;

  final List<String> titles = [
    'possibilityToChange',
    'possibilityToStop',
    'possibilityToRequest'
  ];
  final List<String> icons = ['change', 'stop_subscription', 'explanation'];

  final List<String> programTitles = [
    'bodyProgramTitle',
    'fitnessProgramTitle',
    'balanceProgramTitle'
  ];
  final List<String> programSubtitles = [
    'bodyProgramSubtitle',
    'fitnessProgramSubtitle',
    'balanceProgramSubtitle'
  ];
  final List<String> programImages = [
    'body_program',
    'body_program_2',
    'body_program_3'
  ];
  final List<String> programIcons = ['muscle', 'fitness', 'weight'];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Obx(() {
                if (widget.homeController.isBannersLoading.value) {
                  return SizedBox(
                    width: width,
                    height: 379,
                    child: const CustomLoadingWidget(),
                  );
                }
                return CarouselSlider.builder(
                    itemCount: widget.homeController.banners.length,
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      autoPlay: true,
                      height: 379,
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _activeIndex = index;
                        });
                      },
                    ),
                    itemBuilder: (context, index, page) {
                      return Stack(
                        alignment: AlignmentDirectional.bottomStart,
                        children: [
                          CachedNetworkImage(
                            imageUrl: widget.homeController.banners[index]
                                ['image'],
                            width: width,
                            height: 379,
                            fit: BoxFit.cover,
                            placeholder: (context, url) {
                              return const CustomLoadingWidget();
                            },
                          ),
                          Positioned(
                            bottom: 51,
                            right: AppUtil.rtlDirection(context) ? 29 : 0,
                            left: AppUtil.rtlDirection(context) ? 0 : 29,
                            child: CustomAnimatedSmoothIndicator(
                              count: widget.homeController.banners.length,
                              activeIndex: _activeIndex,
                            ),
                          ),
                        ],
                      );
                    });
              }),
              Positioned(
                left: 16,
                right: 16,
                top: 339,
                bottom: -100,
                child: SizedBox(
                  height: 140,
                  child: ListView.separated(
                    itemCount: 3,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 12,
                      );
                    },
                    itemBuilder: (context, index) {
                      return CustomHomeCard(
                        title: titles[index],
                        icon: icons[index],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 134,
          ),
          CustomText(
            text: 'subscribeToProgram'.tr,
            textAlign: TextAlign.center,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: darkGrey,
          ),
          const SizedBox(
            height: 28,
          ),
          Obx(() {
            if (widget.homeController.isProgramsLoading.value) {
              return const CustomLoadingWidget();
            }
            return ListView.separated(
              itemCount: widget.homeController.programs.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 28,
                );
              },
              itemBuilder: (context, index) {
                return CustomProgramCard(
                  title: widget.homeController.programs[index].name!,
                  subtitle: widget.homeController.programs[index].description!,
                  image: widget.homeController.programs[index].originalImage!,
                  icon: programIcons[index],
                  onTap: () {},
                );
              },
            );
          }),
          const SizedBox(
            height: 28,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
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
                      height: 1,
                    ),
                    Image.asset('assets/images/dish.png'),
                    const SizedBox(
                      height: 21,
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
                      height: 21,
                    ),
                    CustomOutlinedButton(
                      onPressed: () {
                        Get.to(() => const AssessmentQuestion1());
                      },
                      title: 'startAssessment'.tr,
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 46,
          ),
        ],
      ),
    );
  }
}
