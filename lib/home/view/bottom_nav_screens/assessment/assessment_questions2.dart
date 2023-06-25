import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/view/home_page.dart';
import 'package:palta/widgets/custom_text.dart';

import 'assessment_questions3.dart';

class AssessmentQuestion2 extends StatefulWidget {
  const AssessmentQuestion2({super.key});

  @override
  State<AssessmentQuestion2> createState() => _AssessmentQuestion2State();
}

class _AssessmentQuestion2State extends State<AssessmentQuestion2> {
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
                        value: 0.2,
                        valueColor: AlwaysStoppedAnimation<Color>(avocado),
                        backgroundColor: lightGrey2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const CustomText(
                    text: '20 %',
                    fontSize: 16,
                  )
                ],
              ),
            ),
          ),
          Container(
            width: width,
            height: 40,
            color: pineGreen,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            child: CustomText(
              text: 'q2'.tr,
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: height * 0.78,
            child: ListView(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: 16,
                      left: 16,
                    ),
                    child: Column(children: [
                      CustomText(
                        text: 'howOldAreYou'.tr,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                      CustomText(
                        text: 'ChooseAverageAge'.tr,
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
                              Get.to(() => const AssessmentQuestion3());
                            },
                            child: Card(
                                elevation: 4,
                                color: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                ),
                                child: Container(
                                  width: width * 0.4,
                                  height: 112,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CustomText(
                                        text: '14  : 12',
                                        fontSize: 18,
                                      ),
                                      CustomText(
                                        text: 'years'.tr,
                                        fontSize: 14,
                                        color: brownishGrey,
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
                              Get.to(() => const AssessmentQuestion3());
                            },
                            child: Card(
                                elevation: 4,
                                color: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                ),
                                child: SizedBox(
                                  width: width * 0.42,
                                  height: 112,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CustomText(
                                        text: '18  : 15',
                                        fontSize: 18,
                                      ),
                                      CustomText(
                                        text: 'years'.tr,
                                        fontSize: 14,
                                        color: brownishGrey,
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => const AssessmentQuestion3());
                            },
                            child: Card(
                                elevation: 4,
                                color: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                ),
                                child: SizedBox(
                                  width: width * 0.42,
                                  height: 112,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CustomText(
                                        text: '25  : 19',
                                        fontSize: 18,
                                      ),
                                      CustomText(
                                        text: 'years'.tr,
                                        fontSize: 14,
                                        color: brownishGrey,
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
                              Get.to(() => const AssessmentQuestion3());
                            },
                            child: Card(
                                elevation: 4,
                                color: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                ),
                                child: SizedBox(
                                  width: width * 0.42,
                                  height: 112,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CustomText(
                                        text: '54  : 26',
                                        fontSize: 18,
                                      ),
                                      CustomText(
                                        text: 'years'.tr,
                                        fontSize: 14,
                                        color: brownishGrey,
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => const AssessmentQuestion3());
                            },
                            child: Card(
                                elevation: 4,
                                color: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                ),
                                child: SizedBox(
                                  width: width * 0.42,
                                  height: 112,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CustomText(
                                        text: '59  : 55',
                                        fontSize: 18,
                                      ),
                                      CustomText(
                                        text: 'years'.tr,
                                        fontSize: 14,
                                        color: brownishGrey,
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
                              Get.to(() => const AssessmentQuestion3());
                            },
                            child: Card(
                                elevation: 4,
                                color: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                ),
                                child: SizedBox(
                                  width: width * 0.42,
                                  height: 112,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CustomText(
                                        text: '60',
                                        fontSize: 18,
                                      ),
                                      CustomText(
                                        text: 'years'.tr,
                                        fontSize: 14,
                                        color: brownishGrey,
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                    ]),
                  )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Row(
              children: [
                const CustomText(
                  text: '6 / 2',
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: darkGrey,
                ),
                const Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
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
