import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/view/bottom_nav_screens/assessment/assessment_questions2.dart';
import 'package:palta/home/view/home_page.dart';
import 'package:palta/widgets/custom_text.dart';

class AssessmentQuestion1 extends StatefulWidget {
  const AssessmentQuestion1({super.key});

  @override
  State<AssessmentQuestion1> createState() => _AssessmentQuestion1State();
}

class _AssessmentQuestion1State extends State<AssessmentQuestion1> {
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
              padding: const EdgeInsets.only(right: 17, left: 20, top: 23),
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
                    width: 12,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: 250,
                    height: 6,
                    child: const ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: 0.088,
                        valueColor: AlwaysStoppedAnimation<Color>(avocado),
                        backgroundColor: lightGrey2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  const CustomText(
                    text: '0 %',
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
              text: 'q1'.tr,
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          LimitedBox(
            maxHeight: height * 0.78,
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 20),
              child: Column(children: [
                CustomText(
                  text: 'whatIsGoal'.tr,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
                CustomText(
                  text: 'chooseYourGoal'.tr,
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: darkGrey,
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const AssessmentQuestion2());
                  },
                  child: Card(
                    elevation: 4,
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 27),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/fitness.svg'),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'WeightLoss'.tr,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                width: width * 0.65,
                                child: CustomText(
                                  text: 'maintainingWight'.tr,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w200,
                                  color: darkGrey,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const AssessmentQuestion2());
                  },
                  child: Card(
                    elevation: 4,
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 27),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/Layer_35.svg'),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'weightGain'.tr,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                width: width * 0.67,
                                child: CustomText(
                                  text: 'slimYouNeedGainWeight'.tr,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w200,
                                  color: darkGrey,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => AssessmentQuestion2());
                  },
                  child: Card(
                    elevation: 4,
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 27),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/machine.svg'),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'maintainingWeight'.tr,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                width: width * 0.67,
                                child: CustomText(
                                  text: 'YouIdealWeightWantMaintain'.tr,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w200,
                                  color: darkGrey,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const AssessmentQuestion2());
                  },
                  child: Card(
                    elevation: 4,
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 27),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/muscle.svg'),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'muscleBuilding'.tr,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                width: width * 0.67,
                                child: CustomText(
                                  text: 'needIncreaseMuscle'.tr,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w200,
                                  color: darkGrey,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
              ]),
            )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Row(
              children: [
                const CustomText(
                  text: '6 / 1',
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
                    Get.offAll(HomePage());
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
