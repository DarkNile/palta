import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/view/home_page.dart';
import 'package:palta/widgets/custom_text.dart';

class AssessmentResult extends StatefulWidget {
  const AssessmentResult({super.key});

  @override
  State<AssessmentResult> createState() => _AssessmentResultState();
}

class _AssessmentResultState extends State<AssessmentResult> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
            Image.asset(
              'assets/images/dish.png',
              height: 121,
            ),
            const SizedBox(
              height: 6,
            ),
            Center(
                child: CustomText(
              text: 'assessmentResult'.tr,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            )),
            Center(
                child: CustomText(
              text: 'followingProgramRecommended'.tr,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            )),
            Card(
                elevation: 4,
                color: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: SizedBox(
                  width: width * 0.8,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/body_program_3.png',
                        fit: BoxFit.fitWidth,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            CustomText(
                              text: 'bodySculptingProgram'.tr,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                            const SizedBox(
                              height: 27,
                            ),
                            Row(
                              children: [
                                CustomText(
                                  text: 'calories'.tr,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                Spacer(),
                                Container(
                                  width: 90,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: iceBlue,
                                  ),
                                  child: const Center(
                                    child: CustomText(
                                      text: '220',
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                CustomText(
                                  text: 'carbohydrates'.tr,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                const Spacer(),
                                Container(
                                  width: 90,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: iceBlue,
                                  ),
                                  child: const Center(
                                    child: CustomText(
                                      text: '40',
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                CustomText(
                                  text: 'fat'.tr,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                const Spacer(),
                                Container(
                                  width: 90,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: iceBlue,
                                  ),
                                  child: const Center(
                                    child: CustomText(
                                      text: '15',
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                CustomText(
                                  text: 'protein'.tr,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                const Spacer(),
                                Container(
                                  width: 90,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: iceBlue,
                                  ),
                                  child: const Center(
                                    child: CustomText(
                                      text: '30',
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 40,
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
          ],
        ),
      ),
    );
  }
}
