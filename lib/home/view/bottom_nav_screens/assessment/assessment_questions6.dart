import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/view/bottom_nav_screens/assessment/assessment_result.dart';
import 'package:palta/home/view/home_page.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_text.dart';
import 'package:palta/widgets/custom_text_field.dart';

class AssessmentQuestion6 extends StatefulWidget {
  const AssessmentQuestion6({super.key});

  @override
  State<AssessmentQuestion6> createState() => _AssessmentQuestion6State();
}

class _AssessmentQuestion6State extends State<AssessmentQuestion6> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: paleGrey,
        body: SingleChildScrollView(
          child: Column(
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
                            value: 1,
                            valueColor: AlwaysStoppedAnimation<Color>(avocado),
                            backgroundColor: lightGrey2,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const CustomText(
                        text: '100 %',
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
                  text: 'q6'.tr,
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
                        padding: const EdgeInsets.only(
                          right: 16,
                          left: 16,
                        ),
                        child: Column(children: [
                          CustomText(
                            text: 'heighWeight'.tr,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                          CustomText(
                            text: 'writeHeightWeight'.tr,
                            fontSize: 16,
                            fontWeight: FontWeight.w200,
                            color: darkGrey,
                          ),
                          const SizedBox(
                            height: 38,
                          ),
                          Card(
                              elevation: 4,
                              color: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                              ),
                              child: SizedBox(
                                width: width * 0.8,
                                height: height * 0.49,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                          child: SvgPicture.asset(
                                              'assets/icons/length.svg')),
                                      CustomText(
                                        text: 'heightCm'.tr,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      const CustomTextField(
                                        textInputType: TextInputType.number,
                                      ),
                                      const SizedBox(
                                        height: 33,
                                      ),
                                      CustomText(
                                        text: 'weightKm'.tr,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      const CustomTextField(
                                        textInputType: TextInputType.number,
                                      ),
                                      const SizedBox(
                                        height: 46,
                                      ),
                                      CustomButton(
                                          onPressed: () {
                                            Get.offAll(
                                                () => const AssessmentResult());
                                          },
                                          title: 'result'.tr)
                                    ],
                                  ),
                                ),
                              )),
                        ]),
                      )
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  children: [
                    const CustomText(
                      text: '6 / 6',
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
        ),
      ),
    );
  }
}
