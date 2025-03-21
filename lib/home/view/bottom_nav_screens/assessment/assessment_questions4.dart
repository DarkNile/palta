import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/home/view/bottom_nav_screens/assessment/assessment_questions5.dart';
import 'package:palta/home/view/home_page.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_text.dart';

class AssessmentQuestion4 extends StatefulWidget {
  const AssessmentQuestion4({super.key});

  @override
  State<AssessmentQuestion4> createState() => _AssessmentQuestion4State();
}

class _AssessmentQuestion4State extends State<AssessmentQuestion4> {
  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: paleGrey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: 100,
            color: paleGrey,
            child: Padding(
              padding: const EdgeInsets.only(right: 17, left: 10, top: 23),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 24,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: 250,
                    height: 6,
                    child: const ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: 0.5,
                        valueColor: AlwaysStoppedAnimation<Color>(avocado),
                        backgroundColor: lightGrey2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const CustomText(
                    text: '60 %',
                    fontSize: 16,
                  )
                ],
              ),
            ),
          ),
          Container(
            width: width,
            height: 50,
            color: pineGreen,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            alignment: AppUtil.rtlDirection(context)
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: CustomText(
              text: 'q4'.tr,
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: height * 0.78,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(right: 16, left: 16, top: 30),
                child: Column(children: [
                  CustomText(
                    text: 'WhatBestPicture'.tr,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                  CustomText(
                    text: 'chooseYourBodyShape'.tr,
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                    color: darkGrey,
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          _homeController.step5('1');
                          Get.to(() => const AssessmentQuestion5());
                        },
                        child: Card(
                            elevation: 4,
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                            child: SizedBox(
                              width: width * 0.4,
                              height: 250,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/icons/shape_2.svg'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                        child: CustomText(
                                      text: 'hourglassBody'.tr,
                                      fontSize: 18,
                                    )),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          _homeController.step5('2');
                          Get.to(() => const AssessmentQuestion5());
                        },
                        child: Card(
                            elevation: 4,
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                            child: SizedBox(
                              width: width * 0.4,
                              height: 250,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/icons/shape_1.svg'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CustomText(
                                      text: 'rectangleBody'.tr,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          _homeController.step5('3');
                          Get.to(() => const AssessmentQuestion5());
                        },
                        child: Card(
                            elevation: 4,
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                            child: SizedBox(
                              width: width * 0.4,
                              height: 250,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/icons/shape_3.svg'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CustomText(
                                      text: 'appleBody'.tr,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          _homeController.step5('4');
                          Get.to(() => const AssessmentQuestion5());
                        },
                        child: Card(
                            elevation: 4,
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                            child: SizedBox(
                              width: width * 0.4,
                              height: 250,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/icons/shape_5.svg'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CustomText(
                                      text: 'pearBody'.tr,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Row(
              children: [
                const CustomText(
                  text: '6 / 4',
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: darkGrey,
                ),
                const Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  child: Divider(
                    height: 20,
                    thickness: 1,
                    color: pinkishGrey,
                  ),
                )),
                InkWell(
                  onTap: () {
                    Get.offAll(const HomePage());
                  },
                  child: CustomText(
                    text: 'cancel'.tr,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: darkGrey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
