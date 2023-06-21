import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
            padding: EdgeInsets.only(right: 20, top: 6),
            child: const CustomText(
              text: 'السؤال الأول',
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
         Container(
          height:height* 0.78,
          child: ListView(
            shrinkWrap: true,
    physics: AlwaysScrollableScrollPhysics(),
            children: [
            
          Padding(
            padding: EdgeInsets.only(right: 16, left: 16,),
            child: Column(children: [
              const CustomText(
                text: 'ماهو هدفك .؟',
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
              CustomText(
                text: 'إختر هدفك لمعرفة أي نظام غذائي يناسبك',
                fontSize: 16,
                fontWeight: FontWeight.w200,
                color: darkGrey,
              ),
              SizedBox(
                height: 38,
              ),
              InkWell(
                onTap: () {
                  Get.to(()=> const AssessmentQuestion2());
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
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'خسارة الوزن ونحت الجسم',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomText(
                              text: 'الحفاظ على الوزن وتشكيل جسم متناسق مثالى',
                              fontSize: 14,
                              fontWeight: FontWeight.w200,
                              color: darkGrey,
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
                  Get.to(()=> AssessmentQuestion2());
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
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'زيادة الوزن ',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomText(
                              text: 'نحيف وتحتاج لزيادة وزنك بشكل صحى',
                              fontSize: 14,
                              fontWeight: FontWeight.w200,
                              color: darkGrey,
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
                  Get.to(()=> AssessmentQuestion2());
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
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'الحفاظ على الوزن',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomText(
                              text: 'لديك وزن مثالى وترغب في الحفاظ علية',
                              fontSize: 14,
                              fontWeight: FontWeight.w200,
                              color: darkGrey,
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
                  Get.to(()=> AssessmentQuestion2());
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
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'بناء العضلات',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomText(
                              text: 'هل تحتاج لزيادة الكتلة العضلية في جسمك ',
                              fontSize: 14,
                              fontWeight: FontWeight.w200,
                              color: darkGrey,
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
          )
        
          ]),
         ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  children: [
                    CustomText(
                              text: '6 / 1',
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: darkGrey,
                            ),
              Expanded(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child:   Divider(
                  
                  height: 20,thickness:1, color:pinkishGrey,),
              )),
                            InkWell(
                              onTap: () {
                                Get.off(HomePage());
                              },
                              child: CustomText(
                                text: 'إلغاء',
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
