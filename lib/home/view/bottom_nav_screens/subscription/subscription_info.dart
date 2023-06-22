import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/view/bottom_nav_screens/assessment/assessment_result.dart';
import 'package:palta/home/view/bottom_nav_screens/subscription/meal_info_popup.dart';
import 'package:palta/home/view/bottom_nav_screens/subscription/subscribe_now_sheet.dart';
import 'package:palta/home/view/home_page.dart';
import 'package:palta/home/widgets/custom_home_card.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_text.dart';
import 'package:palta/widgets/custom_text_field.dart';

import '../../../../utils/app_util.dart';
import 'dart:math' as math;

import '../../../../widgets/custom_app_bar_clip_path.dart'; // import this

class SubscriptionInfo extends StatefulWidget {
  const SubscriptionInfo({super.key, this.fromAssessment = false});

  final bool fromAssessment;

  @override
  State<SubscriptionInfo> createState() => _SubscriptionInfoState();
}

class _SubscriptionInfoState extends State<SubscriptionInfo> {
  List breakfastInfo = [
    {'image': 'assets/images/sandwich_2.png', 'name': 'كلوب سانددويتش'},
    {
      'image': 'assets/images/cover_7.png',
      'name': 'جرانولا',
    },
  ];

  List controlList = [
    {
      'image': 'assets/icons/change_outlined.svg',
      'name': 'possibilityChangeAndReplaceMeals'.tr
    },
    {
      'image': 'assets/icons/calendar.svg',
      'name': 'possibilityCancelTheSubscription'.tr
    },
    {
      'image': 'assets/icons/explanation.svg',
      'name': 'possibilityToRequestNutritionalAdvice'.tr
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipPath(
                        clipper: CustomAppBarClipPath(),
                        child: Container(
                          width: width,
                          height: 300,
                          child: Image.asset(
                            'assets/images/Rectangle 22864.png',
                            fit: BoxFit.fitHeight,
                          ),
                        )),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Center(
                      child: CustomText(
                        text: 'bodySculptingProgram'.tr,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Center(
                      child: CustomText(
                        text: 'forThoseWishingToMaintainWeight'.tr,
                        fontSize: 14,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: const SizedBox(
                          width: 48,
                          child: Divider(
                            color: darkGrey,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    widget.fromAssessment
                        ? Container(
                            color: offWhite,
                            height: 82,
                            padding: const EdgeInsets.symmetric(horizontal: 36),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      CustomText(
                                        text: 'calories'.tr,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        width: 63,
                                        height: 26,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: orange,
                                        ),
                                        child: const Center(
                                          child: CustomText(
                                            text: '220',
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CustomText(
                                        text: 'carbohydrates'.tr,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        width: 63,
                                        height: 26,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: orange,
                                        ),
                                        child: const Center(
                                          child: CustomText(
                                            text: '220',
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CustomText(
                                        text: 'fat'.tr,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        width: 63,
                                        height: 26,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: orange,
                                        ),
                                        child: const Center(
                                          child: CustomText(
                                            text: '220',
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CustomText(
                                        text: 'protein'.tr,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        width: 63,
                                        height: 26,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: orange,
                                        ),
                                        child: const Center(
                                          child: CustomText(
                                            text: '220',
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ]),
                          )
                        : Container(),
                    Padding(
                      padding: AppUtil.rtlDirection(context)
                          ? const EdgeInsets.only(top: 20, right: 28)
                          : const EdgeInsets.only(top: 20, left: 28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'breakfastDishes'.tr,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(
                            height: 21,
                          ),
                          Container(
                            height: 250,
                            width: double.infinity,
                            child: ListView.separated(
                                itemCount: breakfastInfo.length,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: 17,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(10)),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          breakfastInfo[index]
                                                              ['image'],
                                                        ),
                                                        fit: BoxFit.cover)),
                                                height: 178,
                                                width: 267,

                                                  
                                              ),
                                              Positioned(
                                                left: 12,
                                                bottom: 9,
                                                child: InkWell(
                                                  onTap: () async {
                                                  return await  showDialog( context: context, builder: (BuildContext context) {
                                                      return const MealInfoPopup();
                                                     });
                                                  },
                                                  child: Container(
                                                    height: 35,
                                                    width: 35,
                                                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(20))),
                                                    child:SvgPicture.asset('assets/icons/overlay.svg')),
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CustomText(
                                              text: breakfastInfo[index]
                                                  ['name'],
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ]),
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 6,
                      color: paleGrey,
                    ),
                    Padding(
                      padding: AppUtil.rtlDirection(context)
                          ? const EdgeInsets.only(top: 20, right: 28)
                          : const EdgeInsets.only(top: 20, left: 28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'lunchDishes'.tr,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(
                            height: 21,
                          ),
                          Container(
                            height: 250,
                            width: double.infinity,
                            child: ListView.separated(
                                itemCount: breakfastInfo.length,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: 17,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(10)),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          breakfastInfo[index]
                                                              ['image'],
                                                        ),
                                                        fit: BoxFit.cover)),
                                                height: 178,
                                                width: 267,

                                                  
                                              ),
                                              Positioned(
                                                left: 12,
                                                bottom: 9,
                                                child: InkWell(
                                                  onTap: () async {
                                                  return await  showDialog( context: context, builder: (BuildContext context) {
                                                      return const MealInfoPopup();
                                                     });
                                                  },
                                                  child: Container(
                                                    height: 35,
                                                    width: 35,
                                                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(20))),
                                                    child:SvgPicture.asset('assets/icons/overlay.svg')),
                                                ),
                                              )
                                            ],
                                          ),
                                          
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CustomText(
                                              text: breakfastInfo[index]
                                                  ['name'],
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ]),
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 6,
                      color: paleGrey,
                    ),
                    Padding(
                      padding: AppUtil.rtlDirection(context)
                          ? const EdgeInsets.only(top: 20, right: 28)
                          : const EdgeInsets.only(top: 20, left: 28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'dinnerDishes'.tr,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(
                            height: 21,
                          ),
                          Container(
                            height: 250,
                            width: double.infinity,
                            child: ListView.separated(
                                itemCount: breakfastInfo.length,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: 17,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                           Stack(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(10)),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          breakfastInfo[index]
                                                              ['image'],
                                                        ),
                                                        fit: BoxFit.cover)),
                                                height: 178,
                                                width: 267,

                                                  
                                              ),
                                              Positioned(
                                                left: 12,
                                                bottom: 9,
                                                child: InkWell(
                                                  onTap: () async {
                                                  return await  showDialog( context: context, builder: (BuildContext context) {
                                                      return const MealInfoPopup();
                                                     });
                                                  },
                                                  child: Container(
                                                    height: 35,
                                                    width: 35,
                                                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(20))),
                                                    child:SvgPicture.asset('assets/icons/overlay.svg')),
                                                ),
                                              )
                                            ],
                                          ),
                                          
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CustomText(
                                              text: breakfastInfo[index]
                                                  ['name'],
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ]),
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: AppUtil.rtlDirection(context)
                          ? const EdgeInsets.only(top: 29, right: 28)
                          : const EdgeInsets.only(top: 29, left: 28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              child: Center(
                                  child: CustomText(
                            text: 'throughAccountYouCanControl'.tr,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.center,
                          ))),
                          const SizedBox(
                            height: 21,
                          ),
                          Container(
                            height: 160,
                            width: double.infinity,
                            child: ListView.separated(
                                itemCount: controlList.length,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: 17,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(vertical: 15),
                                    // height: 20,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 7,
                                              spreadRadius: 3,
                                              color: lighGrey,
                                              offset: Offset(2, 5))
                                        ],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      width: 173,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                              controlList[index]['image']),
                                          Spacer(),
                                          CustomText(
                                            text: controlList[index]['name'],
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                ),
                Positioned(
                  top: height * 0.27,
                  right: width * 0.38,
                  child: Container(
                    width: 90.0,
                    height: 90.0,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: lightGrey2,
                            blurRadius: 4,
                            spreadRadius: 2,
                            offset: Offset(0, 3))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    child: SvgPicture.asset('assets/icons/fitness.svg'),
                  ),
                ),
                Positioned(
                  top: 43,
                  child: SizedBox(
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [
                          Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            child: Center(
                                child:
                                    SvgPicture.asset('assets/icons/share.svg')),
                          ),
                          const Spacer(),
                          Transform.flip(
                            flipX: AppUtil.rtlDirection(context) ? true : false,
                            child: Container(
                              width: 30.0,
                              height: 30.0,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              child: Center(
                                  child: SvgPicture.asset(
                                      'assets/icons/arrowRight.svg')),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: width,
                height: 78,
                color: Colors.white,
                child: Row(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'startFrom'.tr,
                        fontSize: 12,
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: '250' + ' ',
                            fontSize: 20,
                            color: avocado,
                          ),
                          CustomText(text: 'riyal'.tr),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 240,
                    child: CustomButton(
                        onPressed: () {
                          //   Get.to(() => const SubscriptionNowSheet());
                          showModalBottomSheet<void>(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            builder: (BuildContext context) {
                              return const SubscriptionNowSheet();
                            },
                          );
                        },
                        title: 'subscribeNow'.tr),
                  )
                ]),
              ))
        ],
      ),
    );
  }
}
